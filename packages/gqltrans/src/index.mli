type graphql_schema

val transformSchema: string -> string -> Transform.t

val buildSchema: Transform.t -> graphql_schema
