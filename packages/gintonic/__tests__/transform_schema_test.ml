open Jest
open Expect

exception Error

external readFileSync: name: string -> (_ [@bs.as "utf8"]) -> string = "readFileSync" [@@bs.module "fs"]

let parseS = Gql_parser.document (fun buf -> Js.log(Lexing.lexeme buf); Gql_lexer.read buf)

let parseSS(s: string) = Gql_ast.document_to_schema_document (parseS (Lexing.from_string s))


let parseT = Trans_parser.document Trans_lexer.read
let parseTS(s: string) = parseT (Lexing.from_string s)


let testPrograms n (p1: string) (t: string) (p2: string): unit =
  test n (
    fun () ->
      expect 
        (Js_utils.schema_document_to_js (Transform.schema (Transform.transform (parseSS p1) (parseTS t)))) 
      |> toEqual (Js_utils.schema_document_to_js (parseSS p2))
  )

let testProgramsShouldSuccede n p t: unit =
    test n (
        fun () -> let _ = (Js_utils.schema_document_to_js (Transform.schema (Transform.transform (parseSS p) (parseTS t)))) in  pass
    )

let () =
  describe "Transform" (fun () -> 
      describe "schema" (fun () -> 
          testProgramsShouldSuccede
            "large schema"
            (readFileSync ~name:"./__tests__/resources/schema.graphql")
            (readFileSync ~name:"./__tests__/resources/transformation.graphqlt");
          testProgramsShouldSuccede
            "public schema"
            (readFileSync ~name:"./__tests__/resources/public.graphql")
            "transform type Query { companyById } transform type Company { id name }";
          testPrograms
            "schema limit 1"
            "
            type Q {
              f: String
            }
            type M {
              f: String
            }
            schema {
              query: Q
              mutation: M
            }
            "
            "
            transform schema {
              query
            }
            "
            "
            type Q {
              f: String
            }
            schema {
              query: Q
            }
            ";
          testPrograms
            "schema limit 2"
            "
            type Query {
              f: String
            }
            "
            "
            transform type Query
            "
            "
            type Query {
              f: String
            }
            schema {
              query: Query
            }
            "
        );
      describe "type" (fun () -> 
          testPrograms 
            "alias field"
            "
            type Q {
              baz: String
              foo: String
            }
            schema {
              query: Q
            }
            "
            "
            transform type Q {
              bar: foo
            }
            "
            "
            type Q {
              bar: String
            }
            schema {
              query: Q
            }
            ";

          testPrograms 
            "alias type"
            "
            type Q {
              foo: String
            }
            schema {
              query: Q
            }
            "
            "
            transform type X: Q
            "
            "
            type X {
              foo: String
            }
            schema {
              query: X
            }
            ";

          testPrograms 
            "remove field"
            "
            type Q {
              bar: String
              foo: String
            }
            schema {
              query: Q
            }
            "
            "
            transform type Q {
              foo
            }
            "
            "
            type Q {
              foo: String
            }
            schema {
              query: Q
            }
            ";

          testPrograms 
            "remove field and three-shake"
            "
            type M {
              bar: String
            }
            type Q {
              foo: M
              bar: String
            }
            schema {
              query: Q
            }
            "
            "
            transform type Q {
              bar
            }
            "
            "
            type Q {
              bar: String
            }
            schema {
              query: Q
            }
            ";
          testPrograms 
            "remove field and three-shake rec-type"
            "
            type M {
              bar: M
            }
            type Q {
              foo: M
              bar: String
            }
            schema {
              query: Q
            }
            "
            "
            transform type Q {
              bar
            }
            "
            "
            type Q {
              bar: String
            }
            schema {
              query: Q
            }
            ";
          testPrograms 
            "remove field and three-shake mut rec-type"
            "
            type M {
              bar: N
            }
            type N {
              bar: M
            }
            type Q {
              foo: M
              bar: String
            }
            schema {
              query: Q
            }
            "
            "
            transform type Q {
              bar
            }
            "
            "
            type Q {
              bar: String
            }
            schema {
              query: Q
            }
            ";
          testPrograms 
            "remove field and three-shake interface type"
            "
            interface I {
              bar: String
            }
            type M implements I {
              bar: String
            }
            type Q {
              foo: M
              bar: I
            }
            schema {
              query: Q
            }
            "
            "
            transform type Q {
              bar
            }
            "
            "
            interface I {
              bar: String
            }
            type M implements I {
              bar: String
            }

            type Q {
              bar: I
            }
            schema {
              query: Q
            }
            ";
          testPrograms 
            "remove field and three-shake + interface type"
            "
            interface I {
              bar: String
            }
            type M implements I {
              bar: String
            }
            type Q {
              foo: M
              bar: String
            }
            schema {
              query: Q
            }
            "
            "
            transform type Q {
              bar
            }
            "
            "
            type Q {
              bar: String
            }
            schema {
              query: Q
            }
            ";

          testPrograms 
            "remove arg"
            "
            type Q {
              foo(arg: String): String
            }
            schema {
              query: Q
            }
            "
            "
            transform type Q {
              foo(arg = \"\")
            }
            "
            "
            type Q {
              foo: String
            }
            schema {
              query: Q
            }
            ";


          testPrograms 
            "remove one arg"
            "
            type Q {
              foo(arg: String arg2: Boolean arg3: Boolean): String
            }
            schema {
              query: Q
            }
            "
            "
            transform type Q {
              foo(arg = \"\")
            }
            "
            "
            type Q {
              foo(arg2: Boolean arg3: Boolean): String
            }
            schema {
              query: Q
            }
            ";
          testPrograms 
            "Update docs"
            "
            \"olddoc1\"
            type Q {
              \"olddoc2\"
              foo(
                \"olddoc3\"
                arg: String
                \"olddoc4\"
                arg2: String
                ): String

            }
            schema {
              query: Q
            }
            "
            "
            \"newdoc1\"
            transform type Q {
              \"newdoc2\"
              foo(
                \"newdoc3\"
                arg
              )
            }
            "
            "
            \"newdoc1\"
            type Q {
              \"newdoc2\"
              foo(
                \"newdoc3\"
                arg: String
                \"olddoc4\"
                arg2: String
                ): String
            }
            schema {
              query: Q
            }
            ";
        );
      describe "interface" (fun () -> 

          testPrograms 
            "alias field"
            "
            interface Q {
              baz: String
              foo: String
            }
            type Query {
              f: Q
            }
            "
            "
            transform interface Q {
              bar: foo
            }
            "
            "
            interface Q {
              bar: String
            }
            type Query {
              f: Q
            }
            ";


          testPrograms 
            "alias field"
            "
            interface Q {
              foo: String
            }
            type F implements Q {
              foo: String
            }
            type Query {
              f: F
            }

            "
            "
            transform interface X: Q 
            "
            "
            interface X {
              foo: String
            }
            type F implements X {
              foo: String
            }

            type Query {
              f: F
            }
            ";

          testPrograms 
            "alias field"
            "
            interface Q {
              foo: Q
            }
            type F implements Q {
              foo: Q
            }
            type Query {
              f: F
            }

            "
            "
            transform interface X: Q 
            "
            "
            interface X {
              foo: X
            }
            type F implements X {
              foo: X
            }

            type Query {
              f: F
            }
            ";

          testPrograms 
            "alias type"
            "
            interface Q {
              foo: String
            }
            type Query {
              f: Q
            }

            "
            "
            transform interface X: Q
            "
            "
            interface X {
              foo: String
            }
            type Query {
              f: X
            }

            ";

          testPrograms 
            "remove field"
            "
            interface Q {
              bar: String
              foo: String
            }
            type Query {
              f: Q
            }

            "
            "
            transform interface Q {
              foo
            }
            "
            "
            interface Q {
              foo: String
            }
            type Query {
              f: Q
            }
            ";

          testPrograms 
            "remove arg"
            "
            interface Q {
              foo(arg: String): String
            }
            type Query {
              f: Q
            }
            "
            "
            transform interface Q {
              foo(arg = \"\")
            }
            "
            "
            interface Q {
              foo: String
            }
            type Query {
              f: Q
            }
            ";


          testPrograms 
            "remove one arg"
            "
            interface Q {
              foo(arg: String arg2: Boolean arg3: Boolean): String
            }
            type Query {
              f: Q
            }
            "
            "
            transform interface Q {
              foo(arg = \"\")
            }
            "
            "
            interface Q {
              foo(arg2: Boolean arg3: Boolean): String
            }
            type Query {
              f: Q
            }
            ";
          testPrograms 
            "Update docs"
            "
            \"olddoc1\"
            interface Q {
              \"olddoc2\"
              foo(
                \"olddoc3\"
                arg: String
                \"olddoc4\"
                arg2: String
                ): String

            }
            type Query {
              f: Q
            }
            "
            "
            \"newdoc1\"
            transform interface Q {
              \"newdoc2\"
              foo(
                \"newdoc3\"
                arg
              )
            }
            "
            "
            \"newdoc1\"
            interface Q {
              \"newdoc2\"
              foo(
                \"newdoc3\"
                arg: String
                \"olddoc4\"
                arg2: String
                ): String
            }
            type Query {
              f: Q
            }
            ";

        );
      describe "scalar" (fun () -> 
          testPrograms 
            "noop"
            "
            scalar T
            type Query {
              f: T
            }
            "
            "
            transform scalar T
            "
            "
            scalar T
            type Query {
              f: T
            }
            ";
          testPrograms 
            "update docs"
            "
            scalar T
            type Query {
              f: T
            }
            "
            "
            \"docs\"
            transform scalar T
            "
            "
            \"docs\"
            scalar T
            type Query {
              f: T
            }
            ";
          testPrograms 
            "update docs"
            "
            \"olddocs\"
            scalar T
            type Query {
              f: T
            }
            "
            "
            \"docs\"
            transform scalar T
            "
            "
            \"docs\"
            scalar T
            type Query {
              f: T
            }
            ";
          testPrograms 
            "alias type"
            "
            scalar T
            type Query {
              f: T
            }

            "
            "
            transform scalar X: T
            "
            "
            scalar X
            type Query {
              f: X
            }
            ";
        );
      describe "union" (fun () -> 
          testPrograms 
            "noop"
            "
            type F {
              f: String
            }
            union T = F
            type Query {
              f: T
            }
            "
            "
            transform union T
            "
            "
            type F {
              f: String
            }
            union T = F
            type Query {
              f: T
            }
            ";
          testPrograms 
            "update docs"
            "
            type F {
              f: String
            }
            union T = F
            type Query {
              f: T
            }
            "
            "
            \"docs\"
            transform union T
            "
            "
            type F {
              f: String
            }
            \"docs\"
            union T = F
            type Query {
              f: T
            }
            ";
          testPrograms 
            "update docs"
            "
            type F {
              f: String
            }
            \"olddocs\"
            union T = F
            type Query {
              f: T
            }
            "
            "
            \"docs\"
            transform union T
            "
            "
            type F {
              f: String
            }
            \"docs\"
            union T = F
            type Query {
              f: T
            }
            ";
          testPrograms 
            "alias type"
            "
            type F {
              f: String
            }
            \"olddocs\"
            union T = F
            type Query {
              f: T
            }
            "
            "
            \"docs\"
            transform union X: T
            "
            "
            type F {
              f: String
            }
            \"docs\"
            union X = F
            type Query {
              f: X
            }
            ";
          testPrograms 
            "alias member type"
            "
            type F {
              f: String
            }
            union T = F
            type Query {
              f: T
            }
            "
            "
            transform type X: F
            "
            "
            type X {
              f: String
            }
            union T = X
            type Query {
              f: T
            }
            ";
        );
      describe "enum" (fun () -> 
          testPrograms 
            "noop"
            "
            enum T {
              VAR
            }
            type Query {
              f: T
            }
            "
            "
            transform enum T
            "
            "
            enum T {
              VAR
            }
            type Query {
              f: T
            }
            ";
          testPrograms 
            "update docs"
            "
            enum T {
              VAR
            }
            type Query {
              f: T
            }
            "
            "
            \"docs\"
            transform enum T
            "
            "
            \"docs\"
            enum T {
              VAR
            }
            type Query {
              f: T
            }
            ";
          testPrograms 
            "update docs 2"
            "
            \"olddocs\"
            enum T {
              VAR
            }
            type Query {
              f: T
            }
            "
            "
            \"docs\"
            transform enum T
            "
            "
            \"docs\"
            enum T {
              VAR
            }
            type Query {
              f: T
            }
            ";
          testPrograms 
            "update docs 3"
            "
            \"olddocs\"
            enum T {
              VALUE VALUE2
            }
            type Query {
              f: T
            }
            "
            "
            \"docs\"
            transform enum T {
              \"docs2\"
              VALUE
            }
            "
            "
            \"docs\"
            enum T {
              \"docs2\"
              VALUE VALUE2
            }
            type Query {
              f: T
            }
            ";
          testPrograms 
            "alias type"
            "
            enum T {
              VAR
            }
            type Query {
              f: T
            }
            "
            "
            transform enum X: T
            "
            "
            enum X {
              VAR
            }
            type Query {
              f: X
            }
            ";
        );
      describe "input object" (fun () -> 
          testPrograms 
            "noop"
            "
            input T {
              f: String
            }
            type Q {
              f(a: T): String
            }

            schema { query: Q }
            "
            "
            transform input T
            "
            "
            input T {
              f: String
            }
            type Q {
              f(a: T): String
            }
            schema { query: Q }
            ";
          testPrograms 
            "directive"
            "
            directive @foobar(arg: T) on SCHEMA

            input T {
              f: String
            }
            type Q {
              f: String
            }
            schema { query: Q }
            "
            "
            transform input X: T
            "
            "
            directive @foobar(arg: X) on SCHEMA

            input X {
              f: String
            }
            type Q {
              f: String
            }
            schema 
            { query: Q }
            ";
          testPrograms 
            "fix field"
            "
            input T {
              t: String
              f: String
            }
            type Query {
              f(a: T): String
            }
            "
            "
            transform input T {
              f = \"foobar\"
            }
            "
            "
            input T {
              t: String
            }
            type Query {
              f(a: T): String
            }


            ";

          testPrograms 
            "fix field w. default value"
            "
            input T {
              t: String
              f: String
            }
            type Q {
              foo(i: T = {f : \"f\" t : \"t\"}): String
            }
            schema { query: Q }
            "
            "
            transform input T {
              f = \"foobar\"
            }
            "
            "
            input T {
              t: String
            }
            type Q {
              foo(i: T = {t : \"t\"}): String
            }

            schema { query: Q }
            ";

          testPrograms 
            "type alias"
            "
            input T {
              f: T
            }
            type Query {
              f(a: T): String
            }
            "
            "
            transform input X: T
            "
            "
            input X {
              f: X
            }
            type Query {
              f(a: X): String
            }
            ";
          testPrograms 
            "update directive"
            "
            directive @foo (a: T = {f : \"f\" t : \"t\"}) on QUERY

            input T {
              f: String
              t: String
            }

            type Query @foo(a: {f : \"f\" t : \"t\"}) {
              f: String
            }
            "
            "
            transform input T {
              f = \"foo\"
            }
            "
            "
            directive @foo (a: T = {t : \"t\"}) on QUERY
            input T {
              t: String
            }
            type Query @foo(a: {t : \"t\"}) {
              f: String
            }
            ";
          testPrograms 
            "use build-in directive"
            "

            input T {
              f: String
              t: String
            }

            type Query @deprecated(reason: \"some reason\") {
              f(t: T): String
            }
            "
            "
            transform input T {
              f = \"foo\"
            }
            "
            "
            input T {
              t: String
            }
            type Query @deprecated(reason: \"some reason\") {
              f(t: T): String
            }
            ";
        );
    )
