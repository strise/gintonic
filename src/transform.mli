

type transformation

val transform: Gql_ast.schema_document -> Trans_ast.document -> transformation

val schema: transformation -> Gql_ast.schema_document

val executable: transformation -> Gql_ast.executable_document -> Gql_ast.executable_document

