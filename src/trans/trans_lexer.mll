{
    open Trans_parser
    open Lexing
    exception LexError of (string * position)
}

let whitespace =  [' ' '\t' '\n']

let name = ['_' 'a'-'z' 'A'-'Z'] ['_' 'a'-'z' 'A'-'Z' '0'-'9']* 

let int = '-'? ['0'-'9'] ['0'-'9']*
let digit = ['0'-'9']
let frac = '.' digit*
let exp = ['e' 'E'] ['-' '+']? digit+
let float = '-'? digit* frac? exp?

rule read =
    parse
    | '#'           { read_comment "" lexbuf }
    | "true"        { TRUE }
    | "false"       { FALSE }
    | "null"        { NULL }
    | int           { INT (Lexing.lexeme lexbuf) }
    | float         { FLOAT (Lexing.lexeme lexbuf) }
    | '('           { L_PAREN }
    | ')'           { R_PAREN }
    | '{'           { L_BRACKET }
    | '}'           { R_BRACKET }
    | '['           { L_SQ_BRACKET }
    | ']'           { R_SQ_BRACKET }
    | ':'           { COLON }
    | ','           { read lexbuf }
    | "\"\"\""      { read_multiline_string "" lexbuf }
    | '"'           { read_string "" lexbuf }
    | whitespace    { read lexbuf }
    | _             { raise (LexError ("Unexpected char: " ^ Lexing.lexeme lexbuf , Lexing.lexeme_start_p lexbuf)) }
    | name          { NAME (Lexing.lexeme lexbuf) }
    | eof           { EOF }
and read_string s = 
    parse
    | '"'           { STRING s }
    | '\\' '/'      { read_string (s ^ "/") lexbuf }
    | '\\' '\\'     { read_string (s ^ "\\") lexbuf }
    | '\\' 'b'      { read_string (s ^ "\b") lexbuf }
    | '\\' 'f'      { read_string (s ^ "\012") lexbuf }
    | '\\' 'n'      { read_string (s ^ "\n") lexbuf }
    | '\\' 't'      { read_string (s ^ "\t") lexbuf }
    | '\\' 'r'      { read_string (s ^ "\r") lexbuf }
    | '\\' '"'      { read_string (s ^ "\"") lexbuf }
    | [^ '"' '\\']+ { read_string (s ^ Lexing.lexeme lexbuf) lexbuf }
    | _             { raise (LexError ("Illegal string character: " ^ Lexing.lexeme lexbuf , Lexing.lexeme_start_p lexbuf)) }
    | eof           { raise (LexError ("String not terminated", Lexing.lexeme_start_p lexbuf)) }
and read_multiline_string s = 
    parse
    | "\"\"\""      { STRING s }
    | '\\' '/'      { read_multiline_string (s ^ "/") lexbuf }
    | '\\' '\\'     { read_multiline_string (s ^ "\\") lexbuf }
    | '\\' 'b'      { read_multiline_string (s ^ "\b") lexbuf }
    | '\\' 'f'      { read_multiline_string (s ^ "\012") lexbuf }
    | '\\' 'n'      { read_multiline_string (s ^ "\n") lexbuf }
    | '\\' 't'      { read_multiline_string (s ^ "\t") lexbuf }
    | '\\' 'r'      { read_multiline_string (s ^ "\r") lexbuf }
    | '\\' '"'      { read_multiline_string (s ^ "\"") lexbuf }
    | [^ '\\']      { read_multiline_string (s ^ Lexing.lexeme lexbuf) lexbuf }
    | _             { raise (LexError ("Illegal string character: " ^ Lexing.lexeme lexbuf , Lexing.lexeme_start_p lexbuf)) }
    | eof           { raise (LexError ("String not terminated", Lexing.lexeme_start_p lexbuf)) }
and read_comment s =
    parse
    | '\n'          { read lexbuf }
    | eof           { read lexbuf }
    | _             { read_comment (s ^ Lexing.lexeme lexbuf) lexbuf }