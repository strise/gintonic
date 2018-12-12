%token TRANSFORM
%token SCHEMA

%token QUERY
%token MUTATION
%token SUBSCRIPTION

%token TYPE
%token ENUM
%token INPUT
%token INTERFACE
%token UNION
%token SCALAR

%token COLON
%token EQUAL
%token L_BRACKET
%token R_BRACKET
%token L_PAREN
%token R_PAREN
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
  | SCHEMA        { "schema" }
  | QUERY         { "query" }
  | MUTATION      { "mutation" }
  | SUBSCRIPTION  { "subscription" }
  | TYPE          { "type" }
  | ENUM          { "enum" }
  | INPUT         { "input" }
  | INTERFACE     { "interface" }
  | UNION         { "union" }
  | SCALAR        { "scalar" }
  | n = NAME      { n }


enum_value:
  | SCHEMA        { "schema" }
  | TRANSFORM     { "transform" }
  | QUERY         { "query" }
  | MUTATION      { "mutation" }
  | SUBSCRIPTION  { "subscription" }
  | TYPE          { "type" }
  | ENUM          { "enum" }
  | INPUT         { "input" }
  | INTERFACE     { "interface" }
  | UNION         { "union" }
  | SCALAR        { "scalar" }
  | n = NAME      { n }


alias:
  n = name
  { n }


transformation:
  | s = schema_transformation { SchemaTransformation s }
  | t = type_transformation { TypeTransformation t }

schema_transformation:
  TRANSFORM
  SCHEMA
  L_BRACKET
  ods = operation_type_definition+
  R_BRACKET
  { ods }

operation_type_definition:
  | QUERY         { Query }
  | MUTATION      { Mutation }
  | SUBSCRIPTION  { Subscription}

type_transformation:
  | t = object_type_transformation        { ObjectTypeTransformation t }
  | t = scalar_type_transformation        { ScalarTypeTransformation t }
  | t = union_type_transformation         { UnionTypeTransformation t }
  | t = interface_type_transformation     { InterfaceTypeTransformation t }
  | t = input_object_type_transformation  { InputObjectTypeTransformation t }
  | t = enum_type_transformation          { EnumTypeTransformation t }


enum_type_transformation:
  | desc = description
    TRANSFORM
    ENUM
    sel = type_selector
    fs = enum_values_transformation?
    {{description = Some desc; selector = sel; values = flat fs}}
  | TRANSFORM
    ENUM
    sel = type_selector
    fs = enum_values_transformation?
    {{description = None; selector = sel; values = flat fs}}

enum_values_transformation:
  L_BRACKET
  fs = enum_value_transformation+
  R_BRACKET
  { fs }

enum_value_transformation:
  ds = description?
  v = enum_value
  {{ description = ds; value = v }}

input_object_type_transformation:
  | TRANSFORM
    INPUT
    ts = type_selector
    fs = input_fields_transformation?
    {{selector = ts; fields = flat fs; description = None}}
  | desc = description
    TRANSFORM
    INPUT
    ts = type_selector
    fs = input_fields_transformation?
    {{selector = ts; fields = flat fs; description = Some desc}}

input_fields_transformation:
  L_BRACKET
  fs = input_value+
  R_BRACKET
  { fs }


object_type_transformation: 
  | TRANSFORM
    TYPE
    ts = type_selector
    fs = fields_transformation?
    {let a: object_type_transformation = { description = None; selector = ts; fields = flat fs } in a}
  | desc = description
    TRANSFORM
    TYPE
    ts = type_selector
    fs = fields_transformation?
    {let a: object_type_transformation = { description = Some desc; selector = ts; fields = flat fs } in a}

interface_type_transformation: 
  | TRANSFORM
    INTERFACE
    ts = type_selector
    fs = fields_transformation?
    {let a: interface_type_transformation = { description = None; selector = ts; fields = flat fs } in a}
  | desc = description
    TRANSFORM
    INTERFACE
    ts = type_selector
    fs = fields_transformation?
    {let a: interface_type_transformation = { description = Some desc; selector = ts; fields = flat fs } in a}

scalar_type_transformation: 
  | TRANSFORM
    SCALAR
    ts = type_selector
    {{ description = None; selector = ts;}}
  | desc = description
    TRANSFORM
    SCALAR
    ts = type_selector
    {{ description = Some desc; selector = ts;}}

union_type_transformation: 
  | TRANSFORM
    UNION
    ts = type_selector
    {{ description = None; selector = ts;}}
  | desc = description
    TRANSFORM
    UNION
    ts = type_selector
    {{ description = Some desc; selector = ts;}}


type_selector:
  | n = name
    { {name = n; alias = None} }
  | a = alias
    COLON
    n = name
    {{alias = Some a; name = n}}

fields_transformation:
  L_BRACKET
  ft = field_transformation+
  R_BRACKET
  { ft }

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
  args = input_value+
  R_PAREN
  { args }

input_value:
  desc = description?
  n = name
  v = default_value?
  {{ description = desc; name = n; value = v }}

default_value:
  EQUAL
  v = value
  { v }

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

description: 
  s = string_value  
  { s }
