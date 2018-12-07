
module S = Gql_ast


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

let argument (v: 'a Json.Encode.encoder) (a: 'a S.argument) = Json.Encode.(
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
      ("operations", empty_to_null operation_type_definitions d.operations)
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
      ("directives ", directives value f.directives);
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
      ("alias ", nullable name f.alias);
      ("name ", name f.name);
      ("arguments ", arguments value f.arguments);
      ("directives ", directives value f.directives);
      ("selectionSet ", empty_to_null selection_set f.selectionSet);
    ]
  )
and inline_fragment (f: S.inline_fragment) =
  Json.Encode.(
    object_ [
      ("kind", string "InlineFragment");
      ("typeCondition ", nullable named_type f.condition);
      ("directives ", directives value f.directives);
      ("selectionSet ", selection_set f.selectionSet);
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
      ("kind", string "SchemaExtension");
      ("directives", directives value_const d.directives);
      ("operations", operation_type_definitions d.operations)
    ]
  )


let fragment_definition  (d: S.fragment_definition) = 
  Json.Encode.(
    object_ [
      ("kind", string "FragmentDefinition");
      ("name", name d.name);
      ("typeCondition ",  named_type d.condition);
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


let document_to_js: S.document -> Js.Json.t = document

let schema_document_to_js: S.schema_document -> Js.Json.t = schema_document
