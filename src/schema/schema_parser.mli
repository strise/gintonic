
(* The type of tokens. *)

type token = 
  | STRING of (string)
  | R_SQ_BRACKET
  | R_PAREN
  | R_BRACKET
  | NULL
  | NAME of (string)
  | L_SQ_BRACKET
  | L_PAREN
  | L_BRACKET
  | INT of (string)
  | FLOAT of (string)
  | EOF
  | COLON
  | BOOL of (bool)

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Schema_ast.program)
