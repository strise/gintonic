%token L_SQ_BRACKET
%token R_SQ_BRACKET
%token L_PAREN
%token R_PAREN
%token L_BRACKET
%token R_BRACKET

%token EXTEND
%token FRAGMENT
%token SCHEMA
%token TYPE
%token ENUM
%token INTERFACE
%token IMPLEMENTS
%token DIRECTIVE
%token SCALAR
%token INPUT
%token UNION

%token OP_QUERY
%token OP_MUTATION
%token OP_SUBSCRIPTION

%token EDIR_QUERY
%token EDIR_MUTATION
%token EDIR_SUBSCRIPTION
%token EDIR_FIELD
%token EDIR_FRAGMENT_DEFINITION
%token EDIR_FRAGMENT_SPREAD
%token EDIR_INLINE_FRAGMENT

%token TSDIR_SCHEMA
%token TSDIR_SCALAR
%token TSDIR_OBJECT
%token TSDIR_FIELD_DEFINITION
%token TSDIR_ARGUMENT_DEFINITION
%token TSDIR_INTERFACE
%token TSDIR_UNION
%token TSDIR_ENUM
%token TSDIR_ENUM_VALUE
%token TSDIR_INPUT_OBJECT
%token TSDIR_INPUT_FIELD_DEFINITION

%token COLON
%token DOLLAR
%token PIPE
%token AT
%token EQUAL
%token AMPERSAND
%token EXCLAMATION
%token SPREAD

%token ON
%token TRUE
%token FALSE
%token <string> NAME
%token <string> STRING
%token <string> BLOCK_STRING
%token <string> INT
%token <string> FLOAT
%token NULL

%token EOF

%{
    open Schema_ast

    let flat(l) = match l with 
      | Some l -> l
      | None -> []

%}

%start <Schema_ast.document> document
%%

document: ds = definition+ EOF    { { definitions = ds } }


definition:
  | ts = type_system_definition     { TypeSystemDefinition ts }
  | ex = executable_definition      { ExecutableDefinition ex }
  | te = type_system_extension      { TypeSystemExtension te }



executable_definition:
  | d = operation_definition 
    { OperationDefinition d }
  | d = fragment_definition 
    { FragmentDefinition d }

operation_definition:
  | op = operation_type
    n = name?
    vars = variable_definitions?
    ds = directives_nc?
    ss = selection_set
    {{tpe = op; name = n; variables = flat vars; directives = flat ds; selectionSet = ss}}
(*  | ss = selection_set
    {{tpe = Query; name = None; variables = []; directives = []; selectionSet = ss}} *)

variable_definitions:
  L_PAREN
  vs = variable_definition+
  R_PAREN
  { vs }

variable_definition:
  v = variable
  t = tpe
  df = default_value?
  {{
    variable = v;
    tpe = t;
    defaultValue = df;
  }}


fragment_definition:
  FRAGMENT
  n = fragment_name
  tc = type_condition
  ds = directives_nc?
  ss = selection_set
  {{ name = n; condition = tc; directives = flat ds; selectionSet = ss }}


selection_set: 
  L_BRACKET
  ss = selection+
  R_BRACKET
  { ss }

selection:
  | f = field               { Field f }
  | fs = fragment_spread    { FragmentSpread fs }
  | i = inline_fragment     { InlineFragment i }


fragment_spread:
  SPREAD 
  fn = fragment_name
  ds = directives_nc?
  {let v: fragment_spread = {name = fn; directives = flat ds;} in v}  

inline_fragment:
  SPREAD
  tc = type_condition?
  ds = directives_nc?
  ss = selection_set
  {{
    condition = tc;
    directives = flat ds;
    selectionSet = ss;
  }}



field:
  | alias = name
    COLON
    n = name
    args = arguments_nc?
    ds = directives_nc?
    ss = selection_set?
    {{ alias = Some alias; name = n; arguments = flat args; directives = flat ds; selectionSet = flat ss}}
  | n = name
    args = arguments_nc?
    ds = directives_nc?
    ss = selection_set?
    {{ alias = None; name = n; arguments = flat args; directives = flat ds; selectionSet = flat ss}}


type_condition:
  ON
  nt = named_type
  { nt }

schema_extension:
  | EXTEND
    SCHEMA
    ds = directives?
    {{directives = flat ds; definitions = []}}
  | EXTEND
    SCHEMA
    ds = directives?
    L_BRACKET
    ops = opreation_type_definition+
    R_BRACKET
    {{directives = flat ds; definitions = ops}}

type_extension:
  | s = scalar_type_extension 
    { ScalarTypeExtension s }
  | s = object_type_extension 
    { ObjectTypeExtension s }
  | s = interface_type_extension 
    { InterfaceTypeExtension s }
  | s = union_type_extension 
    { UnionTypeExtension s }
  | s = enum_type_extension 
    { EnumTypeExtension s }
  | s = input_object_type_extension 
    { InputObjectTypeExtension s }

scalar_type_extension:
  EXTEND
  SCALAR
  n = name
  ds = directives?
  {{ name = n; directives = flat ds }}

object_type_extension:
  | EXTEND
    TYPE
    n = name
    is = implements_interfaces?
    ds = directives?
    fd = fields_definition
    {{ name = n; implements = flat is; directives = flat ds; fields = fd }}
  | EXTEND
    TYPE
    n = name
    is = implements_interfaces?
    ds = directives
    {{ name = n; implements = flat is; directives = ds; fields = [] }}
  | EXTEND
    TYPE
    n = name
    is = implements_interfaces
    {{ name = n; implements = is; directives = []; fields = [] }}

interface_type_extension:
  | EXTEND
    INTERFACE
    n = name
    ds = directives?
    fd = fields_definition
    {let t: interface_type_extension = {name = n; directives = flat ds; fields = fd } in t}
  | EXTEND
    INTERFACE
    n = name
    ds = directives
    {let t: interface_type_extension = {name = n; directives = ds; fields = [] } in t}


union_type_extension:
  | EXTEND
    UNION
    n = name
    ds = directives?
    mem = union_member_types
    {{name = n; directives = flat ds; types = mem }}
  | EXTEND
    UNION
    n = name
    ds = directives
    {{name = n; directives = ds; types = [] }}

enum_type_extension:
  | EXTEND
    ENUM
    n = name
    ds = directives?
    vs = enum_values_definition
    {{name = n; directives = flat ds; values = vs }}
  | EXTEND
    ENUM
    n = name
    ds = directives
    {{name = n; directives = ds; values = [] }}


input_object_type_extension:
  | EXTEND
    INPUT
    n = name
    ds = directives?
    fd = input_fields_definition
    {{name = n; directives = flat ds; fields = fd }}
  | EXTEND
    INPUT
    n = name
    ds = directives
    {{name = n; directives = ds; fields = [] }}

  

type_system_extension:
  | se = schema_extension
    { SchemaExtension se }
  | te = type_extension
    { TypeExtension te }


type_system_definition:
  | d = schema_definition     { SchemaDefinition d }
  | d = type_definition       { TypeDefinition d }
  | d = directive_definition  { DirectiveDefinition d }

schema_definition: 
    SCHEMA 
    ds = directives?
    L_BRACKET
    rotds = opreation_type_definition+
    R_BRACKET
    { { directives = flat ds; operations = rotds } }

opreation_type_definition:
  op = operation_type
  COLON
  n = named_type
  {{ operation = op; tpe = n }}

operation_type:
  | OP_QUERY        { Query }
  | OP_MUTATION     { Mutation }
  | OP_SUBSCRIPTION { Subscription }


named_type: 
  n = name
  { n }


variable:
  DOLLAR
  n = name
  { n }

directives: 
  ds = directive+
  { ds }

directives_nc: 
  ds = directive_nc+
  { ds }

directive_nc: 
  AT 
  n = name
  args = arguments_nc?
  {{name= n; arguments = flat args }}

directive: 
  AT 
  n = name
  args = arguments?
  {let r: vc directive = {name= n; arguments = flat args; } in r}



arguments: 
  L_PAREN 
  args = argument+ 
  R_PAREN
  { args }

arguments_nc: 
  L_PAREN 
  args = argument_nc+ 
  R_PAREN
  { args }

argument: 
  n = name
  COLON
  v = value
  {{ name=n; value =v}}

argument_nc: 
  n = name
  COLON
  v = value_nc
  {{ name=n; value =v}}

string_value:
  | s = STRING
    { StringValue s }
  | b = BLOCK_STRING
    { BlockStringValue b }


value:
  | i = INT             {let v: vc = IntValue (Int32.of_string i) in v }
  | f = FLOAT           {let v: vc = FloatValue f in v}
  | s = string_value    {let v: vc = StringValue s in v}
  | TRUE                {let v: vc = BooleanValue true in v}
  | FALSE               {let v: vc = BooleanValue false in v}
  | NULL                {let v: vc = NullValue in v}
  | n = enum_value      {let v: vc = EnumValue n in v}
  | l = list_value      {let v: vc = ListValue l in v}
  | l = object_value    {let v: vc = ObjectValue l in v}

value_nc:
  | i = INT               {IntValue (Int32.of_string i)}
  | f = FLOAT             {FloatValue f}
  | s = string_value      {StringValue s}
  | TRUE                  {BooleanValue true}
  | FALSE                 {BooleanValue false}
  | NULL                  {NullValue}
  | v = variable          { Variable v }          
  | n = enum_value        {EnumValue n}
  | l = list_value_nc     {ListValue l}
  | l = object_value_nc   {ObjectValue l}

name:
  | n = NAME          { n }
  | ON                { "on" }
  | EXTEND            { "extend" }
  | FRAGMENT          { "fragment" }
  | TRUE              { "true" }
  | FALSE             { "false" }
  | NULL              { "null" }
  | SCHEMA            { "schema" }
  | TYPE              { "type" }
  | ENUM              { "enum" }
  | INTERFACE         { "interface" }
  | IMPLEMENTS        { "implements" }
  | DIRECTIVE         { "directive" }
  | SCALAR            { "scalar" }
  | INPUT             { "input" }
  | UNION             { "union" }
  | OP_MUTATION       { "mutation" }
  | OP_QUERY          { "query" }
  | OP_SUBSCRIPTION   { "subscription" }
  | EDIR_QUERY  {"QUERY" }
  | EDIR_MUTATION  {"MUTATION" }
  | EDIR_SUBSCRIPTION  {"SUBSCRIPTION" }
  | EDIR_FIELD  {"FIELD" }
  | EDIR_FRAGMENT_DEFINITION  {"FRAGMENT_DEFINITION" }
  | EDIR_FRAGMENT_SPREAD  {"FRAGMENT_SPREAD" }
  | EDIR_INLINE_FRAGMENT  {"INLINE_FRAGMENT" }
  | TSDIR_SCHEMA  {"SCHEMA" }
  | TSDIR_SCALAR  {"SCALAR" }
  | TSDIR_OBJECT  {"OBJECT" }
  | TSDIR_FIELD_DEFINITION  {"FIELD_DEFINITION" }
  | TSDIR_ARGUMENT_DEFINITION  {"ARGUMENT_DEFINITION" }
  | TSDIR_INTERFACE  {"INTERFACE" }
  | TSDIR_UNION  {"UNION" }
  | TSDIR_ENUM  {"ENUM" }
  | TSDIR_ENUM_VALUE  {"ENUM_VALUE" }
  | TSDIR_INPUT_OBJECT  {"INPUT_OBJECT" }
  | TSDIR_INPUT_FIELD_DEFINITION  {"INPUT_FIELD_DEFINITION" }

fragment_name:
  | n = NAME          { n }
  | EXTEND            { "extend" }
  | FRAGMENT          { "fragment" }
  | TRUE              { "true" }
  | FALSE             { "false" }
  | NULL              { "null" }
  | SCHEMA            { "schema" }
  | TYPE              { "type" }
  | ENUM              { "enum" }
  | INTERFACE         { "interface" }
  | IMPLEMENTS        { "implements" }
  | DIRECTIVE         { "directive" }
  | SCALAR            { "scalar" }
  | INPUT             { "input" }
  | UNION             { "union" }
  | OP_MUTATION       { "mutation" }
  | OP_QUERY          { "query" }
  | OP_SUBSCRIPTION   { "subscription" }
  | EDIR_QUERY  {"QUERY" }
  | EDIR_MUTATION  {"MUTATION" }
  | EDIR_SUBSCRIPTION  {"SUBSCRIPTION" }
  | EDIR_FIELD  {"FIELD" }
  | EDIR_FRAGMENT_DEFINITION  {"FRAGMENT_DEFINITION" }
  | EDIR_FRAGMENT_SPREAD  {"FRAGMENT_SPREAD" }
  | EDIR_INLINE_FRAGMENT  {"INLINE_FRAGMENT" }
  | TSDIR_SCHEMA  {"SCHEMA" }
  | TSDIR_SCALAR  {"SCALAR" }
  | TSDIR_OBJECT  {"OBJECT" }
  | TSDIR_FIELD_DEFINITION  {"FIELD_DEFINITION" }
  | TSDIR_ARGUMENT_DEFINITION  {"ARGUMENT_DEFINITION" }
  | TSDIR_INTERFACE  {"INTERFACE" }
  | TSDIR_UNION  {"UNION" }
  | TSDIR_ENUM  {"ENUM" }
  | TSDIR_ENUM_VALUE  {"ENUM_VALUE" }
  | TSDIR_INPUT_OBJECT  {"INPUT_OBJECT" }
  | TSDIR_INPUT_FIELD_DEFINITION  {"INPUT_FIELD_DEFINITION" }


enum_value:
  | n = NAME          { n }
  | ON                { "on" }
  | EXTEND            { "extend" }
  | FRAGMENT          { "fragment" }
  | SCHEMA            { "schema" }
  | TYPE              { "type" }
  | ENUM              { "enum" }
  | INTERFACE         { "interface" }
  | IMPLEMENTS        { "implements" }
  | DIRECTIVE         { "directive" }
  | SCALAR            { "scalar" }
  | INPUT             { "input" }
  | UNION             { "union" }
  | OP_MUTATION       { "mutation" }
  | OP_QUERY          { "query" }
  | OP_SUBSCRIPTION   { "subscription" }
  | EDIR_QUERY  {"QUERY" }
  | EDIR_MUTATION  {"MUTATION" }
  | EDIR_SUBSCRIPTION  {"SUBSCRIPTION" }
  | EDIR_FIELD  {"FIELD" }
  | EDIR_FRAGMENT_DEFINITION  {"FRAGMENT_DEFINITION" }
  | EDIR_FRAGMENT_SPREAD  {"FRAGMENT_SPREAD" }
  | EDIR_INLINE_FRAGMENT  {"INLINE_FRAGMENT" }
  | TSDIR_SCHEMA  {"SCHEMA" }
  | TSDIR_SCALAR  {"SCALAR" }
  | TSDIR_OBJECT  {"OBJECT" }
  | TSDIR_FIELD_DEFINITION  {"FIELD_DEFINITION" }
  | TSDIR_ARGUMENT_DEFINITION  {"ARGUMENT_DEFINITION" }
  | TSDIR_INTERFACE  {"INTERFACE" }
  | TSDIR_UNION  {"UNION" }
  | TSDIR_ENUM  {"ENUM" }
  | TSDIR_ENUM_VALUE  {"ENUM_VALUE" }
  | TSDIR_INPUT_OBJECT  {"INPUT_OBJECT" }
  | TSDIR_INPUT_FIELD_DEFINITION  {"INPUT_FIELD_DEFINITION" }


list_value:
  L_SQ_BRACKET
  vs = value*
  R_SQ_BRACKET
  { vs }

list_value_nc:
  L_SQ_BRACKET
  vs = value_nc*
  R_SQ_BRACKET
  { vs }

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

object_value_nc:
  L_BRACKET
  fs = object_field_nc*
  R_BRACKET
  { fs }

object_field_nc:
  n = name
  COLON
  v = value_nc
  {{name = n; value = v}}

type_definition: 
  | d = scalar_type_definition        { ScalarTypeDefinition d }
  | d = object_type_definition        { ObjectTypeDefinition d }
  | d = interface_type_definition     { InterfaceTypeDefinition d }
  | d = union_type_definition         { UnionTypeDefinition d }
  | d = enum_type_definition          { EnumTypeDefinition d }
  | d = input_object_type_definition  { InputObjectTypeDefinition d }

directive_definition:
  ds = description?
  DIRECTIVE
  AT
  n = name
  args = arguments_definition?
  ON
  locations = directive_locations
  {{description = ds; name = n; arguments = (flat args); locations = locations}}

arguments_definition:
  L_PAREN
  vs = input_value_definition+
  R_PAREN
  { vs }

scalar_type_definition:
  ds = description?
  SCALAR
  n = name
  dirs = directives?
  {{ description = ds; name = n; directives = flat dirs}}

description:
  s = string_value
  { s }

enum_type_definition:
  ds = description?
  ENUM
  n = name
  dirs = directives?
  vs = enum_values_definition?
  {{ description = ds; name = n; directives = flat dirs; values = flat vs}}

enum_values_definition:
  L_BRACKET
  vs = enum_value_definition+
  R_BRACKET
  { vs }

enum_value_definition:
  ds = description?
  v = enum_value
  dirs = directives?
  {{description = ds; value = v; directives = flat dirs}}

interface_type_definition:
  ds = description?
  INTERFACE
  n = name
  dirs = directives?
  fd = fields_definition?
  {
    let v: interface_type_definition = { 
      description = ds; 
      name = n; 
      directives = flat dirs; 
      fields = flat fd
      }  
    in v }

fields_definition:
  L_BRACKET
  fs = field_definition+
  R_BRACKET
  { fs }

field_definition:
  ds = description?
  n = name
  args = arguments_definition?
  COLON
  t = tpe
  dirs = directives?
  {{ 
    description = ds; 
    name = n; 
    arguments = flat args; 
    tpe = t;
    directives = flat dirs; 
    }}


tpe:
  | nt = named_type         { NamedType nt }
  | lt = list_type          { ListType lt }
  | nnt = non_null_type     { NonNullType nnt }

list_type:
  L_SQ_BRACKET
  t = tpe
  R_SQ_BRACKET
  { t }

non_null_type:
  | n = named_type 
    EXCLAMATION
    { NamedType n }
  | n = list_type
    EXCLAMATION
    { ListType n }


input_object_type_definition:
  ds = description?
  INPUT
  n = name
  dirs = directives?
  fs = input_fields_definition?
  {{description = ds; name = n; directives = flat dirs; fields = flat fs}}

input_fields_definition:
  L_BRACKET
  vs = input_value_definition+
  R_BRACKET
  { vs }

input_value_definition:
  ds = description?
  n = name
  COLON
  t = tpe
  dv = default_value?
  dirs = directives?
  {{ description = ds; name = n; tpe = t; defaultValue = dv; directives = flat dirs }}


union_type_definition:
  ds = description?
  UNION
  n = name
  dirs = directives?
  umt = union_member_types?
  {{description = ds; name = n; directives = flat dirs; types = flat umt}}

union_member_types:
  res = rev_union_member_types
  { List.rev res }

rev_union_member_types:
  | EQUAL PIPE?
    nt = named_type
    { nt::[] }
  | nts = rev_union_member_types
    PIPE
    nt = named_type
    { nt::nts }

default_value:
  EQUAL
  v = value
  { v }

directive_locations:
  res = rev_directive_locations
  { List.rev res }

rev_directive_locations:
  | PIPE?
    l = directive_location
    { l::[] }
  | ls = rev_directive_locations
    PIPE
    l = directive_location
    { l::ls }

directive_location:
  | s = executable_directive_location
    { ExecutableDirectiveLocation s }
  | s = type_system_directive_location
    { TypeSystemDirectiveLocation s }

executable_directive_location:
  | EDIR_QUERY  { Query }
  | EDIR_MUTATION  { Mutation }
  | EDIR_SUBSCRIPTION  { Subscription }
  | EDIR_FIELD  { Field }
  | EDIR_FRAGMENT_DEFINITION  { FragmentDefinition }
  | EDIR_FRAGMENT_SPREAD  { FragmentSpread }
  | EDIR_INLINE_FRAGMENT  { InlineFragment }

type_system_directive_location:
  | TSDIR_SCHEMA  { Schema }
  | TSDIR_SCALAR  { Scalar }
  | TSDIR_OBJECT  { Object }
  | TSDIR_FIELD_DEFINITION  { FieldDefinition }
  | TSDIR_ARGUMENT_DEFINITION  { ArgumentDefinition }
  | TSDIR_INTERFACE  { Interface }
  | TSDIR_UNION  { Union }
  | TSDIR_ENUM  { Enum }
  | TSDIR_ENUM_VALUE  { EnumValue }
  | TSDIR_INPUT_OBJECT  { InputObject }
  | TSDIR_INPUT_FIELD_DEFINITION  { InputFieldDefinition }

object_type_definition:
  ds = description?
  TYPE
  n = name
  impl = implements_interfaces?
  dirs = directives?
  fd = fields_definition?
  {{ 
    description = ds; 
    name = n; 
    implements = flat impl;
    directives = flat dirs;
    fields = flat fd;
    }}

implements_interfaces:
  res = rev_implements_interfaces
  { List.rev res }

rev_implements_interfaces:
  | IMPLEMENTS
    AMPERSAND?
    nt = named_type
    { nt::[] }
  | nts = rev_implements_interfaces
    AMPERSAND
    nt = named_type
    { nt::nts }
