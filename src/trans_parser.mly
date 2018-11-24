%token TRANSFORM
%token COLON
%token L_BRACKET
%token R_BRACKET
%token L_PAREN
%token R_PAREN
%token SPREAD
%token L_SQ_BRACKET
%token R_SQ_BRACKET
%token TRUE
%token FALSE
%token NULL
%token EOF
%token <string> NAME
%token <string> STRING
%token <string> BLOCK_STRING
%token <string> INT
%token <string> FLOAT

%{
    open Trans_ast
    let flat(l) = match l with 
      | Some l -> l
      | None -> []

%}

%start <Trans_ast.document> document
%%


document: ts = 
  transformation+ 
  EOF     
  { {transformations = ts }}


name:
  | TRUE          { "true" }
  | FALSE         { "false" }
  | NULL          { "null" }
  | TRANSFORM     { "transform" }
  | n = NAME      { n }

enum_value:
  | TRANSFORM     { "transform" }
  | n = NAME      { n }


alias:
  n = name
  { n }


transformation: 
  desc = description?
  TRANSFORM
  ts = type_selector
  fs = fields_transformation?
  {{ description = desc; selector = ts; fields = fs }}

type_selector:
  | n = name
    { {name = n; alias = None} }
  | a = alias
    COLON
    n = name
    {{alias = Some a; name = n}}

fields_transformation:
  L_BRACKET
  s = spread
  ft = field_transformation+
  R_BRACKET
  {{spread = s; fields = ft}}

field_transformation:
  ds = description?
  fs = field_selector
  args = arguments?
  {{description = ds; selector = fs; arguments = flat args}}


field_selector:
  | n = name
    { {name = n; alias = None} }
  | a = alias
    COLON
    n = name
    {{alias = Some a; name = n}}

arguments:
  L_PAREN
  args = described_argument+
  R_PAREN
  { args }

described_argument:
  desc = description?
  arg = argument
  {{ description = desc; name = arg.name; value = arg.value }}

argument:
  | n = name
    COLON
    v = value
    {{name = n; value = Some v; description = None}}
  | n = name
    {{name = n; value = None; description = None}}

value:
  | TRUE                                      { BooleanValue true }
  | FALSE                                     { BooleanValue false }
  | i = INT                                   { IntValue (Int32.of_string i) }
  | f = FLOAT                                 { FloatValue f }
  | s = string_value                          { StringValue s }
  | NULL                                      { NullValue }
  | n = enum_value                            { EnumValue n }
  | l = list_value                            { ListValue l }
  | o = object_value                          { ObjectValue o }

string_value:
  | s = STRING
    { StringValue s }
  | b = BLOCK_STRING
    { BlockStringValue b }

list_value:
  L_SQ_BRACKET
  vs = value*
  R_SQ_BRACKET
  {vs}

object_value:
  L_BRACKET
  fs = object_field*
  R_BRACKET
  { fs }

object_field:
  n = name
  COLON
  v = value
  {{name = n; value = v}}

spread:
  | { false }
  | SPREAD
    { true }

description: 
  s = string_value  
  { s }
