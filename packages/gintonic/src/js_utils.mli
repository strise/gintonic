
val document_to_js: Gql_ast.document -> Js.Json.t

val schema_document_to_js: Gql_ast.schema_document -> Js.Json.t

val js_to_executable_document: Js.Json.t -> Gql_ast.executable_document

val executable_document_to_js: Gql_ast.executable_document -> Js.Json.t

val print: Js.Json.t -> unit


val js_to_vars: Js.Json.t -> (Gql_ast.variable * Gql_ast.vc) list

exception Parse_error of string
