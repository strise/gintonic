

type t

val transform: Gql_ast.schema_document -> Trans_ast.document -> t

val schema: t -> Gql_ast.schema_document

val original_schema: t -> Gql_ast.schema_document

val executable: t -> Gql_ast.executable_document -> Gql_ast.executable_document

