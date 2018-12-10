open Jest
open Expect

external introspectionQ: string = "introspectionQuery" [@@bs.module "graphql"]

let parse_schema = Gql_parser.document Gql_lexer.read

let parse_executable_string(s: string) = Gql_ast.document_to_executable_document (parse_schema (Lexing.from_string s))

let () =
  describe "Transform" (fun () -> 
      describe "executable" (fun () -> 
          test "transform json" (
            fun () -> expect (Js_utils.js_to_executable_document (Js_utils.executable_document_to_js (parse_executable_string introspectionQ)))
                      |> toEqual (parse_executable_string introspectionQ)
          )
        )
    )