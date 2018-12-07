type graphql_schema

val transformSchema: string -> string -> Transform.t

val buildSchema: Transform.t -> graphql_schema

val originalSchema: Transform.t -> graphql_schema

val transformQuery: Transform.t -> Js.Json.t -> Js.Json.t
