open Jest
open Expect

external introspectionQ: string = "introspectionQuery" [@@bs.module "graphql"]


let print_position (lexbuf: Lexing.lexbuf) =
  let start_p = Lexing.lexeme_start_p lexbuf in
  let end_p = Lexing.lexeme_end_p lexbuf in
  Printf.sprintf "line %d: char %d..%d: %s"
    start_p.pos_lnum
    (start_p.pos_cnum - start_p.pos_bol + 1)
    (end_p.pos_cnum - end_p.pos_bol + 1)

let print_token (lexbuf: Lexing.lexbuf) (msg)=
  let tok = Lexing.lexeme lexbuf in
  Printf.sprintf "%s: Unexpected token %s" msg tok

let parse_with_error_s lexbuf =
  try Gql_parser.document (fun b -> Gql_lexer.read b) lexbuf with
  | Gql_lexer.LexError message ->
    Js.Exn.raiseError (print_position lexbuf  ("GraphQL syntax error: " ^ message))
  | Gql_parser.Error ->
    Js.Exn.raiseError (print_position lexbuf (print_token lexbuf "GraphQL syntax error"))

let parse_schema = parse_with_error_s

let parse_executable_string(s: string) = Gql_ast.document_to_executable_document (parse_schema (Lexing.from_string s))

let parse_schema_string(s: string) =  Gql_ast.document_to_schema_document (parse_schema (Lexing.from_string s))


let parse_trans = Gql_parser.trans_document Gql_lexer.read
let parse_trans_string(s: string) = parse_trans (Lexing.from_string s)


let testPrograms n (schema: string) (t: string) (p1: string) (p2: string): unit =
  test n (
    fun () -> expect (Js_utils.executable_document_to_js (
        Transform.executable (Transform.transform (parse_schema_string schema) (parse_trans_string t)) (parse_executable_string p1)))
              |> toEqual (Js_utils.executable_document_to_js (parse_executable_string p2))
  )

let () =
  describe "Transform" (fun () -> 
      describe "executable" (fun () -> 
          testPrograms
            "introspection"
            "
            type Query {
              field: String
            }
            "
            "
            transform type Query {
              f1: field
            }
            "
            introspectionQ
            introspectionQ;
          testPrograms
            "inline internal"
            "
            type Query {
              field: String
            }
            "
            "
            transform type Query {
              f1: field
            }
            "
            "
              query IntrospectionQuery {
                ... on __Type {
                  kind
                }
              }

            "
            "
            query IntrospectionQuery {
                ... on __Type {
                  kind
                }
              }

            ";
          testPrograms
            "rename Query"
            "
            type Query {
              field: String
            }
            "
            "
            transform type Q: Query {
              f1: field
            }
            "
            "
            query {
              f1
            }
            "
            "
            query {
              f1: field
            }

            ";

          testPrograms
            "field alias"
            "
            type Query {
              field: String
            }
            "
            "
            transform type Query {
              f1: field
            }
            "
            "
            query {
              f1
            }
            "
            "
            query {
              f1: field
            }
            ";
          testPrograms
            "type alias"
            "
            type T {
              f2: String
            }
            type Query {
              f1: T
            }
            "
            "
            transform type X: T
            "
            "
            query {
              f1 {
                f2
              }
            }
            "
            "
            query {
              f1 {
                f2
              }
            }
            ";
          testPrograms
            "mutiple field alias"
            "
            type Query {
              field: String
            }
            "
            "
            transform type Query {
              f1: field
              f2: field
            }
            "
            "
            query {
              f1
              f2
            }
            "
            "
            query {
              f1: field
              f2: field
            }
            ";
          testPrograms
            "fix arg"
            "
            type Query {
              field(a1: String): String
            }
            "
            "
            transform type Query {
              f1: field(a1 = \"foobar\")
            }
            "
            "
            query {
              f1
            }
            "
            "
            query {
              f1: field(a1: \"foobar\")
            }
            ";
          testPrograms
            "fix input"
            "

            input I {
              f1: String
              f2: String
            }
            type Query {
              field(a1: I): String
            }
            "
            "
            transform input I {
              f2 = \"foobar\"
            }
            "
            "
            query {
              field(a1: {f1: \"bar\"})
            }
            "
            "
            query {
              field(a1: {f1: \"bar\" f2: \"foobar\"})
            }
            ";
          testPrograms
            "transform arguments"
            "
            type Query {
              field(a1: String!): String
            }
            "
            "
            transform type Query
            "
            "
            query($a : String!) {
              field(a1 : $a)
            }
            "
            "
            query($a : String!) {
              field(a1 : $a)
            }
            ";
          testPrograms
            "fix directive"
            "
            input I {
              f1: String
              f2: String
            }
            directive @d(a1: I) on QUERY

            type Query {
              field(a1: String): String
            }
            "
            "
            transform input I {
              f2 = \"foo\"
            }
            "
            "
            query @d(a1: {f1 : \"bar\"})
            {
              field @d(a1: {f1 : \"bar\"})
            }
            "
            "
            query @d(a1: {f1 : \"bar\", f2: \"foo\"}) 
            {
              field @d(a1: {f1 : \"bar\", f2: \"foo\"}) 
            }
            ";
          testPrograms
            "fix type argument"
            "
            type A {
              fa: String
            }

            type B {
              fb: String
            }
            union U = A | B
            type Query {
              u: U
            }
            "
            "
            transform type AA: A
            transform type BB: B
            "
            "
            query
            {
              u {
                ... on AA {
                  fa
                }
                ... on BB {
                  fb
                }
              }
            }
            "
            "
            query
            {
              u {
                ... on A {
                  fa
                }
                ... on B {
                  fb
                }
              }
            }
            ";
          testPrograms
            "filter sytem fields"
            "
            type Query {
              field: String
            }
            "
            "
            transform type Query
            "
            "
            query
            {
              field
              __someInternalField
            }
            "
            "
            query
            {
              field
              __someInternalField
            }
            ";

          testPrograms
            "fix type argument"
            "
            type A {
              fa: String
            }

            type B {
              fb: String
            }
            union U = A | B
            type Query {
              u: U
            }
            "
            "
            transform type AA: A
            transform type BB: B
            "
            "
            fragment fa on AA {
              fa
            } 
            fragment fb on BB {
              fb
            }           
            query
            {
              u {
                ... fa
                ... fb
              }
            }
            "
            "
            fragment fa on A {
              fa
            } 
            fragment fb on B {
              fb
            }

            query
            {
              u {
                ...fa
                ...fb
              }
            }
            ";
        )
    )
