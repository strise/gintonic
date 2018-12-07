
(* The type of tokens. *)

type token = 
  | UNION
  | TYPE
  | TRUE
  | TRANSFORM
  | SUBSCRIPTION
  | STRING of (string)
  | SCHEMA
  | SCALAR
  | R_SQ_BRACKET
  | R_PAREN
  | R_BRACKET
  | QUERY
  | NULL
  | NAME of (string)
  | MUTATION
  | L_SQ_BRACKET
  | L_PAREN
  | L_BRACKET
  | INTERFACE
  | INT of (string)
  | INPUT
  | FLOAT of (string)
  | FALSE
  | EQUAL
  | EOF
  | ENUM
  | COLON
  | BLOCK_STRING of (string)

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val document: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Trans_ast.document)
