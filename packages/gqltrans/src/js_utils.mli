
val document_to_js: Gql_ast.document -> Js.Json.t

val schema_document_to_js: Gql_ast.schema_document -> Js.Json.t

val js_to_executable_document: Js.Json.t -> Gql_ast.executable_document

val executable_document_to_js: Gql_ast.executable_document -> Js.Json.t


val print: Js.Json.t -> unit