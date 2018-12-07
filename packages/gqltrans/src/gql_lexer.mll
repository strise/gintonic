{
    open Gql_parser
    open Lexing
    exception LexError of (string * position)
}

let whitespace = [' ' '\t']

let name = ['_' 'a'-'z' 'A'-'Z'] ['_' 'a'-'z' 'A'-'Z' '0'-'9']* 

let lineterm = "\r\n" | ['\n' '\r']

let unicodechar = ['a'-'f' 'A'-'F' '0'-'9']

let escapedUnicdechar = '\\' 'u' unicodechar unicodechar unicodechar unicodechar


let negative_sign = '-'
let non_zero_digit = ['1'-'9']
let digit = ['0'-'9']

let exponent_indicator = ['e' 'E']

let fractional_part = '.' digit +

let sign = [ '-' '+' ]

let exponent_part = exponent_indicator sign? digit+

let integer_part = negative_sign? ('0' | (non_zero_digit digit*))

let float_value = integer_part (fractional_part|exponent_part|(fractional_part exponent_part))

let integer_value = integer_part

let comma = ','

rule read = 
    parse
    | whitespace    { read lexbuf }
    | lineterm      { read lexbuf }
    | comma         { read lexbuf }

    | ':'           { COLON }
    | '|'           { PIPE }
    | '@'           { AT }
    | '='           { EQUAL }
    | '&'           { AMPERSAND }
    | '!'           { EXCLAMATION }

    | "..."         { SPREAD }

    | '{'           { L_BRACKET }
    | '}'           { R_BRACKET }
    | '['           { L_SQ_BRACKET }
    | ']'           { R_SQ_BRACKET }
    | '('           { L_PAREN }
    | ')'           { R_PAREN }

    | "true"        { TRUE }
    | "false"       { FALSE }
    | "null"        { NULL }

    | "on"                              { ON }
    | "fragment"                        { FRAGMENT }
    | "schema"                          { SCHEMA }
    | "type"                            { TYPE }
    | "enum"                            { ENUM }
    | "interface"                       { INTERFACE }
    | "implements"                      { IMPLEMENTS }
    | "directive"                       { DIRECTIVE }
    | "scalar"                          { SCALAR }
    | "input"                           { INPUT }
    | "union"                           { UNION }
    | "query"                           { OP_QUERY }
    | "mutation"                        { OP_MUTATION }
    | "subscription"                    { OP_SUBSCRIPTION }
    | "QUERY"                           { EDIR_QUERY }
    | "MUTATION"                        { EDIR_MUTATION }
    | "SUBSCRIPTION"                    { EDIR_SUBSCRIPTION }
    | "FIELD"                           { EDIR_FIELD }
    | "FRAGMENT_DEFINITION"             { EDIR_FRAGMENT_DEFINITION }
    | "FRAGMENT_SPREAD"                 { EDIR_FRAGMENT_SPREAD }
    | "INLINE_FRAGMENT"                 { EDIR_INLINE_FRAGMENT }

    | "SCHEMA"                          { TSDIR_SCHEMA }
    | "SCALAR"                          { TSDIR_SCALAR }
    | "OBJECT"                          { TSDIR_OBJECT }
    | "FIELD_DEFINITION"                { TSDIR_FIELD_DEFINITION }
    | "ARGUMENT_DEFINITION"             { TSDIR_ARGUMENT_DEFINITION }
    | "INTERFACE"                       { TSDIR_INTERFACE }
    | "UNION"                           { TSDIR_UNION }
    | "ENUM"                            { TSDIR_ENUM }
    | "ENUM_VALUE"                      { TSDIR_ENUM_VALUE }
    | "INPUT_OBJECT"                    { TSDIR_INPUT_OBJECT }
    | "INPUT_FIELD_DEFINITION"          { TSDIR_INPUT_FIELD_DEFINITION }

    | integer_value { INT (Lexing.lexeme lexbuf) }
    | float_value   { FLOAT (Lexing.lexeme lexbuf) }

    | "\"\"\""      { read_multiline_string "" lexbuf }
    | '"'           { read_string "" lexbuf }
    | '#'           { read_comment "" lexbuf }
    | name          { NAME (Lexing.lexeme lexbuf) }
    | _             { raise (LexError ("Illegal character: " ^ Lexing.lexeme lexbuf , Lexing.lexeme_start_p lexbuf)) }
    | eof           { EOF }
and read_string s = 
    parse
    | '"'               { STRING s }
    | lineterm          { raise (LexError ("Illegal newline in string: " ^ (String.escaped (Lexing.lexeme lexbuf)), Lexing.lexeme_start_p lexbuf)) }
    | '\\'              { raise (LexError ("Illegal character escape", Lexing.lexeme_start_p lexbuf)) }
    | '\\' '/'          { read_string (s ^ (Lexing.lexeme lexbuf)) lexbuf }
    | '\\' '\\'         { read_string (s ^ (Lexing.lexeme lexbuf)) lexbuf }
    | '\\' 'b'          { read_string (s ^ (Lexing.lexeme lexbuf)) lexbuf }
    | '\\' 'f'          { read_string (s ^ (Lexing.lexeme lexbuf)) lexbuf }
    | '\\' 'n'          { read_string (s ^ (Lexing.lexeme lexbuf)) lexbuf }
    | '\\' 'r'          { read_string (s ^ (Lexing.lexeme lexbuf)) lexbuf }
    | '\\' 't'          { read_string (s ^ (Lexing.lexeme lexbuf)) lexbuf }
    | '\\' '"'          { read_string (s ^ (Lexing.lexeme lexbuf)) lexbuf }
    | escapedUnicdechar { read_string (s ^ (Lexing.lexeme lexbuf)) lexbuf }
    | _                 { read_string (s ^ (Lexing.lexeme lexbuf)) lexbuf }
    | eof               { raise (LexError ("String not terminated", Lexing.lexeme_start_p lexbuf)) }
and read_multiline_string s = 
    parse
    | "\"\"\""          { BLOCK_STRING s }
    | '\\' '"' '"' '"'  { read_multiline_string (s ^ Lexing.lexeme lexbuf) lexbuf }
    | _                 { read_multiline_string (s ^ Lexing.lexeme lexbuf) lexbuf }
    | eof               { raise (LexError ("String not terminated", Lexing.lexeme_start_p lexbuf)) }
and read_comment s =
    parse
    | lineterm          { read lexbuf }
    | eof               { read lexbuf }
    | _                 { read_comment (s ^ Lexing.lexeme lexbuf) lexbuf }
