
let transformSchema (s: string) (t: string): Transform.t =
  let gql_ast =  Gql_parser.document Gql_lexer.read (Lexing.from_string s) in
  let schema_ast = Gql_ast.document_to_schema_document gql_ast in
  let trans_ast = Trans_parser.document Trans_lexer.read (Lexing.from_string t) in
  let transformation = Transform.transform schema_ast trans_ast in
  transformation

type graphql_schema

external gqlBuildAst : Js.Json.t -> graphql_schema = "buildASTSchema" [@@bs.module "graphql"]

let buildSchema t =
  let schema = Transform.schema t in
  let g_ast = Js_utils.schema_document_to_js schema in
  gqlBuildAst g_ast
