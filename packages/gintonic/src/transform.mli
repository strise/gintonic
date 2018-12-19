
type transformation
type primed_transformation

val transform: Gql_ast.schema_document -> Gql_ast.trans_document -> transformation

val schema: transformation -> Gql_ast.schema_document
val original_schema: transformation -> Gql_ast.schema_document

val schema_p: primed_transformation -> Gql_ast.schema_document
val original_schema_p: primed_transformation -> Gql_ast.schema_document

val prime: transformation -> (Gql_ast.variable * Gql_ast.value_const) list -> primed_transformation

val executable: primed_transformation -> Gql_ast.executable_document -> Gql_ast.executable_document

exception Transform_error of string

exception Query_transform_error of string

exception Prime_error of string