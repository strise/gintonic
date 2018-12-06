
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

type selector = {
  name: name;
  alias: name option;
}

type type_selector = selector

type field_selector = selector

type input_value_selector = selector

type description = string_value

type enum_value_selector = selector


type input_value = {
  description: description option;
  name: string;
  value: value option;
}

type field_transformation = {
  description: description option;
  selector: field_selector;
  arguments: input_value list
}

type object_type_transformation = {
  description: description option;
  selector: type_selector;
  fields: field_transformation list;
}

type scalar_type_transformation = {
  description: description option;
  selector: type_selector;
}

type union_type_transformation = {
  description: description option;
  selector: type_selector;
}

type interface_type_transformation = {
  description: description option;
  selector: type_selector;
  fields: field_transformation list;
}


type enum_value = name

type enum_value_transformation = {
  description: description option;
  value: enum_value ;
}

type enum_type_transformation = {
  description: description option;
  selector: type_selector;
  values: enum_value_transformation list;
}

type input_object_type_transformation = {
  description: description option;
  selector: type_selector;
  fields: input_value list;
}

type type_transformation =
  | ScalarTypeTransformation of scalar_type_transformation
  | ObjectTypeTransformation of object_type_transformation
  | InterfaceTypeTransformation of interface_type_transformation
  | UnionTypeTransformation of union_type_transformation
  | EnumTypeTransformation of enum_type_transformation
  | InputObjectTypeTransformation of input_object_type_transformation

type operation_type =
  | Query
  | Mutation
  | Subscription


type schema_transformation = operation_type list

type transformation =
  | TypeTransformation of type_transformation
  | SchemaTransformation of schema_transformation

type document = {transformations: transformation list}

