
module S = Gql_ast

module Encode = struct

  let empty_to_null (encoder: 'a list Json.Encode.encoder) : 'a list Json.Encode.encoder =
    fun a -> 
      match a with
      | [] -> Json.Encode.null
      | ls -> encoder ls




  let name (n: S.name) = Json.Encode.(
      object_ [
        ("kind", string "Name");
        ("value", string n);
      ]
    )

  let object_value_field (e : 'a Json.Encode.encoder): 'a S.object_field Json.Encode.encoder = 
    fun f -> 
      Json.Encode.(
        object_ [
          ("kind", string "ObjectField");
          ("name", name f.name);
          ("value", e f.value)
        ]
      )

  let object_value (e : 'a Json.Encode.encoder): 'a S.object_field list Json.Encode.encoder = 
    fun f -> 
      Json.Encode.(
        object_ [
          ("kind", string "ObjectValue");
          ("fields", list (object_value_field e) f);
        ]
      )

  let list_value (e : 'a Json.Encode.encoder): 'a list Json.Encode.encoder = 
    fun vs -> 
      Json.Encode.(
        object_ [
          ("kind", string "ListValue");
          ("values", list e vs);
        ]
      )

  let variable (v: S.variable) = 
    Json.Encode.(
      object_ [
        ("kind", string "Variable");
        ("name", name v);
      ]
    )


  let int_value (i: int32) = 
    Json.Encode.(
      object_ [
        ("kind", string "IntValue");
        ("value", string (Int32.to_string i));
      ]
    )

  let float_value (v: string) = 
    Json.Encode.(
      object_ [
        ("kind", string "FloatValue");
        ("value", string v);
      ]
    )

  let boolean_value (v: bool) = 
    Json.Encode.(
      object_[
        ("kind", string "BooleanValue");
        ("value", bool v);
      ]
    )

  let enum_value (v: string) = 
    Json.Encode.(
      object_[
        ("kind", string "EnumValue");
        ("value", string v);
      ]
    )
  let null_value = 
    Json.Encode.(
      object_ [
        ("kind", string "NullValue");
      ]
    )

  let string_value (s: S.string_value) = 
    Json.Encode.(
      match s with 
      | S.StringValue v ->     
        object_ [
          ("kind", string "StringValue");
          ("value", string v);
          ("block", bool false)
        ]
      | S.BlockStringValue v ->     
        object_ [
          ("kind", string "StringValue");
          ("value", string v);
          ("block", bool true)
        ]
    )

  let rec value: S.value Json.Encode.encoder  =
    fun a ->
      match a with
      | S.IntValue i ->  int_value i
      | S.FloatValue v -> float_value v
      | S.EnumValue v -> enum_value v
      | S.BooleanValue v -> boolean_value v
      | S.NullValue -> null_value
      | S.StringValue s -> string_value s
      | S.ListValue vs -> list_value value vs
      | S.ObjectValue vs -> object_value value vs
      | S.Variable v -> variable v

  let rec value_const (a: S.value_const) = 
    match a with
    | S.IntValue i ->  int_value i
    | S.FloatValue v -> float_value v
    | S.EnumValue v -> enum_value v
    | S.BooleanValue v -> boolean_value v
    | S.NullValue -> null_value
    | S.StringValue s -> string_value s
    | S.ListValue vs -> list_value value_const vs
    | S.ObjectValue vs -> object_value value_const vs

  let argument (v: 'a Json.Encode.encoder) (a: 'a S.argument) = 
    Json.Encode.(
      object_ [
        ("kind", string "Argument");
        ("name", name a.name);
        ("value", v a.value)
      ]
    )

  let arguments (v: 'a Json.Encode.encoder): 'a S.argument list Json.Encode.encoder = empty_to_null (Json.Encode.list (argument v))

  let rec type_ : S.tpe Json.Encode.encoder = fun t -> 
    Json.Encode.(
      match t with
      | S.NamedType n -> object_[
          ("kind", string "NamedType");
          ("name", name n);
        ]
      | S.ListType t -> object_[
          ("kind", string "ListType");
          ("type", type_ t);
        ]
      | S.NonNullType t -> object_[
          ("kind", string "NonNullType");
          ("type", 
           match t with
           | S.NamedType n -> type_ (S.NamedType n)
           | S.ListType n -> type_ (S.ListType n)
          );
        ]
    )

  let directive (v: 'a Json.Encode.encoder) (a: 'a S.directive) = Json.Encode.(
      object_ [
        ("kind", string "Directive");
        ("name", name a.name);
        ("value", arguments v a.arguments)
      ]
    )

  let directives (v: 'a Json.Encode.encoder): 'a S.directive list Json.Encode.encoder  = 
    empty_to_null (Json.Encode.list (directive v))

  let input_value_definition (d: S.input_value_definition) = Json.Encode.(
      object_ [
        ("kind", string "InputValueDefinition");
        ("description", nullable string_value d.description);
        ("name", name d.name);
        ("type", type_ d.tpe);
        ("defaultValue", nullable value_const d.defaultValue);
        ("directives", directives value_const d.directives)
      ]
    )

  let input_value_definitions = empty_to_null (Json.Encode.list input_value_definition)

  let directive_location l = 
    match l with
    | S.ExecutableDirectiveLocation l -> name (S.executable_directive_location_to_name l)
    | S.TypeSystemDirectiveLocation l -> name (S.type_system_directive_location_to_name l)

  let directive_locations = empty_to_null (Json.Encode.list directive_location)

  let directive_definition (d: S.directive_definition) = 
    Json.Encode.(
      object_ [
        ("kind", string "DirectiveDefinition");
        ("description", nullable string_value d.description);
        ("name", name d.name);
        ("arguments", input_value_definitions d.arguments);
        ("locations", directive_locations d.locations)
      ]
    )

  let scalar_type_definition (d: S.scalar_type_definition) = 
    Json.Encode.(
      object_ [
        ("kind", string "ScalarTypeDefinition");
        ("description", nullable string_value d.description);
        ("name", name d.name);
        ("directives", directives value_const d.directives)
      ]
    )


  let scalar_type_extension (d: S.scalar_type_extension) = 
    Json.Encode.(
      object_ [
        ("kind", string "ScalarTypeExtension");
        ("name", name d.name);
        ("directives", directives value_const d.directives)
      ]
    )


  let named_type n = 
    Json.Encode.(
      object_ [
        ("kind", string "NamedType");
        ("name", name n)
      ]
    )

  let named_types = empty_to_null (Json.Encode.list named_type)

  let field_definition (f: S.field_definition)= 
    Json.Encode.(
      object_ [
        ("kind", string "FieldDefinition");
        ("description", nullable string_value f.description);
        ("name", name f.name);
        ("arguments", input_value_definitions f.arguments);
        ("type", type_ f.tpe);
        ("directives", directives value_const f.directives)
      ]
    )

  let field_definitions = empty_to_null (Json.Encode.list field_definition)


  let object_type_definition (d: S.object_type_definition) = 
    Json.Encode.(
      object_ [
        ("kind", string "ObjectTypeDefinition");
        ("description", nullable string_value d.description);
        ("name", name d.name);
        ("interfaces", named_types d.implements);
        ("directives", directives value_const d.directives);
        ("fields", field_definitions d.fields)
      ]
    )

  let object_type_extension (d: S.object_type_extension) = 
    Json.Encode.(
      object_ [
        ("kind", string "ObjectTypeExtension");
        ("name", name d.name);
        ("interfaces", named_types d.implements);
        ("directives", directives value_const d.directives);
        ("fields", field_definitions d.fields)
      ]
    )

  let interface_type_definition (d: S.interface_type_definition) = 
    Json.Encode.(
      object_ [
        ("kind", string "InterfaceTypeDefinition");
        ("description", nullable string_value d.description);
        ("name", name d.name);
        ("directives", directives value_const d.directives);
        ("fields", field_definitions d.fields)
      ]
    )

  let interface_type_extension (d: S.interface_type_extension) = 
    Json.Encode.(
      object_ [
        ("kind", string "InterfaceTypeExtension");
        ("name", name d.name);
        ("directives", directives value_const d.directives);
        ("fields", field_definitions d.fields)
      ]
    )

  let union_type_definition (d: S.union_type_definition) = 
    Json.Encode.(
      object_ [
        ("kind", string "UnionTypeDefinition");
        ("description", nullable string_value d.description);
        ("name", name d.name);
        ("directives", directives value_const d.directives);
        ("types", named_types d.types)
      ]
    )

  let union_type_extension (d: S.union_type_extension) = 
    Json.Encode.(
      object_ [
        ("kind", string "UnionTypeExtension");
        ("name", name d.name);
        ("directives", directives value_const d.directives);
        ("types", named_types d.types)
      ]
    )

  let enum_value_definition (d: S.enum_value_definition) =
    Json.Encode.(
      object_ [
        ("kind", string "EnumValueDefinition");
        ("description", nullable string_value d.description);
        ("name", name d.value);
        ("directives", directives value_const d.directives);
      ]
    )

  let enum_value_definitions = empty_to_null (Json.Encode.list enum_value_definition)

  let enum_type_definition (d: S.enum_type_definition) = 
    Json.Encode.(
      object_ [
        ("kind", string "EnumTypeDefinition");
        ("description", nullable string_value d.description);
        ("name", name d.name);
        ("directives", directives value_const d.directives);
        ("values", enum_value_definitions d.values)
      ]
    )

  let enum_type_extension (d: S.enum_type_extension) = 
    Json.Encode.(
      object_ [
        ("kind", string "EnumTypeExtension");
        ("name", name d.name);
        ("directives", directives value_const d.directives);
        ("values", enum_value_definitions d.values)
      ]
    )


  let input_object_type_definition  (d: S.input_object_type_definition) = 
    Json.Encode.(
      object_ [
        ("kind", string "InputObjectTypeDefinition");
        ("description", nullable string_value d.description);
        ("name", name d.name);
        ("directives", directives value_const d.directives);
        ("fields", input_value_definitions d.fields)
      ]
    )

  let input_object_type_extension  (d: S.input_object_type_extension) = 
    Json.Encode.(
      object_ [
        ("kind", string "InputObjectTypeExtension");
        ("name", name d.name);
        ("directives", directives value_const d.directives);
        ("fields", input_value_definitions d.fields)
      ]
    )

  let operation_type (t: S.operation_type) =
    Json.Encode.(
      match t with
      | S.Query -> string "query"
      | S.Mutation -> string "mutation"
      | S.Subscription -> string "subscription"
    )


  let operation_type_definition (d: S.operation_type_definition) = 
    Json.Encode.(
      object_ [
        ("kind", string "OperationTypeDefinition");
        ("operation", operation_type d.operation);
        ("type", named_type d.tpe)
      ]
    )


  let operation_type_definitions = Json.Encode.list operation_type_definition

  let schema_extension (d: S.schema_extension) = 
    Json.Encode.(
      object_ [
        ("kind", string "SchemaExtension");
        ("directives", directives value_const d.directives);
        ("operationTypes", empty_to_null operation_type_definitions d.operations)
      ]
    )


  let variable_definition (def: S.variable_definition)= 
    Json.Encode.(
      object_ [
        ("kind", string "VariableDefinition");
        ("variable", variable def.variable);
        ("type", type_ def.tpe);
        ("defaultValue", nullable value_const def.defaultValue);
        ("directives", null);
      ]
    )


  let variable_definitions = empty_to_null (Json.Encode.list variable_definition)


  let fragment_spread (f: S.fragment_spread) = 
    Json.Encode.(
      object_ [
        ("kind", string "FragmentSpread");
        ("name", name f.name);
        ("directives", directives value f.directives);
      ]
    )



  let rec selection_set (s: S.selection list) = 
    Json.Encode.(
      object_ [
        ("kind", string "SelectionSet");
        ("selections", selections s);
      ]
    )
  and selections ss = Json.Encode.list selection ss

  and selection (s: S.selection) = 
    match s with
    | S.Field f -> field f
    | S.FragmentSpread s -> fragment_spread s
    | S.InlineFragment i -> inline_fragment i

  and field (f: S.field) = 
    Json.Encode.(
      object_ [
        ("kind", string "Field");
        ("alias", nullable name f.alias);
        ("name", name f.name);
        ("arguments", arguments value f.arguments);
        ("directives", directives value f.directives);
        ("selectionSet", empty_to_null selection_set f.selectionSet);
      ]
    )
  and inline_fragment (f: S.inline_fragment) =
    Json.Encode.(
      object_ [
        ("kind", string "InlineFragment");
        ("typeCondition", nullable named_type f.condition);
        ("directives", directives value f.directives);
        ("selectionSet", selection_set f.selectionSet);
      ]
    )


  let operation_definition (d: S.operation_definition) = 

    Json.Encode.(
      object_ [
        ("kind", string "OperationDefinition");
        ("operation", operation_type d.tpe);
        ("name", nullable name d.name);
        ("variableDefinitions", variable_definitions d.variables);
        ("directives", directives value d.directives);
        ("selectionSet", selection_set d.selectionSet)
      ]
    )

  let schema_definition  (d: S.schema_definition) = 
    Json.Encode.(
      object_ [
        ("kind", string "SchemaDefinition");
        ("directives", directives value_const d.directives);
        ("operationTypes", operation_type_definitions d.operations)
      ]
    )


  let fragment_definition  (d: S.fragment_definition) = 
    Json.Encode.(
      object_ [
        ("kind", string "FragmentDefinition");
        ("name", name d.name);
        ("typeCondition",  named_type d.condition);
        ("directives", directives value d.directives);
        ("selectionSet", selection_set d.selectionSet)
      ]
    )

  let definition (d: S.definition) = match d with
    | S.ExecutableDefinition (S.OperationDefinition d) -> operation_definition d
    | S.ExecutableDefinition (S.FragmentDefinition d) -> fragment_definition d
    | S.TypeSystemDefinition (S.SchemaDefinition d) -> schema_definition d
    | S.TypeSystemDefinition (S.DirectiveDefinition d) -> directive_definition d
    | S.TypeSystemDefinition (S.TypeDefinition (S.ScalarTypeDefinition d)) -> scalar_type_definition d
    | S.TypeSystemDefinition (S.TypeDefinition (S.ObjectTypeDefinition d)) -> object_type_definition d
    | S.TypeSystemDefinition (S.TypeDefinition (S.InterfaceTypeDefinition d)) -> interface_type_definition d
    | S.TypeSystemDefinition (S.TypeDefinition (S.UnionTypeDefinition d)) -> union_type_definition d
    | S.TypeSystemDefinition (S.TypeDefinition (S.EnumTypeDefinition d)) -> enum_type_definition d
    | S.TypeSystemDefinition (S.TypeDefinition (S.InputObjectTypeDefinition d)) -> input_object_type_definition d
    | S.TypeSystemExtension (S.SchemaExtension e) -> schema_extension e
    | S.TypeSystemExtension (S.TypeExtension (S.ScalarTypeExtension e)) -> scalar_type_extension e
    | S.TypeSystemExtension (S.TypeExtension (S.ObjectTypeExtension e)) -> object_type_extension e
    | S.TypeSystemExtension (S.TypeExtension (S.InterfaceTypeExtension e)) -> interface_type_extension e
    | S.TypeSystemExtension (S.TypeExtension (S.UnionTypeExtension e)) -> union_type_extension e
    | S.TypeSystemExtension (S.TypeExtension (S.EnumTypeExtension e)) -> enum_type_extension e
    | S.TypeSystemExtension (S.TypeExtension (S.InputObjectTypeExtension e)) -> input_object_type_extension e

  let definitions = Json.Encode.list definition

  let document (d: S.document) =
    Json.Encode.(
      object_ [
        ("kind", string "Document");
        ("definitions", definitions d.definitions);
      ]
    )

  let schema_document (s: S.schema_document) =
    let defs = 
      (List.map (fun t -> S.TypeSystemDefinition (S.TypeDefinition t)) s.types)
      ::(S.TypeSystemDefinition (S.SchemaDefinition s.schema)::[])
      ::(List.map (fun d -> S.TypeSystemDefinition (S.DirectiveDefinition d)) s.directives)
      ::[]
    in
    document {
      definitions = List.flatten defs
    }


  let executable_document (s: S.executable_document) =
    let 
      defs = 
      (List.map (fun f -> (S.ExecutableDefinition (S.FragmentDefinition f))) s.fragments)::
      ((S.ExecutableDefinition (S.OperationDefinition s.operation))::[])::
      []
    in 
    document {
      definitions = List.flatten defs
    }
end



module Decode = struct

  let e s = Json.Decode.DecodeError ("Expected " ^ s)

  type node =
    | Document of S.document
    | Name of S.name
    | OperationDefinition of S.operation_definition
    | VariableDefinition of S.variable_definition
    | Variable of S.variable
    | SelectionSet of S.selection list
    | Field of S.field
    | FragmentSpread of S.fragment_spread
    | InlineFragment of S.inline_fragment
    | FragmentDefinition of S.fragment_definition
    | NamedType of S.named_type
    | ListType of S.list_type
    | NonNullType of S.non_null_type
    | SchemaDefinition of S.schema_definition
    | OperationTypeDefinition of S.operation_type_definition
    | ScalarTypeDefinition of S.scalar_type_definition
    | ObjectTypeDefinition of S.object_type_definition
    | FieldDefinition of S.field_definition
    | InputValueDefinition of S.input_value_definition
    | InterfaceTypeDefinition of S.interface_type_definition
    | UnionTypeDefinition of S.union_type_definition
    | EnumTypeDefinition of S.enum_type_definition
    | EnumValueDefinition of S.enum_value_definition
    | InputObjectTypeDefinition of S.input_object_type_definition
    | DirectiveDefinition of S.directive_definition
    | SchemaExtension of S.schema_extension
    | ScalarTypeExtension of S.scalar_type_extension
    | ObjectTypeExtension of S.object_type_extension
    | InterfaceTypeExtension of S.interface_type_extension
    | UnionTypeExtension of S.union_type_extension
    | EnumTypeExtension of S.enum_type_extension
    | InputObjectTypeExtension of S.input_object_type_extension


  let opt_list (decode: 'a list Json.Decode.decoder): 'a list Json.Decode.decoder = fun json ->
    try decode json with
    | Json.Decode.DecodeError m -> []

  let rec d (json: Js.Json.t) : node = 
    Json.Decode.(
      let kind = json |> field "kind" string in
      match kind with
      | "Document" -> Document {
          definitions = json |> field "definitions" (list definition)
        }
      | "Name" -> Name (json |> field "value" string)
      | "OperationDefinition" -> OperationDefinition {
          tpe = json |> field "operation" operation_type;
          name = json |> optional (field "name" name);
          variables = json |> opt_list (field "variableDefinitions" (list variable_definition));
          directives = json |> opt_list (field "directives" (list directive));
          selectionSet = json |> field "selectionSet" selection_set
        }
      | "VariableDefinition" -> VariableDefinition {
          variable = json |> field "variable" variable;
          tpe = json |> field "type" tpe;
          defaultValue = json |> optional (field "defaultValue" vc)
        }
      | "Variable" -> Variable (json |> field "name" string)
      | "SelectionSet" -> SelectionSet (json |> field "selections" (list selection))
      | "Field" ->
        Field {
          alias = json |> optional (field "alias" name);
          name = json |> field "name" name;
          arguments =  json |> opt_list (field "arguments" (list argument));
          directives = json |> opt_list (field "directives" (list directive));
          selectionSet = json |> withDefault [] (field "selectionSet" selection_set);
        }
      | "FragmentSpread" -> FragmentSpread {
          name = json |> (field "name" name);
          directives = json |> opt_list (field "directives" (list directive));
        }
      | "InlineFragment" -> InlineFragment {
          condition = json |> optional (field "typeCondition" named_type);
          directives = json |> opt_list (field "directives" (list directive));
          selectionSet = json |> field "selectionSet" selection_set
        }
      | "FragmentDefinition" -> FragmentDefinition {
          name = json |> field "name" name;
          condition = json |> field "typeCondition" named_type;
          directives = json |> opt_list (field "directives" (list directive));
          selectionSet = json |> field "selectionSet" selection_set
        }

      | "NamedType" -> NamedType (json |> field "name" name)
      | "ListType" -> ListType (json |> field "type" tpe)
      | "NonNullType" -> NonNullType (json |> field "type" nntpe)
      | "SchemaDefinition" -> SchemaDefinition {
          directives = json |> opt_list (field "directives" (list directive_c));
          operations = json |> field "operationTypes" (list operation_type_definition);
        }
      | "OperationTypeDefinition" -> OperationTypeDefinition {
          tpe = json |> field "type" named_type;
          operation = json |> field "operation" operation_type
        }
      | "ScalarTypeDefinition" -> ScalarTypeDefinition {
          name = json |> field "name" name;
          description = json |> optional (field "description" string_value);
          directives = json |> opt_list (field "directives" (list directive_c));
        }
      | "ObjectTypeDefinition" -> ObjectTypeDefinition {
          name = json |> field "name" name;
          description = json |> optional (field "description" string_value);
          directives = json |> opt_list (field "directives" (list directive_c));
          implements = json |> opt_list (field "interfaces" (list named_type));
          fields = json |> opt_list (field "fields" (list field_definition))
        }
      | "FieldDefinition" -> FieldDefinition {
          name = json |> field "name" name;
          description = json |> optional (field "description" string_value);
          arguments = json |> opt_list (field "arguments" (list input_value_definition));
          tpe = json |> field "type" tpe;
          directives = json |> opt_list (field "directives" (list directive_c));
        }
      | "InputValueDefinition" -> InputValueDefinition {
          name = json |> field "name" name;
          description = json |> optional (field "description" string_value);
          tpe = json |> field "type" tpe;
          defaultValue = json |> optional (field "defaultValue" vc);
          directives = json |> opt_list (field "directives" (list directive_c));
        }
      | "InterfaceTypeDefinition" -> InterfaceTypeDefinition {
          name = json |> field "name" name;
          description = json |> optional (field "description" string_value);
          directives = json |> opt_list (field "directives" (list directive_c));
          fields = json |> opt_list (field "fields" (list field_definition))
        }
      | "UnionTypeDefinition" -> UnionTypeDefinition {
          name = json |> field "name" name;
          description = json |> optional (field "description" string_value);
          directives = json |> opt_list (field "directives" (list directive_c));
          types = json |> opt_list (field "types" (list named_type));
        }
      | "EnumTypeDefinition" -> EnumTypeDefinition {
          name = json |> field "name" name;
          description = json |> optional (field "description" string_value);
          directives = json |> opt_list (field "directives" (list directive_c));
          values = json |> opt_list (field "values" (list enum_value_definition));
        }
      | "EnumValueDefinition" -> EnumValueDefinition {
          value = json |> field "name" name;
          description = json |> optional (field "description" string_value);
          directives = json |> opt_list (field "directives" (list directive_c));
        }
      | "InputObjectTypeDefinition" -> InputObjectTypeDefinition {
          description = json |> optional (field "description" string_value);
          name = json |> field "name" name;
          directives = json |> opt_list (field "directives" (list directive_c));
          fields = json |> opt_list (field "fields" (list input_value_definition))
        }
      | "DirectiveDefinition" -> DirectiveDefinition {
          description = json |> optional (field "description" string_value);
          name = json |> field "name" name;
          arguments = json |> opt_list (field "arguments" (list input_value_definition));
          locations = json |> field "locations" (list directive_location);
        }
      | "SchemaExtension" -> SchemaExtension {
          directives = json |> opt_list (field "directives" (list directive_c));
          operations = json |> field "operationTypes" (list operation_type_definition);
        }
      | "ScalarTypeExtension" -> ScalarTypeExtension {
          name = json |> field "name" name;
          directives = json |> opt_list (field "directives" (list directive_c));
        }
      | "ObjectTypeExtension" -> ObjectTypeExtension {
          name = json |> field "name" name;
          directives = json |> opt_list (field "directives" (list directive_c));
          implements = json |> opt_list (field "interfaces" (list named_type));
          fields = json |> opt_list (field "fields" (list field_definition))
        }
      | "InterfaceTypeExtension" -> InterfaceTypeExtension {
          name = json |> field "name" name;
          directives = json |> opt_list (field "directives" (list directive_c));
          fields = json |> opt_list (field "fields" (list field_definition))
        }
      | "UnionTypeExtension" -> UnionTypeExtension {
          name = json |> field "name" name;
          directives = json |> opt_list (field "directives" (list directive_c));
          types = json |> opt_list (field "types" (list named_type));
        }
      | "EnumTypeExtension" -> EnumTypeExtension {
          name = json |> field "name" name;
          directives = json |> opt_list (field "directives" (list directive_c));
          values = json |> opt_list (field "values" (list enum_value_definition));
        }
      | "InputObjectTypeExtension" -> InputObjectTypeExtension {
          name = json |> field "name" name;
          directives = json |> opt_list (field "directives" (list directive_c));
          fields = json |> opt_list (field "fields" (list input_value_definition))
        }
      | kind -> raise (Json.Decode.DecodeError ("Unexpected kind value: " ^ kind))
    )
  and directive_location json : S.directive_location = 
    let n = name json in
    match S.name_to_directive_location n with
    | Some n -> n
    | None -> raise (e "valid directive location")

  and enum_value_definition json : S.enum_value_definition= 
    match d json with | EnumValueDefinition d -> d | _ -> raise (e "enum value definition")

  and input_value_definition json : S.input_value_definition = 
    match d json with | InputValueDefinition d -> d | _ -> raise (e "input value definition")

  and field_definition json : S.field_definition =
    match d json with | FieldDefinition d -> d | _ -> raise (e "field definition")

  and string_value json : S.string_value = 
    Json.Decode.(
      let block = json |> withDefault false (field "block" bool) in
      if block 
      then S.BlockStringValue (json |> field "value" string)
      else S.StringValue (json |> field "value" string)
    )
  and operation_type_definition json: S.operation_type_definition = 
    match d json with | OperationTypeDefinition d -> d | _ -> raise (e "operation type definition")

  and nntpe json : S.non_null_type=
    match d json with 
    | ListType d -> S.ListType d 
    | NamedType d -> S.NamedType d 
    | _ -> raise (e "non-null type")

  and named_type json : S.named_type= 
    match d json with | NamedType d -> d | _ -> raise (e "named type")

  and argument (json: Js.Json.t): S.v S.argument =
    Json.Decode.(
      match json |> field "kind" string with
      | "Argument" -> {
          name = json |> field "name" name;
          value = json |> field "value" v;
        }
      | _ -> raise (e "argument")
    )

  and argument_c (json: Js.Json.t): S.vc  S.argument =
    Json.Decode.(
      match json |> field "kind" string with
      | "Directive" -> {
          name = json |> field "name" name;
          value = json |> field "value" vc;
        }
      | _ -> raise (e "directive")
    )

  and selection json : S.selection = 
    match d json with 
    | Field  d -> S.Field d 
    | FragmentSpread  d -> S.FragmentSpread d 
    | InlineFragment  d -> S.InlineFragment d 
    | _ -> raise (e "selection")

  and operation_type json: S.operation_type =
    Json.Decode.(
      let op = string json in
      match op with
      | "query" -> S.Query
      | "subscription" -> S.Subscription
      | "mutation" -> S.Mutation
      | _ -> raise (e "operation type")
    )
  and variable json : S.variable  = 
    match d json with 
    | Variable v -> v
    | _ -> raise (e "variable")

  and v json : S.value = 
    Json.Decode.(
      match json |> field "kind" string with
      | "IntValue" -> S.IntValue (Int32.of_string (json |> field "value" string))
      | "FloatValue" -> S.FloatValue  (json |> field "value" string)
      | "StringValue" -> S.StringValue (string_value json)
      | "BooleanValue" -> S.BooleanValue (json |> field "value" bool)
      | "NullValue" -> S.NullValue
      | "EnumValue" -> S.EnumValue (json |> field "value" string)
      | "ListValue" -> S.ListValue (json |> field "value" (list v))
      | "ObjectValue" -> S.ObjectValue (json |> (field "fields" (list (object_field))))
      | "Variable" -> S.Variable (variable json)
      | _ -> raise (e "value")
    )

  and vc json: S.value_const =
    Json.Decode.(
      match json |> field "kind" string with
      | "IntValue" -> S.IntValue (Int32.of_string (json |> field "value" string))
      | "FloatValue" -> S.FloatValue  (json |> field "value" string)
      | "StringValue" -> S.StringValue (string_value json)
      | "BooleanValue" -> S.BooleanValue (json |> field "value" bool)
      | "NullValue" -> S.NullValue
      | "EnumValue" -> S.EnumValue (json |> field "value" string)
      | "ListValue" -> S.ListValue (json |> field "value"  (list vc))
      | "ObjectValue" -> S.ObjectValue (json |> (field "fields" (list object_field_c)))
      | _ -> raise (e "value")
    )


  and object_field (json: Js.Json.t) : S.v S.object_field= 
    Json.Decode.(
      match json |> field "kind" string with
      | "ObjectField" -> 
        let f: 'a S.object_field = 
          {
            name = json |> field "name" name;
            value = json |> field "value" v;
          }
        in f 
      | _ -> raise (e "object field")
    )
  and object_field_c (json: Js.Json.t) : S.vc S.object_field= 
    Json.Decode.(
      match json |> field "kind" string with
      | "ObjectField" -> 
        let f: S.vc S.object_field = 
          {
            name = json |> field "name" name;
            value = json |> field "value" vc;
          }
        in f 
      | _ -> raise (e "object field")
    )

  and variable_definition json = 
    match d json with | VariableDefinition d -> d | _ -> raise (e "variable definition")

  and name json: S.name = 
    match d json with | Name d -> d | _ -> raise (e "name")

  and tpe json : S.tpe =
    match d json with 
    | ListType d -> S.ListType d 
    | NamedType d -> S.NamedType d
    | NonNullType d -> S.NonNullType d
    | _ -> raise (e "type")


  and selection_set json : S.selection list =
    match d json with | SelectionSet d -> d | _ -> raise (e "selection set")

  and directive (json: Js.Json.t): S.v S.directive = 
    Json.Decode.(
      match json |> field "kind" string with
      | "Directive" -> {
          name = json |> field "name" string;
          arguments = json |> opt_list (field "arguments" (list argument))
        }
      | _ -> raise (e "directive")
    )
  and directive_c (json: Js.Json.t): S.vc S.directive = 
    Json.Decode.(
      match json |> field "kind" string with
      | "Directive" -> {
          name = json |> field "name" string;
          arguments = json |> opt_list (field "arguments" (list argument_c))
        }
      | _ -> raise (e "directive")
    )


  and definition json : S.definition =
    match d json with
    | OperationDefinition d -> S.ExecutableDefinition (S.OperationDefinition d)
    | FragmentDefinition d -> S.ExecutableDefinition (S.FragmentDefinition d)


    | SchemaDefinition d -> S.TypeSystemDefinition (S.SchemaDefinition d)

    | ObjectTypeDefinition d -> S.TypeSystemDefinition (S.TypeDefinition (S.ObjectTypeDefinition d))
    | InterfaceTypeDefinition d -> S.TypeSystemDefinition (S.TypeDefinition (S.InterfaceTypeDefinition d))
    | EnumTypeDefinition d -> S.TypeSystemDefinition (S.TypeDefinition (S.EnumTypeDefinition d))
    | ScalarTypeDefinition d -> S.TypeSystemDefinition (S.TypeDefinition (S.ScalarTypeDefinition d))
    | UnionTypeDefinition d -> S.TypeSystemDefinition (S.TypeDefinition (S.UnionTypeDefinition d))
    | InputObjectTypeDefinition d -> S.TypeSystemDefinition (S.TypeDefinition (S.InputObjectTypeDefinition d))

    | DirectiveDefinition d -> S.TypeSystemDefinition (S.DirectiveDefinition d)


    | SchemaExtension d -> S.TypeSystemExtension (S.SchemaExtension d)

    | ObjectTypeExtension d -> S.TypeSystemExtension (S.TypeExtension (S.ObjectTypeExtension d))
    | InterfaceTypeExtension d -> S.TypeSystemExtension (S.TypeExtension (S.InterfaceTypeExtension d))
    | EnumTypeExtension d -> S.TypeSystemExtension (S.TypeExtension (S.EnumTypeExtension d))
    | ScalarTypeExtension d -> S.TypeSystemExtension (S.TypeExtension (S.ScalarTypeExtension d))
    | UnionTypeExtension d -> S.TypeSystemExtension (S.TypeExtension (S.UnionTypeExtension d))
    | InputObjectTypeExtension d -> S.TypeSystemExtension (S.TypeExtension (S.InputObjectTypeExtension d))

    | _ -> raise (e "definition")


  let document json =
    match d json with
    | Document d -> d
    | _ -> raise (Json.Decode.DecodeError "Expected document.")

  let executable_document (s: Js.Json.t) = 
    let d = document s in
    Gql_ast.document_to_executable_document d
end

exception Parse_error of string

let document_to_js d: Js.Json.t =  Encode.document d

let schema_document_to_js: S.schema_document -> Js.Json.t = Encode.schema_document

let executable_document_to_js: S.executable_document -> Js.Json.t = Encode.executable_document

let js_to_executable_document:  Js.Json.t -> S.executable_document =
  try Decode.executable_document with
  | Json.Decode.DecodeError e -> raise (Parse_error e)

external str : Js.Json.t -> string = "stringify" [@@bs.scope "JSON"][@@bs.val]

let print t = Js.log (str t)
