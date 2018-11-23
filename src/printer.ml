open Trans_parser

let string_of_token (t: token): string = match t with
  | BOOL b -> "BOOL " ^ (string_of_bool b)
  | STRING s -> "STRING " ^ s
  | FLOAT s -> "FLOAT " ^ s
  | COLON -> "COLON"
  | NULL -> "NULL"
  | NAME s -> "NAME " ^ s
  | INT i -> "NAME " ^ i
  | EOF -> "EOF"
  | R_BRACKET -> "R_BRACKET"
  | L_BRACKET -> "L_BRACKET"
  | R_PAREN -> "R_PAREN"
  | L_PAREN -> "L_PAREN"
  | R_SQ_BRACKET -> "R_SQ_BRACKET"
  | L_SQ_BRACKET -> "L_SQ_BRACKET"

let rec string_of_tokens (tokens: Parser.token list): string = match tokens with
  | t::ts -> (string_of_token t) ^ "\n" ^ (string_of_tokens ts)
  | [] -> ""
