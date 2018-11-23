%token L_SQ_BRACKET
%token R_SQ_BRACKET
%token NULL
%token L_PAREN
%token R_PAREN
%token L_BRACKET
%token R_BRACKET
%token COLON
%token EOF
%token <bool> BOOL
%token <string> NAME
%token <string> STRING
%token <string> INT
%token <string> FLOAT

%{
    open Trans_ast
%}

%start <Trans_ast.program> prog
%%

prog: ts = transformations EOF    { { transformations = ts } };

transformations:
  | (* empty *)                                 { [] }
  | t = transformation; ts = transformations;   { t::ts }

transformation: 
  | ds = docs
    sel = type_selector
    L_BRACKET 
    fs = fields
    R_BRACKET 
    { { tpe = sel; fields = fs; doc = ds  } }
  | ds = docs
    sel = type_selector
    { { tpe = sel; fields = []; doc = ds } }


type_selector:
  | n = NAME    
    { { name = n; alias = None } }
  | alias = NAME COLON n = NAME
    { { name = n; alias = Some alias } }

fields:
  | f = field
    { f::[] }
  | f = field
    fs = fields
    { f::fs }

field:
  | ds = docs
    selector = field_selector
    ars = args
    { { field = selector; args= ars; doc = ds } }

field_selector:
 | n = NAME
   { { name = n; alias = None } }
 | a = NAME COLON n = NAME
   { { name = n; alias = Some a } }

args:
  | {[]}
  | L_PAREN 
    ars = arg_list 
    R_PAREN
    { ars }

arg_list:
  | a = arg
    {a::[]}
  | a = arg
    ars = arg_list
    { a::ars }

arg: ds = docs
     n = NAME 
     COLON 
     v = value 
     { { name = n; value = v; doc = ds } }

value: 
  | b = BOOL { Bool b }
  | s = STRING { String s }
  | f = FLOAT { Float f }
  | i = INT { Int (Int32.of_string i) }
  | NULL { Null }
  | l = list_value { List l }

list_value: 
    L_SQ_BRACKET 
    ls = list_content 
    R_SQ_BRACKET 
    { ls }

list_content:
  | { [] }
  | l = value
    ls = list_content
    { l::ls }

docs:
  | (* empty *)
    { None }
  | s = STRING
    { Some s }
  
