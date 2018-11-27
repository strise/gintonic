

type transformation

val transform: Schema_ast.schema_document -> Trans_ast.document -> transformation

val schema: transformation -> Schema_ast.schema_document

val executable: transformation -> Schema_ast.executable_document -> Schema_ast.executable_document

