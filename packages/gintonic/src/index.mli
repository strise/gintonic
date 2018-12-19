type graphql_schema

type t

val transformSchema: string -> string -> t

val transformSchemaWithVariables: string -> string -> Js.Json.t -> t

val buildSchema: t -> graphql_schema

val originalSchema: t -> graphql_schema

val transformQuery: t -> Js.Json.t -> Js.Json.t
