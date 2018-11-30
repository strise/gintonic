
module T = Trans_ast
module S = Schema_ast


exception Transformation_error of string

type schema_definition = (S.schema_definition * T.schema_transformation)

type directive_definition = S.directive_definition

type type_definition = 
  | ScalarTypeDefinition of (S.scalar_type_definition * T.scalar_type_transformation)
  | ObjectTypeDefinition of (S.object_type_definition * T.object_type_transformation)
  | InterfaceTypeDefinition of (S.interface_type_definition * T.interface_type_transformation)
  | UnionTypeDefinition of (S.union_type_definition * T.union_type_transformation)
  | EnumTypeDefinition of (S.enum_type_definition * T.enum_type_transformation)
  | InputObjectTypeDefinition of (S.input_object_type_definition * T.input_object_type_transformation)

type document = {
  schema: schema_definition;
  directives: directive_definition list;
  types: type_definition list;
}

type transformation = {
  t: T.document;
  s: S.schema_document;
  d: document
}


let m_operation_type_definition (m: S.operation_type_definition) = match m with
  | {operation = S.Query} -> T.Query
  | {operation = S.Mutation} -> T.Mutation
  | {operation = S.Subscription} -> T.Subscription

let m_operation_type (m: T.operation_type) = match m with
  | T.Query -> S.Query
  | T.Mutation -> S.Mutation
  | T.Subscription -> S.Subscription


let tt_to_selector (tt: T.type_transformation) = 
  match tt with
  | T.ScalarTypeTransformation t -> t.selector
  | T.EnumTypeTransformation t -> t.selector
  | T.InputObjectTypeTransformation t -> t.selector
  | T.InterfaceTypeTransformation t -> t.selector
  | T.ObjectTypeTransformation t -> t.selector
  | T.UnionTypeTransformation t -> t.selector

let td_to_name (td: S.type_definition) = 
  match td with
  | S.ScalarTypeDefinition t -> t.name
  | S.EnumTypeDefinition t -> t.name
  | S.InputObjectTypeDefinition t -> t.name
  | S.InterfaceTypeDefinition t -> t.name
  | S.ObjectTypeDefinition t -> t.name
  | S.UnionTypeDefinition t -> t.name

let b_document (t: T.document) (s: S.schema_document): document = 
  let 
    sts : T.schema_transformation list = 
    List.fold_right
      (fun t acc-> 
         match t with 
         | T.SchemaTransformation s -> s::acc
         | _ -> acc
      ) 
      t.transformations
      [] 
  in
  let st = match sts with
    | s::[] -> s
    | [] -> List.map m_operation_type_definition s.schema.operations
    | ll -> raise (Transformation_error ("Only a single schema transformation is allowed. Found " ^ (string_of_int (List.length ll))))
  in
  let 
    tps1 = List.map 
      (fun t -> match t with
         | S.ScalarTypeDefinition s -> (s.name, ScalarTypeDefinition (s, {description = None; selector = {alias = None; name = s.name}}))
         | S.ObjectTypeDefinition s -> (s.name, ObjectTypeDefinition (s, {description = None; selector = {alias = None; name = s.name}; fields = []}))
         | S.InterfaceTypeDefinition s -> (s.name, InterfaceTypeDefinition (s, {description = None; selector = {alias = None; name = s.name}; fields = []}) )
         | S.UnionTypeDefinition s -> (s.name, UnionTypeDefinition (s, {description = None; selector = {alias = None; name = s.name}}) )
         | S.EnumTypeDefinition s -> (s.name, EnumTypeDefinition (s, {description = None; selector = {alias = None; name = s.name}; values = []}) )
         | S.InputObjectTypeDefinition s -> (s.name, InputObjectTypeDefinition (s, {description = None; selector = {alias = None; name = s.name}; fields = []}))
      ) 
      s.types
  in 
  let 
    ots : T.type_transformation list = 
    List.fold_right
      (fun t acc-> 
         match t with 
         | T.TypeTransformation s -> s::acc
         | _ -> acc
      ) 
      t.transformations
      [] 
  in

  let 
    tps2 = List.fold_right
      (fun t acc->
         let n = (tt_to_selector t).name in
         match (Utils.assoc_opt n acc, t) with
         | (None, _) -> raise (Transformation_error ("Type with the name: " ^ n ^ " wasn't found."))
         | (Some (ScalarTypeDefinition (d, _)), T.ScalarTypeTransformation t) -> (n, ScalarTypeDefinition (d, t))::acc
         | (Some (ObjectTypeDefinition (d, _)), T.ObjectTypeTransformation t) -> (n, ObjectTypeDefinition (d, t))::acc
         | (Some (InterfaceTypeDefinition (d, _)), T.InterfaceTypeTransformation t) -> (n, InterfaceTypeDefinition (d, t))::acc
         | (Some (UnionTypeDefinition (d, _)), T.UnionTypeTransformation t) -> (n, UnionTypeDefinition (d, t))::acc
         | (Some (EnumTypeDefinition (d, _)), T.EnumTypeTransformation t) -> (n, EnumTypeDefinition (d, t))::acc
         | (Some (InputObjectTypeDefinition (d, _)), T.InputObjectTypeTransformation t) -> (n, InputObjectTypeDefinition (d, t))::acc
         | _ -> raise (Transformation_error ("Transformation type mismatch for: " ^ n))
      )
      ots
      tps1
  in
  let 
    tps3 = Utils.flatten (List.map  (fun n -> Utils.assoc_opt n tps2) (List.map td_to_name s.types))
  in
  {schema = s.schema, st; directives = s.directives; types = tps3}



let transform s t: transformation = {t = t; s = s; d = b_document t s}

module Schema : sig

  val s: transformation -> S.schema_document
end = struct

  type ctx = { typeAliasLookup: (string * string) list}

  let build_schema_context (t: transformation) : ctx =
    let aliases = List.fold_right 
        (fun t acc -> 
           match t with 
           | T.TypeTransformation t -> 
             let sel = tt_to_selector t in
             (match sel with
              | {alias = Some a; name = n} -> (n, a)::acc
              | _ -> acc
             )
           | _ -> acc
        ) t.t.transformations [] in
    { typeAliasLookup = aliases }

  let s_name (c: ctx) (n: S.name): S.name = 
    match Utils.assoc_opt n c.typeAliasLookup with
    | Some alias -> alias
    | _ -> n

  let m_string_value (tv: T.string_value): S.string_value = match tv with
    | T.StringValue v -> S.StringValue v
    | T.BlockStringValue v -> S.BlockStringValue v

  let rec s_tpe c (t: S.tpe) : S.tpe= 
    match t with
    | S.NamedType t -> S.NamedType (s_name c t)
    | S.ListType t -> S.ListType (s_tpe c t)
    | S.NonNullType t -> S.NonNullType (s_nnt c t)

  and s_nnt c (t: S.non_null_type) : S.non_null_type =
    match t with
    | S.ListType t -> S.ListType (s_tpe c t)
    | S.NamedType t -> S.NamedType (s_name c t)


  let s_operation_type_definition c (d: S.operation_type_definition) : S.operation_type_definition= 
    {d with tpe = s_name c d.tpe}


  let s_schema_definition (c: ctx) (s: schema_definition) = match s with
    | (p1, []) -> p1
    | (p1, p2) -> 
      let ops = List.map (fun (o: S.operation_type_definition) -> (o.operation, o)) p1.operations in
      {p1 with operations = List.map (fun o -> 
           match Utils.assoc_opt (m_operation_type o) ops with
           | Some r -> s_operation_type_definition c r
           | None -> raise (Transformation_error "Operation not found")
         ) p2}


  let s_input_value_definition (c: ctx) (d: S.input_value_definition) (t: T.input_value): S.input_value_definition = 
    let 
      desced = match t.description with
      | Some desc -> {d with description = Some (m_string_value desc)}
      | None -> d
    in
    {desced with tpe = s_tpe c desced.tpe }

  let s_input_values_definition (c: ctx) (ds: S.input_value_definition list) (ts: T.input_value list): S.input_value_definition list = 
    let 
      args = List.map (fun (v: T.input_value) -> (v.name, v)) ts
    in
    List.fold_right 
      (fun (d: S.input_value_definition) acc -> 
         match Utils.assoc_opt d.name args with
         | Some {value = Some _} -> acc
         | Some t -> (s_input_value_definition c d t)::acc
         | _ -> {d with tpe = s_tpe c d.tpe }::acc
      ) ds []

  let s_directive_definition (c: ctx) (d: directive_definition): S.directive_definition = 
    {d with arguments = s_input_values_definition c d.arguments []}

  let s_field_definition (c: ctx) (fd: S.field_definition) (ft: T.field_transformation): S.field_definition =
    let named = 
      match ft with
      | {selector = {alias = Some a}} -> {fd with name = a}
      | {selector = {alias = None; name = n}} -> {fd with name = n}
    in
    let described = 
      match ft with
      | {description = Some s} -> {named with description = Some (m_string_value s)}
      | _ -> named
    in
    {described with arguments = s_input_values_definition c named.arguments ft.arguments; tpe = s_tpe c described.tpe}

  let s_fields_definition (c: ctx) (fds: S.field_definition list) (fts: T.field_transformation list): S.field_definition list = 

    match fts with
    | [] -> 
      List.map (fun (d: S.field_definition) -> {d with tpe = s_tpe c d.tpe}) fds
    | fts -> 
      let fieldsAssoc = List.map (fun (def: S.field_definition) -> (def.name, def)) fds in
      let mapper (ft: T.field_transformation): S.field_definition =
        match Utils.assoc_opt ft.selector.name fieldsAssoc with
        | Some fd -> s_field_definition c fd ft
        | None -> raise (Transformation_error ("Field with name: " ^ ft.selector.name ^ " not found."))
      in
      List.map mapper fts


  let s_object_type_definition (c: ctx) (d : S.object_type_definition) (t: T.object_type_transformation): S.object_type_definition = 
    let desced = 
      match t.description with
      | Some desc -> {d with description = Some (m_string_value desc)}
      | _ -> d
    in
    { desced with
      name = s_name c desced.name;
      implements = List.map (s_name c) desced.implements;
      fields = s_fields_definition c d.fields t.fields
    }

  let s_interface_type_definition (c: ctx) (d : S.interface_type_definition) (t: T.interface_type_transformation): S.interface_type_definition = 
    let 
      fielded = {d with fields = s_fields_definition c d.fields t.fields }
    in
    let desced = 
      match t.description with
      | Some d -> {fielded with description = Some (m_string_value d)}
      | _ -> fielded
    in
    { desced with
      name = s_name c desced.name;
      fields = s_fields_definition c d.fields t.fields
    }


  let s_scalar_type_definition c (p1: S.scalar_type_definition) (p2: T.scalar_type_transformation) = 
    let desced = 
      match p2 with
      | {description = Some d} -> {p1 with description = Some (m_string_value d)}
      | _ -> p1
    in
    {desced with name = s_name c p1.name}


  let s_union_type_definition c (p1: S.union_type_definition) (p2: T.union_type_transformation) = 
    let described = 
      match p2 with
      | {description = Some d} -> {p1 with description = Some (m_string_value d)}
      | _ -> p1
    in 
    {described with name = s_name c p1.name}


  let s_enum_value_definition _ (d: S.enum_value_definition ) (t: T.enum_value_transformation ): S.enum_value_definition  = 
    let 
      desced = match t.description with
      | Some desc -> {d with description = Some (m_string_value desc)}
      | None -> d
    in 
    desced 
  let s_enum_values_definition c (ds: S.enum_value_definition list) (ts: T.enum_value_transformation list): S.enum_value_definition list = 

    let trans = List.map (fun (d: T.enum_value_transformation) -> (d.value, d)) ts in
    List.map
      (fun (d: S.enum_value_definition)-> 
         match Utils.assoc_opt d.value trans with
         | Some t -> s_enum_value_definition c d t
         | None -> d
      )
      ds

  let s_enum_type_definition c (d: S.enum_type_definition) (t: T.enum_type_transformation): S.enum_type_definition =
    let described = 
      match t with
      | {description = Some desc} -> {d with description = Some (m_string_value desc)}
      | _ -> d
    in 

    {
      described with
      name = s_name c d.name;
      values = s_enum_values_definition c d.values t.values
    }

  let s_input_object_type_definition c (d: S.input_object_type_definition) (t: T.input_object_type_transformation): S.input_object_type_definition = 
    let described = 
      match t with
      | {description = Some desc} -> {d with description = Some (m_string_value desc)}
      | _ -> d
    in 

    {
      described with
      name = s_name c d.name;
      fields = s_input_values_definition c d.fields t.fields
    }


  let s_type_definition (c: ctx) (d: type_definition) = match d with
    | ScalarTypeDefinition (p1, p2) -> S.ScalarTypeDefinition (s_scalar_type_definition c p1 p2)
    | ObjectTypeDefinition (p1, p2) -> S.ObjectTypeDefinition (s_object_type_definition c p1 p2)
    | InterfaceTypeDefinition (p1, p2) -> S.InterfaceTypeDefinition (s_interface_type_definition c p1 p2)
    | UnionTypeDefinition (p1, p2) -> S.UnionTypeDefinition (s_union_type_definition c p1 p2)
    | EnumTypeDefinition (p1, p2) -> S.EnumTypeDefinition (s_enum_type_definition c p1 p2)
    | InputObjectTypeDefinition (p1, p2) -> S.InputObjectTypeDefinition (s_input_object_type_definition c p1 p2)

  let s_document (c: ctx) (d: document): S.schema_document = 
    let schema: S.schema_definition = s_schema_definition c d.schema
    in
    let
      types: S.type_definition list = 
      List.map (s_type_definition c) d.types
    in
    let
      directives: S.directive_definition list = 
      List.map (s_directive_definition c) d.directives
    in
    {
      schema = schema;
      directives = directives;
      types = types
    }


  let s t =   s_document (build_schema_context t) t.d 

end
exception Not_implememted

module Correct : sig
  val c : S.schema_document -> S.schema_document
end = 
struct
  type ctx = {
    inputs: (string  * S.input_object_type_definition) list;
    dirArgs: ((string * string) * S.tpe) list;
  }

  let c_argument (m: string -> 'a -> 'a) (a: 'a S.argument): 'a S.argument = 
    {
      a with 
      value = m a.name a.value
    }

  let c_directive (m: S.tpe -> 'a -> 'a) (c: ctx) (d: 'a S.directive): 'a S.directive = 

    let 
      f (s1 : string) (s2: string) = match Utils.assoc_opt (s1, s2) c.dirArgs with
      | Some t -> m t
      | None -> raise (Transformation_error ("Failed to find directive with name " ^ s1 ^ " and argument " ^ s2)) 
    in 
    {
      d with
      arguments = List.map (c_argument (f d.name)) d.arguments
    }


  let rec c_object_fields_const (c: ctx) (n: S.input_object_type_definition) (v: S.value_const S.object_field list): S.value_const S.object_field list = 
    let vs = List.fold_right (fun (v: 'a S.object_field) acc -> (v.name, v)::acc ) v [] in
    List.fold_right 
      (fun (v: S.input_value_definition) acc -> 
         match Utils.assoc_opt v.name vs with
         | Some f -> {f with value = (c_value_const c v.tpe f.value)}::acc
         | _ -> acc 
      )
      n.fields
      []

  and c_value_const (c: ctx) (t: S.tpe) (v: S.value_const): S.value_const = 
    match (t, v) with
    | (S.ListType t, S.ListValue v) -> S.ListValue (List.map (c_value_const c t) v)
    | (S.ListType t, v) -> c_value_const c t v
    | (S.NonNullType _, S.NullValue) -> v
    | (S.NonNullType (S.NamedType n), v) -> c_value_const c (S.NamedType n) v
    | (S.NonNullType (S.ListType l), v) -> c_value_const c (S.ListType l) v
    | (S.NamedType n, (S.ObjectValue v)) -> 
      (
        match Utils.assoc_opt n c.inputs with
        | Some i -> S.ObjectValue (c_object_fields_const c i v)
        | None -> S.ObjectValue v
      )
    | (S.NamedType _, v) -> v



  let c_default_value (c: ctx) (t: S.tpe) (v: S.default_value): S.default_value = c_value_const c t v

  let c_input_value_definition (c: ctx) (d: S.input_value_definition): S.input_value_definition=
    {d with defaultValue = Utils.opt_map (c_default_value c d.tpe) d.defaultValue}

  let c_directive_definition (c: ctx) (d: S.directive_definition): S.directive_definition = 
    {d with arguments = List.map (c_input_value_definition c) d.arguments}

  let c_field_definition (c: ctx) (f: S.field_definition): S.field_definition =
    {f with
     directives = List.map (c_directive (c_value_const c) c) f.directives;
     arguments = List.map (c_input_value_definition c) f.arguments
    }

  let c_scalar_type_definition (c: ctx) (t: S.scalar_type_definition): S.scalar_type_definition =
    {
      t with
      directives = List.map (c_directive (c_value_const c) c) t.directives;
    }

  let c_object_type_definition (c: ctx) (t: S.object_type_definition): S.object_type_definition =
    {
      t with
      directives = List.map (c_directive (c_value_const c) c) t.directives;
      fields = List.map (c_field_definition c) t.fields
    }

  let c_interface_type_definition (c: ctx) (t: S.interface_type_definition): S.interface_type_definition =
    {
      t with
      directives = List.map (c_directive (c_value_const c) c) t.directives;
      fields = List.map (c_field_definition c) t.fields
    }

  let c_union_type_definition (c: ctx) (t: S.union_type_definition): S.union_type_definition = 
    {
      t with
      directives = List.map (c_directive (c_value_const c) c) t.directives;
    }

  let c_enum_value_definition (c: ctx) (d: S.enum_value_definition): S.enum_value_definition =
    {
      d with
      directives = List.map (c_directive (c_value_const c) c) d.directives;
    }

  let c_enum_type_definition (c: ctx) (t: S.enum_type_definition): S.enum_type_definition =
    {
      t with
      directives = List.map (c_directive (c_value_const c) c) t.directives;
      values = List.map (c_enum_value_definition c) t.values
    }

  let c_input_object_type_definition (c: ctx) (t: S.input_object_type_definition): S.input_object_type_definition =
    {
      t with
      directives = List.map (c_directive (c_value_const c) c) t.directives;
      fields = List.map (c_input_value_definition c) t.fields
    } 

  let c_type_definition (c: ctx) (d: S.type_definition): S.type_definition =
    match d with
    | S.ScalarTypeDefinition t -> S.ScalarTypeDefinition (c_scalar_type_definition c t)
    | S.ObjectTypeDefinition t -> S.ObjectTypeDefinition (c_object_type_definition c t)
    | S.InterfaceTypeDefinition t -> S.InterfaceTypeDefinition (c_interface_type_definition c t)
    | S.UnionTypeDefinition t -> S.UnionTypeDefinition (c_union_type_definition c t)
    | S.EnumTypeDefinition t -> S.EnumTypeDefinition (c_enum_type_definition c t)
    | S.InputObjectTypeDefinition t -> S.InputObjectTypeDefinition (c_input_object_type_definition c t)


  let c_document (c: ctx) (d: S.schema_document) : S.schema_document = 
    let dirs = List.map (c_directive_definition c) d.directives in
    let tps = List.map (c_type_definition c) d.types in
    {
      d with
      directives = dirs;
      types = tps;
    }

  let c (s: S.schema_document): S.schema_document = 
    let
      inputs = List.fold_right 
        (fun t acc -> 
           match t with
           | (S.InputObjectTypeDefinition t) -> (t.name, t)::acc
           | _ -> acc
        ) 
        s.types 
        [] 
    in 
    let 
      dirArgs = 
      List.fold_right 
        (fun (d: S.directive_definition) (acc: ((string * string) * S.tpe) list) -> 
           List.fold_right 
             (fun (a: S.input_value_definition) acc ->
                ((d.name, a.name), a.tpe
                )::acc)
             d.arguments
             acc
        )
        s.directives
        []
    in 
    c_document {inputs = inputs; dirArgs = dirArgs} s


end

module ShakeIt: sig
  val c: S.schema_document -> S.schema_document
end = struct
  type ctx = {
    types: (string * S.type_definition) list;
    possibleTypes: (string * string) list
  }

  let rec d_field_definition (c: ctx) (td: S.field_definition) (l: string list) : string list = 
    List.fold_right
      (d_input_value_definition c)
      td.arguments
      (d_tpe c td.tpe l)

  and d_name (c: ctx) (n: S.name) (l: string list): string list =
    if 
      List.exists (fun v -> v == n) l 
    then
      l
    else
      match Utils.assoc_opt n c.types with
      | None -> l
      | Some t -> d_type_definition c t l 

  and d_tpe (c: ctx) (tt: S.tpe) (l: string list): string list = 
    match tt with
    | S.NamedType n -> d_name c n l
    | S.ListType t -> d_tpe c t l
    | S.NonNullType (S.ListType t) -> d_tpe c t l
    | S.NonNullType (S.NamedType n) -> d_tpe c (S.NamedType n) l

  and d_input_value_definition (c: ctx) (vd: S.input_value_definition): string list -> string list = 
    d_tpe c vd.tpe

  and d_possible_types (c: ctx) (n: string): string list -> string list = 
    List.fold_right
      (d_name c)
      (Utils.assoc_filter n c.possibleTypes)

  and d_type_definition (c: ctx) (t: S.type_definition) (l : string list): string list = 
    match t with
    | ScalarTypeDefinition tt -> tt.name::l
    | ObjectTypeDefinition tt -> 
      List.fold_right 
        (d_field_definition c) 
        tt.fields
        (List.fold_right
           (d_name c)
           tt.implements
           (tt.name::l)
        )
    | InterfaceTypeDefinition tt -> 
      List.fold_right 
        (d_field_definition c) 
        tt.fields 
        (d_possible_types c tt.name (tt.name::l))
    | UnionTypeDefinition tt -> List.fold_right (fun e acc -> e::acc) tt.types (tt.name::l)
    | EnumTypeDefinition tt -> tt.name::l
    | InputObjectTypeDefinition tt  -> List.fold_right (d_input_value_definition c) tt.fields (tt.name::l)

  let d_directive_definition (c: ctx) (t: S.directive_definition): string list -> string list = 
    List.fold_right (d_input_value_definition c) t.arguments

  let d_operation_type_definition (c: ctx) (t: S.operation_type_definition): string list -> string list =
    d_name c t.tpe

  let c (d: S.schema_document) = 
    let c =
      List.fold_right
        (fun t acc -> 
           match t with
           | (S.ScalarTypeDefinition tt) -> {acc with types = (tt.name, t)::acc.types}
           | (S.ObjectTypeDefinition tt) -> 
             { 
               types = (tt.name, t)::acc.types;
               possibleTypes = 
                 List.fold_right 
                   (fun (v: string) acc -> (v, tt.name)::acc)
                   tt.implements
                   acc.possibleTypes
             }
           | (S.InterfaceTypeDefinition tt) -> {acc with types = (tt.name, t)::acc.types}
           | (S.UnionTypeDefinition tt) -> {acc with types = (tt.name, t)::acc.types}
           | (S.EnumTypeDefinition tt) -> {acc with types = (tt.name, t)::acc.types}
           | (S.InputObjectTypeDefinition tt) -> {acc with types = (tt.name, t)::acc.types}
        )
        d.types
        {types = []; possibleTypes = []} 
    in
    let 
      tps: string list = 
      List.fold_right
        (d_directive_definition c)
        d.directives
        (
          List.fold_right 
            (d_operation_type_definition c)
            d.schema.operations
            []
        ) 
    in
    {
      d with
      types =
        List.filter 
          (fun v -> List.exists (fun e -> e == td_to_name v) tps)
          d.types
    }

end

module TypeCheck: sig
  val c: S.schema_document -> S.schema_document
end = struct

  exception TypeError of string

  type ctx = {
    interfaces: (string * S.interface_type_definition) list
  }

  let tt_object_type_defnition_1 _ (s: S.object_type_definition): unit =
    match s.fields with
    | [] -> raise (TypeError "An object type must define one or more fields")
    | _ -> ()

  let unique (f: 'a -> 'a -> bool) (e: exn) (l: 'a list): unit=
    let _ = 
      List.fold_right
        (fun a acc -> 
           if List.exists (f a) acc 
           then raise e
           else a::acc
        )
        l
        []
    in 
    ()

  let tt_object_type_definition_3 (c: ctx) (s: S.object_type_definition): unit=
    let err = (TypeError "An object type may declare that it implements one or more unique interfaces.") in
    let is = List.map 
        (fun n -> 
           match Utils.assoc_opt n c.interfaces with
           | Some i -> i
           | None -> raise err
        )
        s.implements
    in
    unique (==) err is



  let tt_object_type_definition c (s: S.object_type_definition) : unit =
    tt_object_type_defnition_1 c s;
    tt_object_type_definition_3 c s;
    ()

  let tt_interface_type_definition_1 _ (s: S.interface_type_definition): unit =
    match s.fields with
    | [] -> raise (TypeError "An Interface type must define one or more fields.")
    | _ -> ()

  let tt_interface_type_definition c (s: S.interface_type_definition): unit =
    tt_interface_type_definition_1 c s

  let tt_union_type_definition_1 _ (s: S.union_type_definition): unit = 
    let err = TypeError "A Union type must include one or more unique member types." in
    match s.types with
    | [] -> raise err
    | ss -> unique (=) err ss

  let tt_union_type_definition c (s: S.union_type_definition): unit = 
    tt_union_type_definition_1 c s

  let tt_enum_type_definition_1 _ (s: S.enum_type_definition): unit =
    let err = TypeError "An Enum type must define one or more unique enum values." in
    match s.values with
    | [] -> raise err
    | ss -> unique (=) err ss

  let tt_enum_type_definition c (s: S.enum_type_definition): unit =
    tt_enum_type_definition_1 c s


  let tt_input_object_definition_1 _ (s: S.input_object_type_definition): unit =
    let err = TypeError "An Input Object type must define one or more input fields." in
    match s.fields with
    | [] -> raise err
    | _ -> ()

  let tt_input_object_type_definition c (s: S.input_object_type_definition): unit =
    tt_input_object_definition_1 c s

  let tt_scalar_type_definition _ _ = ()

  let c (doc: S.schema_document): S.schema_document = 
    let
      interfaces = List.fold_right (fun l acc -> 
        match l with 
        | S.InterfaceTypeDefinition d -> (d.name, d)::acc
        | _ -> acc
      ) doc.types []
    in
    let ctx = {interfaces = interfaces} in
    let _ = 
      List.fold_right (
        fun t _ -> 
          match t with
          | S.InterfaceTypeDefinition t -> tt_interface_type_definition ctx t
          | S.UnionTypeDefinition t -> tt_union_type_definition ctx t
          | S.EnumTypeDefinition t -> tt_enum_type_definition ctx t
          | S.InputObjectTypeDefinition t -> tt_input_object_type_definition ctx t
          | S.ScalarTypeDefinition t -> tt_scalar_type_definition ctx t
          | S.ObjectTypeDefinition t -> tt_object_type_definition ctx t
      ) 
        doc.types
        ()
    in
    doc
end



let (>=): S.schema_document -> (S.schema_document -> S.schema_document) -> S.schema_document = fun s -> fun m -> m s

let schema (t: transformation) : S.schema_document =  
  Schema.s t
  >= Correct.c
  >= ShakeIt.c
  >= TypeCheck.c

let executable: transformation -> Schema_ast.executable_document -> Schema_ast.executable_document = fun _ -> Utils.identity
