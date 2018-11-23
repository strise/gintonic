{
    open Schema_parser
    open Lexing
    exception LexError of (string * position)
}

let whitespace = [' ' '\t']

let name = ['_' 'a'-'z' 'A'-'Z'] ['_' 'a'-'z' 'A'-'Z' '0'-'9']* 

let lineterm = "\r\n" | ['\n' '\r']

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

    | "on"           { EQUAL }
    | "schema"      { SCHEMA }
    | "type"        { TYPE }
    | "enum"        { ENUM }
    | "interface"   { INTERFACE }
    | "implements"  { IMPLEMENTS }
    | "directive"   { DIRECTIVE }
    | "scalar"      { SCALAR }
    | "input"       { INPUT }
    | "union"       { UNION }
    | "query"       { OP_QUERY }
    | "mutation"    { OP_MUTATION }
    | "subscription"    { OP_SUBSCRIPTION }
    | "QUERY"               { EDIR_QUERY }
    | "MUTATION"               { EDIR_MUTATION }
    | "SUBSCRIPTION"               { EDIR_SUBSCRIPTION }
    | "FIELD"               { EDIR_FIELD }
    | "FRAGMENT_DEFINITION"               { EDIR_FRAGMENT_DEFINITION }
    | "FRAGMENT_SPREAD"               { EDIR_FRAGMENT_SPREAD }
    | "INLINE_FRAGMENT"               { EDIR_INLINE_FRAGMENT }

    | "SCHEMA"               { TSDIR_SCHEMA }
    | "SCALAR"               { TSDIR_SCALAR }
    | "OBJECT"               { TSDIR_OBJECT }
    | "FIELD_DEFINITION"               { TSDIR_FIELD_DEFINITION }
    | "ARGUMENT_DEFINITION"               { TSDIR_ARGUMENT_DEFINITION }
    | "INTERFACE"               { TSDIR_INTERFACE }
    | "UNION"               { TSDIR_UNION }
    | "ENUM"               { TSDIR_ENUM }
    | "ENUM_VALUE"               { TSDIR_ENUM_VALUE }
    | "INPUT_OBJECT"               { TSDIR_INPUT_OBJECT }
    | "INPUT_FIELD_DEFINITION"               { TSDIR_INPUT_FIELD_DEFINITION }

    | "\"\"\""      { read_multiline_string "" lexbuf }
    | '"'           { read_string "" lexbuf }
    | '#'           { read_comment "" lexbuf }
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
    | lineterm          { read lexbuf }
    | eof               { read lexbuf }
    | _                 { read_comment (s ^ Lexing.lexeme lexbuf) lexbuf }