
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

let parse_with_error_s n parser lexbuf =
  try parser Gql_lexer.read lexbuf with
  | Gql_lexer.LexError message ->
    Js.Exn.raiseError (print_position lexbuf  ("GraphQL " ^ n ^ "syntax error: " ^ message))
  | Gql_parser.Error ->
    Js.Exn.raiseError (print_position lexbuf (print_token lexbuf ("GraphQL " ^ n ^ "syntax error")))
  | Gql_parser.Expected m ->
    Js.Exn.raiseError (print_position lexbuf ((print_token lexbuf ("GraphQL " ^ n ^ "syntax error")) ^ " expected " ^ m))

let transformSchema (s: string) (t: string): Transform.t =
  try
    let gql_ast =  parse_with_error_s "" Gql_parser.document (Lexing.from_string s) in
    let schema_ast = Gql_ast.document_to_schema_document gql_ast in
    let trans_ast = parse_with_error_s "transformation " Gql_parser.trans_document (Lexing.from_string t) in
    let
      transformation =
      Transform.transform schema_ast trans_ast
    in
    transformation
  with
  | Transform.Transform_error e -> Js.Exn.raiseError e
  | Gql_ast.Invalid_document e -> Js.Exn.raiseError e

let transformQuery (t: Transform.t) (e: Js.Json.t): Js.Json.t =
  try
    let exdoc = Js_utils.js_to_executable_document e in
    let ndoc = Transform.executable t exdoc in

    Js_utils.executable_document_to_js ndoc
  with
  | Js_utils.Parse_error m -> Js.Exn.raiseError m
  | Transform.Query_transform_error m -> Js.Exn.raiseError m
  | Gql_ast.Invalid_document e -> Js.Exn.raiseError e

type graphql_schema

external gqlBuildAst : Js.Json.t -> graphql_schema = "buildASTSchema" [@@bs.module "graphql"]

let buildSchema t =
  let schema = Transform.schema t in
  let g_ast = Js_utils.schema_document_to_js schema in
  gqlBuildAst g_ast

let originalSchema t =
  let schema = Transform.original_schema t in
  let g_ast = Js_utils.schema_document_to_js schema in
  gqlBuildAst g_ast
