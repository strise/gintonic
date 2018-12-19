open Jest
open Expect

external introspectionQ: string = "introspectionQuery" [@@bs.module "graphql"]

let parse_schema b =
  try Gql_parser.document (fun b -> Gql_lexer.read b) b
  with | Gql_parser.Expected m -> Js.Exn.raiseError (m ^ " <> " ^ (Lexing.lexeme b))

let parse_executable_string(s: string) = Gql_ast.document_to_executable_document (parse_schema (Lexing.from_string s))

module G = Gql_ast

let () =
  describe "Js_utils" (fun () -> 
      describe "js_to_executable_document" (fun () -> 
          test "transform json" (
            fun () -> expect (Js_utils.js_to_executable_document (Js_utils.executable_document_to_js (parse_executable_string introspectionQ)))
                      |> toEqual (parse_executable_string introspectionQ)
          );
          test "transform query 1" (
            fun () -> expect (Js_utils.js_to_executable_document (Js_utils.executable_document_to_js (parse_executable_string "query ($v: String) { a(v: $v) }")))
                      |> toEqual (parse_executable_string "query ($v: String) { a(v: $v) }")
          );
          test "transform query 2" (
            fun () -> expect  (Js_utils.executable_document_to_js (Js_utils.js_to_executable_document (Js_utils.executable_document_to_js (parse_executable_string "query ($v: String) { a(v: $v) }"))))
                      |> not_ |> toEqual (Js_utils.executable_document_to_js (parse_executable_string "query { a }"))
          );
          test "transform query 3" (
            fun () -> expect  (Js_utils.executable_document_to_js (parse_executable_string "query ($v: String) { a(v: $v) }"))
                      |> not_ |> toEqual (Js_utils.executable_document_to_js (parse_executable_string "query { a }"))
          )
        );

      describe "js_value" (fun () ->
          let t n v = 
            test n (
              fun () -> expect (Js_utils.js_to_vars (Js.Json.parseExn n)) |> toEqual v
            )
          in
          t "{}" [];
          t "null" [];
          t "false" [];
          t "{\"null\": true}" (("null", G.BooleanValue true)::[]);
          t "{\"null\": {}}" (("null", G.ObjectValue [])::[]);
          t "{\"null\": {\"foobar\": null}}" (("null", G.ObjectValue ({name = "foobar"; value = G.NullValue}::[]))::[]);
          t "{\"null\": []}" (("null", G.ListValue [])::[]);
          t "{\"null\": [true, false]}" (("null", G.ListValue (G.BooleanValue true::G.BooleanValue false::[]))::[]);
          t "true" []
        )
    )