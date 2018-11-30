open Jest
open Expect

exception Error

let parseS = Schema_parser.document Schema_lexer.read
let parseSS(s: string) = match Schema_ast.document_to_schema_document (parseS (Lexing.from_string s)) with
  | Some s -> s
  | None -> raise Error


let parseT = Trans_parser.document Trans_lexer.read
let parseTS(s: string) = parseT (Lexing.from_string s)


let testPrograms n (p1: string) (t: string) (p2: string): unit =
  test n (
    fun () -> expect (Transform.schema (Transform.transform (parseSS p1) (parseTS t))) |> toEqual (parseSS p2)
  )

let () =
  describe "Transform" (fun () -> 
      describe "schema" (fun () -> 
          testPrograms
            "schema limit"
            "
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
            schema {
              query: Q
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
            schema {
              query: Q
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
            schema {
              query: Q
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
            schema {
              query: F
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

            schema {
              query: F
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
            schema {
              query: F
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

            schema {
              query: F
            }
            ";

          testPrograms 
            "alias type"
            "
            interface Q {
              foo: String
            }
            schema {
              query: Q
            }
            "
            "
            transform interface X: Q
            "
            "
            interface X {
              foo: String
            }
            schema {
              query: X
            }
            ";

          testPrograms 
            "remove field"
            "
            interface Q {
              bar: String
              foo: String
            }
            schema {
              query: Q
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
            schema {
              query: Q
            }
            ";

          testPrograms 
            "remove arg"
            "
            interface Q {
              foo(arg: String): String
            }
            schema {
              query: Q
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
            schema {
              query: Q
            }
            ";


          testPrograms 
            "remove one arg"
            "
            interface Q {
              foo(arg: String arg2: Boolean arg3: Boolean): String
            }
            schema {
              query: Q
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
            schema {
              query: Q
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
            schema {
              query: Q
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
            schema {
              query: Q
            }
            ";

        );
      describe "scalar" (fun () -> 
          testPrograms 
            "noop"
            "
            scalar T
            schema { query: T }
            "
            "
            transform scalar T
            "
            "
            scalar T
            schema { query: T }
            ";
          testPrograms 
            "update docs"
            "
            scalar T
            schema { query: T }
            "
            "
            \"docs\"
            transform scalar T
            "
            "
            \"docs\"
            scalar T
            schema { query: T }
            ";
          testPrograms 
            "update docs"
            "
            \"olddocs\"
            scalar T
            schema { query: T }
            "
            "
            \"docs\"
            transform scalar T
            "
            "
            \"docs\"
            scalar T
            schema { query: T }
            ";
          testPrograms 
            "alias type"
            "
            scalar T
            schema { query: T }
            "
            "
            transform scalar X: T
            "
            "
            scalar X
            schema { query: X }
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
            schema { query: T }
            "
            "
            transform union T
            "
            "
            type F {
              f: String
            }
            union T = F
            schema { query: T }
            ";
          testPrograms 
            "update docs"
            "
            type F {
              f: String
            }
            union T = F
            schema { query: T }
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
            schema { query: T }
            ";
          testPrograms 
            "update docs"
            "
            type F {
              f: String
            }
            \"olddocs\"
            union T = F
            schema { query: T }
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
            schema { query: T }
            ";
          testPrograms 
            "alias type"
            "
            type F {
              f: String
            }
            \"olddocs\"
            union T = F
            schema { query: T }
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
            schema { query: X }
            ";
        );
      describe "enum" (fun () -> 
          testPrograms 
            "noop"
            "
            enum T {
              VAR
            }
            schema { query: T }
            "
            "
            transform enum T
            "
            "
            enum T {
              VAR
            }
            schema { query: T }
            ";
          testPrograms 
            "update docs"
            "
            enum T {
              VAR
            }
            schema { query: T }
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
            schema { query: T }
            ";
          testPrograms 
            "update docs 2"
            "
            \"olddocs\"
            enum T {
              VAR
            }
            schema { query: T }
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
            schema { query: T }
            ";
          testPrograms 
            "update docs 3"
            "
            \"olddocs\"
            enum T {
              VALUE VALUE2
            }
            schema { query: T }
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
            schema { query: T }
            ";
          testPrograms 
            "alias type"
            "
            enum T {
              VAR
            }
            schema { query: T }
            "
            "
            transform enum X: T
            "
            "
            enum X {
              VAR
            }
            schema { query: X }
            ";
        );
      describe "input object" (fun () -> 
          testPrograms 
            "noop"
            "
            input T {
              f: String
            }
            schema { query: T }
            "
            "
            transform input T
            "
            "
            input T {
              f: String
            }
            schema { query: T }
            ";
          testPrograms 
            "directive"
            "
            directive @foobar(arg: T) on SCHEMA

            input T {
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
            schema { query: T }
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
            schema { query: T }
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
            schema { query: T }
            "
            "
            transform input X: T
            "
            "
            input X {
              f: X
            }
            schema { query: X }
            ";
          testPrograms 
            "update directive"
            "
            directive @foo (a: T = {f : \"f\" t : \"t\"}) on QUERY


            input T @foo(a: {f : \"f\" t : \"t\"}) {
              f: String
              t: String
            }
            schema { query: T }
            "
            "
            transform input T {
              f = \"foo\"
            }
            "
            "
            directive @foo (a: T = {t : \"t\"}) on QUERY
            input T @foo(a: {t : \"t\"}) {
              t: String
            }
            schema { query: T }
            ";
        );
    )
