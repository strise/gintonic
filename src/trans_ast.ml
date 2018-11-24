
type name = string

type string_value =
  | StringValue of string
  | BlockStringValue of string

type value = 
  | IntValue of int32
  | FloatValue of string
  | StringValue of string_value
  | BooleanValue of bool
  | NullValue
  | EnumValue of string
  | ListValue of value list
  | ObjectValue of object_field list
and object_field = {
  name: name;
  value: value
}



type type_selector = {
  name: name;
  alias: name option;
}

type field_selector = {
  name: name;
  alias: name option;
}

type description = string_value

type argument = {
  description: description option;
  name: name;
  value: value option;
}

type field_transformation = {
  description: description option;
  selector: field_selector;
  arguments: argument list
}

type fields_transformation = {
  spread: bool;
  fields: field_transformation list;
}

type transformation = {
  description: description option;
  selector: type_selector;
  fields: fields_transformation option;
}

type document = {transformations: transformation list}
