

type name = string

type named_type = name

type enum_value = name

type variable = name

type string_value =
  | StringValue of string
  | BlockStringValue of string


type description = string_value

type 'a object_field = {
  name: name;
  value: 'a
}

type value_const = 
  | IntValue of int32
  | FloatValue of string
  | StringValue of string_value
  | BooleanValue of bool
  | NullValue
  | EnumValue of name
  | ListValue of value_const list
  | ObjectValue of value_const object_field list

type vc = value_const

type value =
  | Variable of variable
  | IntValue of int32
  | FloatValue of string
  | StringValue of string_value
  | BooleanValue of bool
  | NullValue
  | EnumValue of name
  | ListValue of value list
  | ObjectValue of value object_field list


type v = value

let rec vc_to_v (v: vc): v = 
  match v with
  | IntValue v -> IntValue v
  | FloatValue f -> FloatValue f
  | StringValue s -> StringValue s
  | BooleanValue b -> BooleanValue b
  | NullValue -> NullValue
  | EnumValue e -> EnumValue e
  | ListValue ls -> ListValue (List.map vc_to_v ls)
  | ObjectValue fs -> ObjectValue (List.map (fun f -> {name = f.name; value = vc_to_v f.value})fs)

let rec v_to_vc (f: variable -> vc) (v: v): vc = 
  match v with
  | Variable v -> f v
  | IntValue v -> IntValue v
  | FloatValue f -> FloatValue f
  | StringValue s -> StringValue s
  | BooleanValue b -> BooleanValue b
  | NullValue -> NullValue
  | EnumValue e -> EnumValue e
  | ListValue ls -> ListValue (List.map (v_to_vc f) ls)
  | ObjectValue fs -> ObjectValue (List.map (fun field -> {name = field.name; value = (v_to_vc f) field.value})fs)


(* ObjectValue (List.map (fun f -> {name = f.name; value = v_to_vc f.value})fs) *)

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

let executable_directive_location_to_name l = match l with
  | Query -> "QUERY"
  | Mutation -> "MUTATION"
  | Subscription -> "SUBSCRIPTION"
  | Field -> "FIELD"
  | FragmentDefinition -> "FRAGMENT_DEFINITION"
  | FragmentSpread -> "FRAGMENT_SPREAD"
  | InlineFragment -> "INLINE_FRAGMENT"

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

let type_system_directive_location_to_name t : name = match t with
  | Schema -> "SCHEMA"
  | Scalar -> "SCALAR"
  | Object -> "OBJECT"
  | FieldDefinition -> "FIELD_DEFINITION"
  | ArgumentDefinition -> "ARGUMENT_DEFINITION"
  | Interface -> "INTERFACE"
  | Union -> "UNION"
  | Enum -> "ENUM"
  | EnumValue -> "ENUM_VALUE"
  | InputObject -> "INPUT_OBJECT"
  | InputFieldDefinition -> "INPUT_FIELD_DEFINITION"

type directive_location = 
  | ExecutableDirectiveLocation of executable_directive_location
  | TypeSystemDirectiveLocation of type_system_directive_location

let name_to_directive_location l : directive_location option = match l with
  | "QUERY" -> Some (ExecutableDirectiveLocation Query)
  | "MUTATION" -> Some (ExecutableDirectiveLocation Mutation)
  | "SUBSCRIPTION" -> Some (ExecutableDirectiveLocation Subscription)
  | "FIELD" -> Some (ExecutableDirectiveLocation Field)
  | "FRAGMENT_DEFINITION" -> Some (ExecutableDirectiveLocation FragmentDefinition)
  | "FRAGMENT_SPREAD" -> Some (ExecutableDirectiveLocation FragmentSpread)
  | "INLINE_FRAGMENT" -> Some (ExecutableDirectiveLocation InlineFragment)
  | "SCHEMA" -> Some (TypeSystemDirectiveLocation Schema)
  | "SCALAR" -> Some (TypeSystemDirectiveLocation Scalar)
  | "OBJECT" -> Some (TypeSystemDirectiveLocation Object)
  | "FIELD_DEFINITION" -> Some (TypeSystemDirectiveLocation FieldDefinition)
  | "ARGUMENT_DEFINITION" -> Some (TypeSystemDirectiveLocation ArgumentDefinition)
  | "INTERFACE" -> Some (TypeSystemDirectiveLocation Interface)
  | "UNION" -> Some (TypeSystemDirectiveLocation Union)
  | "ENUM" -> Some (TypeSystemDirectiveLocation Enum)
  | "ENUM_VALUE" -> Some (TypeSystemDirectiveLocation EnumValue)
  | "INPUT_OBJECT" -> Some (TypeSystemDirectiveLocation InputObject)
  | "INPUT_FIELD_DEFINITION" -> Some (TypeSystemDirectiveLocation InputFieldDefinition)
  | _ -> None



type 'a argument = {
  name: name;
  value: 'a;
}

let map_a (a: 'a argument) (m: 'a -> 'b): 'b argument = {a with value = m(a.value)}

let a_to_of (a: 'a argument): 'a object_field = {name = a.name; value = a.value}

type 'a directive = {
  name: name;
  arguments: 'a argument list;
}

type scalar_type_definition = {
  description: description option;
  name: name;
  directives: vc directive list;
}

type default_value = vc

type input_value_definition = {
  description: description option;
  name: name;
  tpe: tpe;
  defaultValue: default_value option;
  directives: vc directive list;
}

type field_definition = {
  description: description option;
  name: name;
  arguments: input_value_definition list;
  tpe: tpe;
  directives: vc directive list;
}

type object_type_definition = {
  description: description option;
  name: name;
  implements: named_type list;
  directives: vc directive list;
  fields: field_definition list;
}

type interface_type_definition = {
  description: description option;
  name: name;
  directives: vc directive list;
  fields: field_definition list;
}
type union_type_definition = {
  description: description option;
  name: name;
  directives: vc directive list;
  types: named_type list;
}
type enum_value_definition = {
  description: description option;
  value: enum_value;
  directives: vc directive list;
}

type enum_type_definition = {
  description: description option;
  name: name;
  directives: vc directive list;
  values: enum_value_definition list
}

type input_object_type_definition = {
  description: description option;
  name: name;
  directives: vc directive list;
  fields: input_value_definition list;
}

type type_definition = 
  | ScalarTypeDefinition of scalar_type_definition
  | ObjectTypeDefinition of object_type_definition
  | InterfaceTypeDefinition of interface_type_definition
  | UnionTypeDefinition of union_type_definition
  | EnumTypeDefinition of enum_type_definition
  | InputObjectTypeDefinition of input_object_type_definition


type directive_definition = {
  description: description option;
  name: name;
  arguments: input_value_definition list;
  locations: directive_location list
}



type operation_type = 
  | Query
  | Mutation
  | Subscription

let operation_type_to_string o = match o with
  | Query -> "query"
  | Mutation -> "mutation"
  | Subscription -> "subscription"

type operation_type_definition = {
  operation: operation_type;
  tpe: named_type;
}

type schema_definition = {
  directives: vc directive list;
  operations: operation_type_definition list;
}

type type_system_definition =
  | SchemaDefinition of schema_definition
  | TypeDefinition of type_definition
  | DirectiveDefinition of directive_definition


type fragment_name = name

type type_condition = name

type alias = name

type fragment_spread = {
  name: fragment_name;
  directives: v directive list;
}


type variable_definition = {
  variable: variable;
  tpe: tpe;
  defaultValue: default_value option;
}

type operation_definition = {
  tpe: operation_type;
  name: name option;
  variables: variable_definition list;
  directives: v directive list;
  selectionSet: selection list
} 

and inline_fragment = {
  condition: type_condition option;
  directives: v directive list;
  selectionSet: selection list;
}

and field = {
  alias: alias option;
  name: name;
  arguments: v argument list;
  directives: v directive list;
  selectionSet: selection list;
}

and selection = 
  | Field of field
  | FragmentSpread of fragment_spread
  | InlineFragment of inline_fragment

type fragment_definition = {
  name: fragment_name;
  condition: type_condition;
  directives: v directive list;
  selectionSet: selection list
}

type executable_definition = 
  | OperationDefinition of operation_definition
  | FragmentDefinition of fragment_definition

type schema_extension = {
  directives: vc directive list;
  operations: operation_type_definition list;
}

type scalar_type_extension = {
  name: name;
  directives: vc directive list;
}

type object_type_extension = {
  name: name;
  implements: named_type list;
  directives: vc directive list;
  fields: field_definition list;
}

type interface_type_extension = {
  name: name;
  directives: vc directive list;
  fields: field_definition list;
}


type union_type_extension = {
  name: name;
  directives: vc directive list;
  types: named_type list;
}

type enum_type_extension = {
  name: name;
  directives: vc directive list;
  values: enum_value_definition list
}

type input_object_type_extension = {
  name: name;
  directives: vc directive list;
  fields: input_value_definition list;
}


type type_extension = 
  | ScalarTypeExtension of scalar_type_extension
  | ObjectTypeExtension of object_type_extension
  | InterfaceTypeExtension of interface_type_extension
  | UnionTypeExtension of union_type_extension
  | EnumTypeExtension of enum_type_extension
  | InputObjectTypeExtension of input_object_type_extension

type type_system_extension = 
  | SchemaExtension of schema_extension
  | TypeExtension of type_extension

type definition =
  | TypeSystemDefinition of type_system_definition
  | TypeSystemExtension of type_system_extension
  | ExecutableDefinition of executable_definition 

type document = {
  definitions: definition list
}


type executable_document = {
  operation: operation_definition;
  fragments: fragment_definition list;
}

type schema_document = {
  schema: schema_definition;
  directives: directive_definition list;
  types: type_definition list;
}

exception Invalid_document of string

let document_to_executable_document (d: document): executable_document = 
  let 
    ops: (operation_definition list * fragment_definition list) = 
    List.fold_right 
      (fun o acc-> 
         match (acc, o) with 
         | ((acc1, acc2), (ExecutableDefinition (OperationDefinition o))) -> (o::acc1, acc2)
         | ((acc1, acc2), (ExecutableDefinition (FragmentDefinition o))) -> (acc1, o::acc2)
         | _ -> acc
      ) 
      d.definitions 
      ([], [])
  in
  match ops with
  | (op::[], fragments) -> {operation = op; fragments = fragments}
  | _ -> raise (Invalid_document "Failed to create executable document.")

let document_to_schema_document (d: document): schema_document  = 
  let 
    ops: (schema_definition list * directive_definition list * type_definition list) = 
    List.fold_right 
      (fun o acc -> 
         match (acc, o) with 
         | ((acc1, acc2, acc3), (TypeSystemDefinition (SchemaDefinition d))) -> (d::acc1, acc2, acc3)
         | ((acc1, acc2, acc3), (TypeSystemDefinition (DirectiveDefinition d))) -> (acc1, d::acc2, acc3)
         | ((acc1, acc2, acc3), (TypeSystemDefinition (TypeDefinition d))) -> (acc1, acc2, d::acc3)
         | _ -> acc
      ) 
      d.definitions 
      ([], [], [])
  in
  match ops with
  | (s::[], dirs, tps) -> {schema = s; directives = dirs; types =tps}
  | ([], dirs, tps) -> (
      let
        ops = 
        List.fold_right 
          (fun (op: type_definition) (q, m, s) -> (
               match op with
               | ObjectTypeDefinition op -> (
                   match op.name with
                   | "Query" -> (Some {operation = Query; tpe = op.name }, m, s)
                   | "Mutation" -> (q, Some {operation = Mutation; tpe = op.name }, s)
                   | "Subscription" -> (q, m, Some {operation = Subscription; tpe = op.name })
                   | _ -> (q, m, s)
                 )
               | _ -> (q, m, s)
             ))
          tps
          (None, None, None)
      in
      match ops with
      | Some q, m, s -> {schema = {directives = []; operations = Utils.flatten ((Some q)::m::s::[])}; directives = dirs; types = tps }
      | _ -> raise (Invalid_document "Failed to create schema document.")
    )
  | _ -> raise (Invalid_document "Failed to create schema document.")

(* TRANSFORMATION DOCUMENT *)


type selector = {
  name: name;
  alias: name option;
}

type type_selector = selector

type field_selector = selector

type input_value_selector = selector

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


type schema_transformation = {operations:  operation_type list; variables: variable_definition list}

type transformation =
  | TypeTransformation of type_transformation
  | SchemaTransformation of schema_transformation

type trans_document = {transformations: transformation list}
