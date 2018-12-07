
(* The type of tokens. *)

type token = 
  | UNION
  | TYPE
  | TSDIR_UNION
  | TSDIR_SCHEMA
  | TSDIR_SCALAR
  | TSDIR_OBJECT
  | TSDIR_INTERFACE
  | TSDIR_INPUT_OBJECT
  | TSDIR_INPUT_FIELD_DEFINITION
  | TSDIR_FIELD_DEFINITION
  | TSDIR_ENUM_VALUE
  | TSDIR_ENUM
  | TSDIR_ARGUMENT_DEFINITION
  | TRUE
  | STRING of (string)
  | SPREAD
  | SCHEMA
  | SCALAR
  | R_SQ_BRACKET
  | R_PAREN
  | R_BRACKET
  | PIPE
  | OP_SUBSCRIPTION
  | OP_QUERY
  | OP_MUTATION
  | ON
  | NULL
  | NAME of (string)
  | L_SQ_BRACKET
  | L_PAREN
  | L_BRACKET
  | INTERFACE
  | INT of (string)
  | INPUT
  | IMPLEMENTS
  | FRAGMENT
  | FLOAT of (string)
  | FALSE
  | EXTEND
  | EXCLAMATION
  | EQUAL
  | EOF
  | ENUM
  | EDIR_SUBSCRIPTION
  | EDIR_QUERY
  | EDIR_MUTATION
  | EDIR_INLINE_FRAGMENT
  | EDIR_FRAGMENT_SPREAD
  | EDIR_FRAGMENT_DEFINITION
  | EDIR_FIELD
  | DOLLAR
  | DIRECTIVE
  | COLON
  | BLOCK_STRING of (string)
  | AT
  | AMPERSAND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val document: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Gql_ast.document)
