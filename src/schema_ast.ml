

type name = string

type named_type = name

type enum_value = name


type string_value =
  | StringValue of string
  | BlockStringValue of string


type description = string_value

type object_field = {
  name: name;
  value: value
}
and  value = 
  | IntValue of int32
  | FloatValue of string
  | StringValue of string_value
  | BooleanValue of bool
  | NullValue
  | EnumValue of name
  | ListValue of value list
  | ObjectValue of object_field list

type list_type = tpe

and tpe = 
  | NamedType of named_type
  | ListType of list_type
  | NonNullType of non_null_type

and non_null_type =
  | ListType of list_type
  | NamedType of named_type

type executable_directive_location = 
  | Query
  | Mutation
  | Subscription
  | Field
  | FragmentDefinition
  | FragmentSpread
  | InlineFragment

type type_system_directive_location = 
  | Schema
  | Scalar
  | Object
  | FieldDefinition
  | ArgumentDefinition
  | Interface
  | Union
  | Enum
  | EnumValue
  | InputObject
  | InputFieldDefinition

type directive_location = 
  | ExecutableDirectiveLocation of executable_directive_location
  | TypeSystemDirectiveLocation of type_system_directive_location

type scalar_type_definition = {
  description: description option;
  name: name;
  directives: directive list;
}

and object_type_definition = {
  description: description option;
  name: name;
  implements: named_type list;
  directives: directive list;
  fields: field_definition list;
}

and field_definition = {
  description: description option;
  name: name;
  arguments: input_value_definition list;
  tpe: tpe;
  directives: directive list;
}

and interface_type_definition = {
  description: description option;
  name: name;
  directives: directive list;
  fields: field_definition list;
}
and union_type_definition = {
  description: description option;
  name: name;
  directives: directive list;
  types: named_type list;
}
and enum_type_definition = {
  description: description option;
  name: name;
  directives: directive list;
  values: enum_value_definition list
}
and enum_value_definition = {
  description: description option;
  value: enum_value;
  directives: directive list;
}

and input_object_type_definition = {
  description: description option;
  name: name;
  directives: directive list;
  fields: input_value_definition list;

}

and type_definition = 
  | ScalarTypeDefinition of scalar_type_definition
  | ObjectTypeDefinition of object_type_definition
  | InterfaceTypeDefinition of interface_type_definition
  | UnionTypeDefinition of union_type_definition
  | EnumTypeDefinition of enum_type_definition
  | InputObjectTypeDefinition of input_object_type_definition


and derictive_definition = {
  description: description option;
  name: name;
  arguments: input_value_definition list;
  locations: directive_location list
}


and input_value_definition = {
  description: description option;
  name: name;
  tpe: tpe;
  defaultValue: value option;
  directives: directive list;
}

and argument = {
  name: name;
  value: value;
}

and directive = {
  name: name;
  arguments: argument list;
}


type operation_type = 
  | Query
  | Mutation
  | Subscription



type root_operation_type_definition = {
  operation: operation_type;
  tpe: named_type;
}

type schema_definition = {
  directives: directive list;
  operations: root_operation_type_definition list;
}

type type_system_definition =
  | SchemaDefinition of schema_definition
  | TypeDefinition of type_definition
  | DirectiveDefinition of derictive_definition

type document = {
  definitions: type_system_definition list
}

