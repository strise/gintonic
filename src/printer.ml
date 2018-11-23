
let string_of_token (t: Trans_parser.token): string = match t with
  | Trans_parser.TRUE -> "TRUE"
  | Trans_parser.FALSE -> "FALSE"
  | Trans_parser.STRING s -> "STRING " ^ s
  | Trans_parser.FLOAT s -> "FLOAT " ^ s
  | Trans_parser.COLON -> "COLON"
  | Trans_parser.NULL -> "NULL"
  | Trans_parser.NAME s -> "NAME " ^ s
  | Trans_parser.INT i -> "NAME " ^ i
  | Trans_parser.EOF -> "EOF"
  | Trans_parser.R_BRACKET -> "R_BRACKET"
  | Trans_parser.L_BRACKET -> "L_BRACKET"
  | Trans_parser.R_PAREN -> "R_PAREN"
  | Trans_parser.L_PAREN -> "L_PAREN"
  | Trans_parser.R_SQ_BRACKET -> "R_SQ_BRACKET"
  | Trans_parser.L_SQ_BRACKET -> "L_SQ_BRACKET"

let rec string_of_tokens (tokens: Trans_parser.token list): string = match tokens with
  | t::ts -> (string_of_token t) ^ "\n" ^ (string_of_tokens ts)
  | [] -> ""
