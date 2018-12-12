
module T = Trans_ast
module S = Gql_ast

exception Transform_error of string
exception Query_transform_error of string

let build_in_scalars = 
  (S.ScalarTypeDefinition {description = None; name = "String"; directives = []})
  ::(S.ScalarTypeDefinition {description = None; name = "Int"; directives = []})
  ::(S.ScalarTypeDefinition {description = None; name = "Float"; directives = []})
  ::(S.ScalarTypeDefinition {description = None; name = "Boolean"; directives = []})
  ::(S.ScalarTypeDefinition {description = None; name = "ID"; directives = []})
  ::[]


let build_in_directives: S.directive_definition list =
  ({
    description = None;
    name = "deprecated";
    arguments = {
      description = None;
      name = "reason";
      tpe = S.NamedType "String";
      defaultValue = Some (S.StringValue (S.StringValue "\"No longer supported\""));
      directives = [];
    }::[];
    locations = (S.TypeSystemDirectiveLocation S.EnumValue)::(S.TypeSystemDirectiveLocation S.FieldDefinition)::[];
  })::
  ({
    description = None;
    name = "skip";
    arguments = {
      description = None;
      name = "if";
      tpe = S.NamedType "Boolean";
      defaultValue = None;
      directives = [];
    }::[];
    locations = 
      (S.ExecutableDirectiveLocation S.Field)::
      (S.ExecutableDirectiveLocation S.FragmentSpread)::
      (S.ExecutableDirectiveLocation S.InlineFragment)::
      [];
  })::
  ({
    description = None;
    name = "include";
    arguments = {
      description = None;
      name = "if";
      tpe = S.NamedType "Boolean";
      defaultValue = None;
      directives = [];
    }::[];
    locations = 
      (S.ExecutableDirectiveLocation S.Field)::
      (S.ExecutableDirectiveLocation S.FragmentSpread)::
      (S.ExecutableDirectiveLocation S.InlineFragment)::
      [];
  })::
  []

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

let m_string_value (tv: T.string_value): S.string_value = match tv with
  | T.StringValue v -> S.StringValue v
  | T.BlockStringValue v -> S.BlockStringValue v


let rec tv_to_svc (v: T.value): S.vc = 
  match v with
  | T.StringValue s -> 
    S.StringValue (m_string_value s)
  | T.BooleanValue b -> 
    S.BooleanValue b
  | T.IntValue i -> 
    S.IntValue i
  | T.FloatValue f -> 
    S.FloatValue f
  | T.NullValue -> 
    S.NullValue
  | T.EnumValue v -> 
    S.EnumValue v
  | T.ListValue vs -> 
    S.ListValue (List.map tv_to_svc vs)
  | T.ObjectValue fs -> 
    S.ObjectValue (List.map tof_to_sof fs)

and tof_to_sof (f: T.object_field): S.vc S.object_field = {name = f.name; value = tv_to_svc f.value}
let starts_with (sub: string) (prefix: string): bool = 
  if String.length sub < String.length prefix then
    false
  else
    String.sub sub 0 (String.length prefix) = prefix

module Schema : sig

  type res = {
    types: (S.name * S.type_definition) list;
    fields: ((S.name * S.name) * S.field_definition) list;
    input_fields: ((S.name * S.name) * S.input_value_definition) list;
    arguments: ((S.name * S.name * S.name) * S.input_value_definition) list;
    directive_arguments: ((S.name * S.name) * S.input_value_definition) list;
    new_fields: ((S.name * S.name) * S.field_definition) list;

    fixed_arguments: ((S.name * S.name) * S.vc S.argument) list;
    fixed_input_fields: ((S.name) * S.vc S.argument) list;
  }

  val s: S.schema_document -> T.document -> (S.schema_document * res)
  exception Transformation_error of string

end = struct

  type res = {
    types: (S.name * S.type_definition) list;
    fields: ((S.name * S.name) * S.field_definition) list;
    input_fields: ((S.name * S.name) * S.input_value_definition) list;
    arguments: ((S.name * S.name * S.name) * S.input_value_definition) list;
    directive_arguments: ((S.name * S.name) * S.input_value_definition) list;
    new_fields: ((S.name * S.name) * S.field_definition) list;

    fixed_arguments: ((S.name * S.name) * S.vc S.argument) list;
    fixed_input_fields: ((S.name) * S.vc S.argument) list;
  }

  exception Transformation_error of string

  type ctx = {
    find_type_alias: S.name -> S.name option;
    find_type_transformation: S.name -> T.type_transformation option;
    schema_transformation: T.schema_transformation option;
    find_object_type_transformation: S.name -> T.object_type_transformation option;
    find_interface_type_transformation: S.name -> T.interface_type_transformation option;
    find_scalar_type_transformation: S.name -> T.scalar_type_transformation option;
    find_enum_type_transformation: S.name -> T.enum_type_transformation option;
    find_union_type_transformation: S.name -> T.union_type_transformation option;
    find_input_object_type_transformation: S.name -> T.input_object_type_transformation option;
  }

  let listify (f: 'a * res -> 'a * res): 'a -> 'a list * res ->  'a list * res =
    fun a -> fun (ls, r) -> (
        let a, r = f (a, r) in
        a::ls, r
      )

  let s_name (c: ctx) ((n, r): S.name * res): S.name * res = 
    match c.find_type_alias n with
    | Some alias -> (alias, r)
    | _ -> (n, r)




  let rec s_tpe c ((t, r): S.tpe * res) : S.tpe * res= 
    match t with
    | S.NamedType t -> let n, r = s_name c (t, r) in S.NamedType n, r
    | S.ListType t -> let t, r = s_tpe c (t, r) in S.ListType t, r
    | S.NonNullType t -> let t, r = s_nnt c (t, r) in S.NonNullType t, r

  and s_nnt c ((t, r): S.non_null_type * res) : S.non_null_type * res =
    match t with
    | S.ListType t -> let t, r = (s_tpe c (t, r)) in S.ListType t, r
    | S.NamedType t -> let t, r = (s_name c (t, r)) in S.NamedType t, r


  let s_operation_type_definition c ((d, r): S.operation_type_definition * res) : S.operation_type_definition * res= 
    let n, r = s_name c (d.tpe, r) in
    {d with tpe = n}, r


  let s_schema_definition (c: ctx) ((s, r): S.schema_definition * res): (S.schema_definition * res) = 
    match (s, c.schema_transformation) with
    | (p1, None) -> 
      let ops, r = 
        List.fold_right
          (listify (s_operation_type_definition c))
          p1.operations
          ([], r)
      in
      {
        p1 with
        operations = ops
      }, r
    | (p1, Some p2) -> 
      let ops = List.map (fun (o: S.operation_type_definition) -> (o.operation, o)) p1.operations in
      let ops, r = 
        List.fold_right 
          (fun t (opps , res) -> 
             match Utils.assoc_opt (m_operation_type t) ops with
             | Some r -> 
               let op, res = s_operation_type_definition c (r, res) in
               (op::opps, res)
             | None -> raise (Transformation_error ("Operation \"" ^ (S.operation_type_to_string (m_operation_type t)) ^ "\" not found on schema."))
          )
          p2
          ([], r)
      in
      {
        p1 with 
        operations = ops
      }, r


  let s_input_value_definition (c: ctx) (t: T.input_value) ((d, r): S.input_value_definition * res): S.input_value_definition * res = 
    let 
      desced = match t.description with
      | Some desc -> {d with description = Some (m_string_value desc)}
      | None -> d
    in
    let t, r = s_tpe c (desced.tpe, r) in
    {desced with tpe = t }, r

  let s_input_values_definition (c: ctx) (upd1: S.vc S.argument -> res -> res) (upd2: S.input_value_definition -> res -> res) (ts: T.input_value list) ((ds, r): S.input_value_definition list * res): S.input_value_definition list * res = 
    let 
      args = List.map (fun (v: T.input_value) -> (v.name, v)) ts
    in
    List.fold_right 
      (fun (d: S.input_value_definition) (ds, r) -> 
         match Utils.assoc_opt d.name args with
         | Some {value = Some v; name} -> (ds, upd1 {name = name; value = tv_to_svc v} r)
         | Some t -> (
             let d, r = s_input_value_definition c t (d, r) in
             (d::ds, upd2 d r )
           )
         | _ -> (
             let t, r = s_tpe c (d.tpe, r) in
             (({d with tpe = t })::ds, upd2 d r) 
           )
      ) 
      ds
      ([], r) 

  let s_directive_definition (c: ctx) ((d, r): S.directive_definition * res) = 
    let args, r = s_input_values_definition 
        c 
        (fun _ -> Utils.identity)
        (fun a res -> {res with directive_arguments = ((d.name, a.name), a)::res.directive_arguments})
        []
        (d.arguments,r)
    in
    ({d with arguments = args}, r)

  let fd_arg_updater tn fn arg r = {r with fixed_arguments = ((tn, fn), arg)::r.fixed_arguments}

  let s_field_definition (c: ctx) (tn: S.name) (ft: T.field_transformation) ((fd, r): S.field_definition * res): S.field_definition * res =
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
    let args, r = 
      s_input_values_definition 
        c 
        (fd_arg_updater tn described.name) 
        (fun a res -> {res with arguments = ((tn, described.name, a.name), a)::res.arguments} )
        ft.arguments 
        (named.arguments, r)
    in
    let t, r = s_tpe c (described.tpe, r) in
    let fd2 = {described with arguments = args; tpe = t} in
    fd2, 
    {r with 
     fields = ((tn, fd2.name), fd)::r.fields;
     new_fields = ((tn, fd2.name), fd2)::r.new_fields
    }

  let s_fields_definition_no_trans c (tn: S.name) (f, r: S.field_definition * res): S.field_definition * res =
    let vs, r = 
      s_input_values_definition 
        c 
        (fd_arg_updater tn f.name) 
        (fun a res -> {res with arguments = ((tn, f.name, a.name), a)::res.arguments} )
        [] 
        (f.arguments, r)
    in
    let t, r = s_tpe c (f.tpe, r) in
    let fd2 = {f with tpe = t; arguments = vs } in
    fd2, 
    {r with 
     fields = ((tn, f.name),f)::r.fields; 
     new_fields = ((tn, fd2.name), fd2)::r.new_fields
    }

  let s_fields_definition_trans c (tn: S.name) (fts: T.field_transformation list) (fs, r: S.field_definition list * res)  : S.field_definition list * res =
    let fieldsAssoc = List.map (fun (def: S.field_definition) -> (def.name, def)) fs in
    List.fold_right
      (fun (ft: T.field_transformation) (fds, r) -> 
         match Utils.assoc_opt ft.selector.name fieldsAssoc with
         | Some fd -> 
           let fd, r = s_field_definition c tn ft(fd, r) in
           fd::fds, r
         | None -> raise (Transformation_error ("Field with name \"" ^ ft.selector.name ^ "\" not found on type \""^tn ^"\"."))
      )
      fts
      ([], r)

  let s_fields_definition (c: ctx) (tn: S.name) (fts: T.field_transformation list) ((fds, r): S.field_definition list * res): S.field_definition list * res = 
    match fts with
    | [] -> List.fold_right (listify (s_fields_definition_no_trans c tn)) fds ([], r) 
    | fts -> s_fields_definition_trans c tn fts (fds, r) 


  let s_object_type_definition (c: ctx) ((d, r) : S.object_type_definition * res): S.object_type_definition * res = 
    let t = c.find_object_type_transformation d.name in
    let desced = 
      match t with
      | Some {description = Some desc} -> {d with description = Some (m_string_value desc)}
      | _ -> d
    in
    let fts = 
      match t with
      | Some {fields} -> fields
      | None -> []
    in
    let n, r = s_name c (desced.name, r) in
    let implemenets, r = List.fold_right (listify (s_name c)) desced.implements ([], r) in
    let fds, r = s_fields_definition c n fts (d.fields, r) in
    { desced with
      name = n;
      implements = implemenets;
      fields = fds
    }, r

  let s_interface_type_definition (c: ctx) ((d, r) : S.interface_type_definition * res): S.interface_type_definition * res = 
    let t = c.find_interface_type_transformation d.name in
    let fields = match t with | Some {fields} -> fields | _ -> [] in
    let desced = 
      match t with
      | Some {description = Some desc} -> {d with description = Some (m_string_value desc)}
      | _ -> d
    in
    let n, r = s_name c (desced.name, r) in
    let fds, r = s_fields_definition c n fields (d.fields, r) in
    { 
      desced with
      name = n;
      fields = fds
    }, r


  let s_scalar_type_definition c ((p1, r): S.scalar_type_definition * res): (S.scalar_type_definition * res) = 
    let t = c.find_scalar_type_transformation p1.name in
    let desced = 
      match t with
      | Some {description = Some d} -> {p1 with description = Some (m_string_value d)}
      | _ -> p1
    in
    let (n, r2) = s_name c (p1.name, r) in
    {desced with name = n}, r2


  let s_union_type_definition c ((p1, r): S.union_type_definition * res) = 
    let p2 = c.find_union_type_transformation p1.name in
    let described = 
      match p2 with
      | Some {description = Some d} -> {p1 with description = Some (m_string_value d)}
      | _ -> p1
    in 
    let (n, r) = s_name c (p1.name, r) in
    let types, r = List.fold_right (listify (s_name c)) p1.types ([], r) in
    {described with name = n; types = types}, r


  let s_enum_value_definition _ (t: T.enum_value_transformation ) ((d, r): S.enum_value_definition * res): S.enum_value_definition * res  = 
    match t.description with
    | Some desc -> ({d with description = Some (m_string_value desc)}, r)
    | None -> (d, r)

  let s_enum_values_definition c (ds: S.enum_value_definition list) ((ts, r): T.enum_value_transformation list * res): S.enum_value_definition list * res = 
    let trans = List.map (fun (d: T.enum_value_transformation) -> (d.value, d)) ts in
    List.fold_right
      (fun (d: S.enum_value_definition) (ds, r)-> 
         match Utils.assoc_opt d.value trans with
         | Some t -> 
           let (d, r2) = s_enum_value_definition c t (d, r) in
           (d::ds, r2)
         | None -> (d::ds, r)
      )
      ds
      ([], r)

  let s_enum_type_definition c ((d, r): S.enum_type_definition * res): S.enum_type_definition * res =
    let t = c.find_enum_type_transformation d.name in
    let described = 
      match t with
      | Some {description = Some desc} -> {d with description = Some (m_string_value desc)}
      | _ -> d
    in 
    let values = match t with | Some {values} -> values | _ -> [] in
    let (n, r2) = s_name c (d.name, r) in
    let (vs, r3) = s_enum_values_definition c d.values (values, r2) in
    {
      described with
      name = n;
      values = vs
    }, r3

  let iotd_upd tn c r = {r with fixed_input_fields = (tn, c)::r.fixed_input_fields} 

  let s_input_object_type_definition c ((d, r): S.input_object_type_definition * res): S.input_object_type_definition * res= 
    let t = c.find_input_object_type_transformation d.name in
    let described = 
      match t with
      | Some {description = Some desc} -> {d with description = Some (m_string_value desc)}
      | _ -> d
    in 
    let fields = match t with | Some {fields} -> fields | _ -> [] in
    let n, r = s_name c (d.name, r) in
    let fs, r = 
      s_input_values_definition 
        c 
        (iotd_upd n) 
        (fun a r -> {r with input_fields = ((n, a.name), a)::r.input_fields})
        fields 
        (d.fields, r)
    in 
    {
      described with
      name = n;
      fields = fs
    }, r


  let s_type_definition (c: ctx) ((d, r): S.type_definition * res) = 
    match d with
    | S.ScalarTypeDefinition p1 -> 
      let (s, res) = s_scalar_type_definition c (p1, r) in    
      (S.ScalarTypeDefinition s, {res with types = (s.name, d)::res.types})
    | S.ObjectTypeDefinition p1 -> 
      let (s, res) = s_object_type_definition c (p1, r) in
      (S.ObjectTypeDefinition s, {res with types = (s.name, d)::res.types})
    | S.InterfaceTypeDefinition p1 -> 
      let (s, res) = s_interface_type_definition c (p1, r) in
      (S.InterfaceTypeDefinition s, {res with types = (s.name, d)::res.types})
    | S.UnionTypeDefinition p1 -> 
      let (s, res) = s_union_type_definition c (p1, r) in
      (S.UnionTypeDefinition s, {res with types = (s.name, d)::res.types})
    | S.EnumTypeDefinition p1 -> 
      let (s, res) = s_enum_type_definition c (p1, r) in
      (S.EnumTypeDefinition s, {res with types = (s.name, d)::res.types})
    | S.InputObjectTypeDefinition p1 -> 
      let (s, res) = s_input_object_type_definition c (p1, r) in
      (S.InputObjectTypeDefinition s, {res with types = (s.name, d)::res.types})

  let s_schema_document (c: ctx) ((d, r): S.schema_document * res): (S.schema_document * res) =

    let 
      (schema, r) = s_schema_definition c (d.schema, r)
    in
    let
      (types, r) =
      List.fold_right (listify (s_type_definition c)) d.types ([], r)
    in
    let
      (directives, r) =
      List.fold_right (listify (s_directive_definition c)) d.directives ([], r)
    in
    (
      {
        schema = schema;
        directives = directives;
        types = types
      },
      r
    )

  let find_generator (m: 'a -> 'b) (l: (string * 'a ) list) (n: string): 'b option =
    (match Utils.assoc_opt n l
     with
     | Some t -> Some (m t)
     | None -> None
    )
  let s (s: S.schema_document) (t: T.document): (S.schema_document * res) =
    let (schema, types) = 
      List.fold_right 
        (fun c (s, ts) -> 
           match c with
           | T.SchemaTransformation s -> (Some s, ts)
           | T.TypeTransformation t -> (s, ((tt_to_selector t).name, t)::ts)
        )
        t.transformations
        (None, [])
    in
    let err = Transformation_error "Transformation type mismatch" in
    let ctx = 
      {
        find_interface_type_transformation = 
          (find_generator 
             (fun v -> match v with
                | T.InterfaceTypeTransformation t -> t
                | _ -> raise err
             )
             types);
        find_object_type_transformation = 
          (find_generator 
             (fun v -> match v with
                | T.ObjectTypeTransformation t -> t
                | _ -> raise err
             )
             types);
        find_input_object_type_transformation = 
          (find_generator 
             (fun v -> match v with
                | T.InputObjectTypeTransformation t -> t
                | _ -> raise err
             )
             types);
        find_scalar_type_transformation = 
          (find_generator 
             (fun v -> match v with
                | T.ScalarTypeTransformation t -> t
                | _ -> raise err
             )
             types);
        find_union_type_transformation = 
          (find_generator 
             (fun v -> match v with
                | T.UnionTypeTransformation t -> t
                | _ -> raise err
             )
             types);
        find_enum_type_transformation = 
          (find_generator 
             (fun v -> match v with
                | T.EnumTypeTransformation t -> t
                | _ -> raise err
             )
             types);
        find_type_alias = (fun n -> 
            match 
              Utils.assoc_opt
                n 
                types
            with 
            | Some t -> (tt_to_selector t).alias
            | None -> None
          );
        find_type_transformation = (fun n -> 
            Utils.assoc_opt
              n
              types
          );
        schema_transformation  =  schema
      }
    in

    let 
      r = {
      types = [];
      fields = [];
      input_fields = [];
      directive_arguments = [];
      new_fields = [];
      arguments = [];
      fixed_arguments = [];
      fixed_input_fields = [];
    }
    in
    s_schema_document ctx (s,r)

end

module Correct : sig
  val c : S.schema_document -> S.schema_document
  exception Correction_error of string
end = 
struct

  exception Correction_error of string

  type ctx = {
    find_directive_arg: string -> string -> S.tpe;
    find_input_opt: string -> S.input_object_type_definition option
  }

  let c_argument (m: string -> 'a -> 'a) (a: 'a S.argument): 'a S.argument = 
    {
      a with 
      value = m a.name a.value
    }

  let c_directive (m: S.tpe -> 'a -> 'a) (c: ctx) (d: 'a S.directive): 'a S.directive = 
    let f = fun s1 s2 -> m (c.find_directive_arg s1 s2) in
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
        match c.find_input_opt n with
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
        (List.concat (s.directives::build_in_directives::[]))
        []
    in
    let 
      c = {
      find_input_opt = (fun n -> 
          Utils.assoc_opt n inputs
        );
      find_directive_arg = fun s1 s2 -> (
          try List.assoc (s1, s2) dirArgs
          with Not_found -> raise (Correction_error ("Failed to find argument \"" ^ s2 ^ "\" on directive \"@" ^ s1 ^ "\"."))
        )
    }
    in 
    c_document 
      c
      s


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
  exception TypeError of string
end = struct

  type type_error = string

  exception TypeError of type_error

  let (>+): type_error -> type_error -> type_error = (^)

  type ctx = {
    interfaces: (string * S.interface_type_definition) list;
    types: (string * S.type_definition) list;
    directives: (string * S.directive_definition) list;
    find_type: S.name -> S.type_definition;
    find_interface: S.name -> S.interface_type_definition;
    find_directive: S.name -> S.directive_definition
  }

  let find_interface (c: (string * S.interface_type_definition) list) (n: S.name): S.interface_type_definition =
    try 
      List.assoc n c
    with
      Not_found -> raise (TypeError ("Failed to find type with name: " ^ n))

  let find_directive (d: (string * S.directive_definition) list) (n: S.name): S.directive_definition =
    try 
      List.assoc n d
    with
      Not_found -> raise (TypeError ("Failed to find directive with name: " ^ n))


  let find_type (c: (string * S.type_definition) list) (n: S.name): S.type_definition =
    try 
      List.assoc n c
    with
      Not_found -> raise (TypeError ("Failed to find type with name: " ^ n))

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

  let rec is_output_type (c: ctx) (t: S.tpe): bool = 
    match t with
    | S.ListType t -> is_output_type c t
    | S.NonNullType (S.NamedType t) -> is_output_type c (S.NamedType t)
    | S.NonNullType (S.ListType t) -> is_output_type c t
    | S.NamedType n -> 
      (match c.find_type n with
       | S.ScalarTypeDefinition _ -> true
       | S.ObjectTypeDefinition _ -> true
       | S.InterfaceTypeDefinition _ -> true
       | S.UnionTypeDefinition _ -> true
       | S.EnumTypeDefinition _ -> true
       | _ -> false
      )


  let rec is_input_type (c: ctx) (t: S.tpe): bool =
    match t with
    | S.ListType t -> is_input_type c t
    | S.NonNullType (S.NamedType t) -> is_input_type c (S.NamedType t)
    | S.NonNullType (S.ListType t) -> is_input_type c t
    | S.NamedType n -> 
      (match c.find_type n with
       | S.ScalarTypeDefinition _ -> true
       | S.EnumTypeDefinition _ -> true
       | S.InputObjectTypeDefinition _ -> true
       | _ -> false
      )


  let forall (condition: 'a -> bool) (e: exn) (l: 'a list): unit =
    if List.for_all condition l
    then ()
    else raise e


  let tt_object_type_defnition_2_1 (_: ctx) (s: S.object_type_definition): unit = 
    let err = TypeError "The field must have a unique name within that Object type; no two fields may share the same name." in
    unique (fun (f1: S.field_definition) (f2: S.field_definition) -> f1.name = f2.name) err s.fields

  let tt_object_type_defnition_2_2 (_: ctx) (s: S.object_type_definition): unit = 
    let err = TypeError "The field must not have a name which begins with the characters \"__\" (two underscores)." in
    forall (fun (f: S.field_definition) -> not (starts_with f.name "__")) err s.fields 

  let tt_object_type_defnition_2_3 (c: ctx) (s: S.object_type_definition): unit =
    let err = TypeError "The field must return a type where IsOutputType(fieldType) returns true." in
    forall (fun (f: S.field_definition) -> is_output_type c f.tpe) err s.fields 

  let tt_object_type_defnition_2_4_1 (_: ctx) (s: S.field_definition): unit =
    let err = TypeError "The argument must not have a name which begins with the characters \"__\" (two underscores)." in
    forall (fun (f: S.input_value_definition) -> not (starts_with f.name "__")) err s.arguments

  let tt_object_type_defnition_2_4_2 (c: ctx) (s: S.field_definition): unit =
    let err = TypeError "The argument must accept a type where IsInputType(argumentType) returns true." in
    forall (fun (f: S.input_value_definition) -> is_input_type c f.tpe) err s.arguments


  let tt_object_type_defnition_2_4 (c: ctx) (s: S.object_type_definition): unit =
    let err = "For each argument of the field: " in
    try 
      List.fold_right
        (fun f _ -> 
           tt_object_type_defnition_2_4_1 c f;
           tt_object_type_defnition_2_4_2 c f;
        ) 
        s.fields
        ()
    with
      TypeError t -> raise (TypeError (err >+ t))

  let tt_object_type_defnition_2 (c: ctx) (s: S.object_type_definition): unit = 
    let err = "For each field of an Object type: " in
    try 
      tt_object_type_defnition_2_1 c s;
      tt_object_type_defnition_2_2 c s;
      tt_object_type_defnition_2_3 c s;
      tt_object_type_defnition_2_4 c s;
    with TypeError t -> (raise (TypeError (err >+ t)))

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

  let rec is_equal (c: ctx) (t1: S.tpe) (t2: S.tpe): bool = match t1, t2 with
    | (S.ListType t1, S.ListType t2) -> is_equal c t1 t2
    | (S.NonNullType (S. NamedType n1), S.NonNullType (S.NamedType n2)) -> is_equal c (S.NamedType n1) (S.NamedType n2)
    | (S.NamedType n1, S.NamedType n2) -> (c.find_type n1) == (c.find_type n2)
    | _ -> false

  let rec is_sub_type_or_equal (c: ctx) (sub: S.tpe) (sup: S.tpe): bool= (* TODO: check with subtypes of non-null *)
    match (sub, sup) with
    | (S.ListType t1, S.ListType t2) -> is_sub_type_or_equal c t1 t2 (* CASE: List content are subtypes  *)
    | (S.NonNullType (S.ListType t1), S.NonNullType (S.ListType t2)) -> is_sub_type_or_equal c t1 t2 (* CASE: Equal  *)
    | (S.NonNullType (S.NamedType t1), S.NonNullType (S.NamedType t2)) -> is_sub_type_or_equal c (S.NamedType t1) (S.NamedType t2) (* CASE: Equal  *)
    | (S.NonNullType (S.NamedType t1), (S.NamedType t2)) -> is_sub_type_or_equal c (S.NamedType t1) (S.NamedType t2) (* CASE: Left-side non-null erasure *)
    | (S.NamedType n1, S.NamedType n2) -> (
        let t1 = c.find_type n1 in
        let t2 = c.find_type n2 in
        if t1 == t2 (* CASE Equal types *)
        then true
        else (
          match t1, t2 with (* CASE: Possible types *)
          | S.ObjectTypeDefinition _, S.UnionTypeDefinition {types} -> List.exists (fun t2 -> t1 == t2) (List.map (fun n -> c.find_type n) types)
          | S.ObjectTypeDefinition {implements}, S.InterfaceTypeDefinition _ -> List.exists (fun t2 -> t1 == t2) (List.map (fun n -> c.find_type n) implements)
          | _ -> false
        )
      )
    | _ -> false

  let tt_object_type_defnition_4_1_1 (c: ctx) (i: S.field_definition) (f: S.field_definition): unit =
    let err = TypeError "The object field must be of a type which is equal to or a sub‐type of the interface field (covariant)." in
    if is_sub_type_or_equal c f.tpe i.tpe 
    then ()
    else raise err

  let tt_object_type_defnition_4_1_2_1 (c: ctx) (i: S.input_value_definition) (f: S.input_value_definition): unit = 
    if is_equal c i.tpe f.tpe
    then ()
    else raise (TypeError "The object field argument must accept the same type (invariant) as the interface field argument.")



  let tt_object_type_defnition_4_1_2 (c: ctx) (i: S.field_definition) (f: S.field_definition): unit =
    let err = TypeError "The object field must include an argument of the same name for every argument defined in the interface field." in 
    let argAssoc = List.map (fun (a: S.input_value_definition) -> (a.name, a)) f.arguments in
    List.fold_right
      (fun (ia: S.input_value_definition) _ -> 
         match Utils.assoc_opt ia.name argAssoc with
         | Some a -> tt_object_type_defnition_4_1_2_1 c ia a
         | None -> raise err
      )
      i.arguments
      ()

  let tt_object_type_defnition_4_1_3 (_: ctx) (i: S.field_definition) (f: S.field_definition): unit =
    let err = TypeError "The object field may include additional arguments not defined in the interface field, but any additional argument must not be required, e.g. must not be of a non‐nullable type." in 
    let interfaceArgsAssoc = List.map (fun (a: S.input_value_definition) -> (a.name, a)) i.arguments in
    List.fold_right (fun (a: S.input_value_definition) _ -> (
          match a.tpe, Utils.assoc_opt a.name interfaceArgsAssoc with
          | (S.NonNullType _, None) -> raise err
          | _ -> ()
        ))
      f.arguments
      ()

  let tt_object_type_defnition_4_1 (c: ctx) (s: S.object_type_definition): unit =
    let err = "The object type must include a field of the same name for every field defined in an interface. " in
    let fieldAssoc = List.map (fun (f: S.field_definition) -> (f.name, f)) s.fields in
    try 
      List.fold_right
        (fun (iff: S.field_definition) _ -> 
           let 
             f = match Utils.assoc_opt iff.name fieldAssoc with
             | Some f -> f
             | None -> raise (TypeError err)
           in
           (
             tt_object_type_defnition_4_1_1 c iff f;
             tt_object_type_defnition_4_1_2 c iff f;
             tt_object_type_defnition_4_1_3 c iff f;
           ))
        (List.flatten (List.map (fun (i: S.interface_type_definition) -> i.fields) (List.map (fun n -> c.find_interface n) s.implements)))
        ()
    with
      TypeError t -> raise (TypeError (err >+ t))


  let tt_object_type_defnition_4 (c: ctx) (s: S.object_type_definition): unit = 
    let err = "An object type must be a super‐set of all interfaces it implements: " in
    try 
      tt_object_type_defnition_4_1 c s
    with
      TypeError t -> raise (TypeError (err >+ t))


  let tt_object_type_definition c (s: S.object_type_definition) : unit =
    tt_object_type_defnition_1 c s;
    tt_object_type_defnition_2 c s;
    tt_object_type_definition_3 c s;
    tt_object_type_defnition_4 c s;
    ()

  let tt_interface_type_definition_1 _ (s: S.interface_type_definition): unit =
    match s.fields with
    | [] -> raise (TypeError "An Interface type must define one or more fields.")
    | _ -> ()

  let tt_interface_type_definition_2_1 _ (s: S.interface_type_definition): unit =
    let err = TypeError "The field must have a unique name within that Interface type; no two fields may share the same name." in
    unique (fun (f1: S.field_definition) f2 -> f1.name = f2.name) err s.fields

  let tt_interface_type_definition_2_2 _ (s: S.interface_type_definition): unit =
    let err = TypeError "The field must not have a name which begins with the characters \"__\" (two underscores)."  in
    forall (fun (f: S.field_definition) -> not (starts_with f.name "__")) err s.fields 

  let tt_interface_type_definition_2_3 c (s: S.interface_type_definition): unit = 
    let err = TypeError "The field must return a type where IsOutputType(fieldType) returns true."  in
    forall (fun (f: S.field_definition) -> is_output_type c f.tpe) err s.fields 

  let tt_interface_type_definition_2_4_1 _ (f: S.field_definition): unit = 
    let err = TypeError "The argument must not have a name which begins with the characters \"__\" (two underscores)."  in
    forall (fun (f: S.input_value_definition) -> not (starts_with f.name "__")) err f.arguments

  let tt_interface_type_definition_2_4_2 c (f: S.field_definition): unit =
    let err = TypeError "The argument must accept a type where IsInputType(argumentType) returns true."  in
    forall (fun (f: S.input_value_definition) -> is_input_type c f.tpe) err f.arguments

  let tt_interface_type_definition_2_4 c (s: S.interface_type_definition): unit =
    let err = "For each argument of the field:" in
    try 
      List.fold_right
        (fun field _ -> 
           tt_interface_type_definition_2_4_1 c field;
           tt_interface_type_definition_2_4_2 c field
        )
        s.fields
        ()
    with TypeError t -> raise (TypeError (err >+ t))

  let tt_interface_type_definition_2 c (s: S.interface_type_definition): unit =
    let err = "For each field of an Interface type:" in
    try 
      tt_interface_type_definition_2_1 c s;
      tt_interface_type_definition_2_2 c s;
      tt_interface_type_definition_2_3 c s;
      tt_interface_type_definition_2_4 c s;
    with TypeError t -> raise (TypeError (err >+ t))

  let tt_interface_type_definition c (s: S.interface_type_definition): unit =
    tt_interface_type_definition_1 c s;
    tt_interface_type_definition_2 c s

  let tt_union_type_definition_1 _ (s: S.union_type_definition): unit = 
    let err = TypeError "A Union type must include one or more unique member types." in
    match s.types with
    | [] -> raise err
    | ss -> unique (=) err ss

  let tt_union_type_definition_2 c (s: S.union_type_definition): unit = 
    let err = TypeError "The member types of a Union type must all be Object base types; Scalar, Interface and Union types must not be member types of a Union. Similarly, wrapping types must not be member types of a Union." in
    List.fold_right
      (fun t _ -> (
           match c.find_type t with
           | ObjectTypeDefinition _ -> ()
           | _ -> raise err
         ))
      s.types
      ()

  let tt_union_type_definition c (s: S.union_type_definition): unit = 
    tt_union_type_definition_1 c s;
    tt_union_type_definition_2 c s

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

  let tt_input_object_definition_2_1 _ (s: S.input_object_type_definition)= 
    let err = TypeError "The input field must have a unique name within that Input Object type; no two input fields may share the same name." in
    unique (fun (n1: S.input_value_definition) n2 -> n1.name = n2.name) err s.fields

  let tt_input_object_definition_2_2  _ (s: S.input_object_type_definition) = 
    let err = TypeError "The input field must not have a name which begins with the characters \"__\" (two underscores)." in
    forall (fun (f: S.input_value_definition) -> not (starts_with f.name "__")) err s.fields 

  let tt_input_object_definition_2_3 c (s: S.input_object_type_definition) = 
    let err = TypeError "The input field must accept a type where IsInputType(inputFieldType) returns true." in
    forall (fun (f: S.input_value_definition) -> is_input_type c f.tpe) err s.fields 

  let tt_input_object_definition_2 c (s: S.input_object_type_definition): unit =
    let err = "For each input field of an Input Object type:" in
    try
      tt_input_object_definition_2_1 c  s;
      tt_input_object_definition_2_2 c s;
      tt_input_object_definition_2_3 c s
    with
      TypeError t -> raise (TypeError (err >+ t))

  let tt_input_object_type_definition c (s: S.input_object_type_definition): unit =
    tt_input_object_definition_1 c s;
    tt_input_object_definition_2 c s

  let tt_scalar_type_definition _ _ = ()


  let tt_directive_definition_1 (c: ctx) (d: S.directive_definition) : unit = 
    let dirs = 
      List.map 
        (fun (d: 'a S.directive) -> c.find_directive d.name)
        (List.flatten ((List.map (fun (d: S.input_value_definition) -> d.directives)) d.arguments)) 
    in
    let err =
      TypeError "A directive definition must not contain the use of a directive which references itself directly."
    in 
    if List.exists (fun a -> a == d) dirs 
    then raise err
    else ()

  type hist = (S.directive_definition list * S.type_definition list)

  let foreach (f: 'a -> unit) (l: 'a list): unit =
    List.fold_right (fun a _ -> f a) l () 

  let rec c_directive (c: ctx) (err: exn) ((h1,h2): hist) (d: 'a S.directive) : unit  = 
    let dir = c.find_directive d.name in
    let exists = List.exists (fun d2 -> d2 == dir) h1 in
    if exists then raise err else c_directive_definition c err (h1,h2) dir


  and c_type_definition (c: ctx) (err: exn) ((h1, h2): hist) (t: S.type_definition) : unit = 
    let history = (h1, t::h2) in
    match t with
    | S.ObjectTypeDefinition {directives; fields; implements} -> 
      foreach (c_directive c err history) directives;
      foreach (c_field_definition c err history) fields;
      foreach (c_type_definition c err history) (List.map c.find_type implements)
    | S.InterfaceTypeDefinition {directives; fields}->  
      foreach (c_directive c err history) directives;
      foreach (c_field_definition c err history) fields
    | S.UnionTypeDefinition {directives; types} ->
      foreach (c_directive c err history) directives;
      foreach (c_type_definition c err history) (List.map c.find_type types)
    | S.EnumTypeDefinition {directives; values} ->
      foreach (c_directive c err history) directives;
      foreach (c_enum_value_definition c err history) values
    | S.ScalarTypeDefinition {directives} ->
      foreach (c_directive c err history) directives
    | S.InputObjectTypeDefinition {directives; fields} ->
      foreach (c_directive c err history) directives;
      foreach (c_input_value_definition c err history) fields

  and c_enum_value_definition (c: ctx) (err: exn) (h: hist) (t: S.enum_value_definition) : unit = 
    foreach (c_directive c err h) t.directives 

  and c_input_value_definition (c: ctx) (err: exn) (h: hist) (t: S.input_value_definition) : unit = 
    foreach (c_directive c err h) t.directives;
    c_tpe c err h t.tpe

  and c_field_definition (c: ctx) (err: exn) (h: hist) (d: S.field_definition): unit = 
    foreach (c_directive c err h) d.directives;
    foreach (c_input_value_definition c err h) d.arguments;
    c_tpe c err h d.tpe

  and c_name (c: ctx) (err: exn) ((h1, h2): hist) (n: S.name) : unit =
    let t = c.find_type n in
    let exists = List.exists (fun t2 -> t == t2) h2 in
    if exists then () else c_type_definition c err (h1, h2) t

  and c_tpe (c: ctx) (err: exn) (history: hist) (t: S.tpe) : unit =
    match t with
    | S.NonNullType (S.ListType t) -> c_tpe c err history t
    | S.NonNullType (S.NamedType t) -> c_tpe c err  history (S.NamedType t)
    | S.ListType t -> c_tpe c err history t
    | S.NamedType t -> c_name c err history t


  and c_directive_definition (c: ctx) (err: exn) (h1, h2: hist) (d: S.directive_definition) : unit =  
    foreach (c_input_value_definition c err (d::h1, h2)) d.arguments


  let tt_directive_definition_2 (c: ctx) (d: S.directive_definition) : unit = 
    let err = TypeError "A directive definition must not contain the use of a directive which references itself indirectly by referencing a Type or Directive which transitively includes a reference to this directive." in
    let _ = c_directive_definition c err ([], []) d in
    ()

  let tt_directive_definition_3 (_: ctx) (d: S.directive_definition) : unit = 
    let err = TypeError "The directive must not have a name which begins with the characters \"__\" (two underscores)." in
    if starts_with d.name "__" then raise err else ()

  let tt_directive_definition_4_1 (_: ctx) (s: S.directive_definition): unit =
    let err = TypeError "The argument must not have a name which begins with the characters \"__\" (two underscores)." in
    forall (fun (f: S.input_value_definition) -> not (starts_with f.name "__")) err s.arguments

  let tt_directive_definition_4_2 (c: ctx) (s: S.directive_definition): unit =
    let err = TypeError "The argument must accept a type where IsInputType(argumentType) returns true." in
    forall (fun (f: S.input_value_definition) -> is_input_type c f.tpe) err s.arguments

  let tt_directive_definition_4 (c: ctx) (d: S.directive_definition) : unit = 
    try 
      tt_directive_definition_4_1 c d;
      tt_directive_definition_4_2 c d
    with TypeError t -> raise (TypeError ("For each argument of the directive:" >+ t))

  let tt_directive_definition (c: ctx) (d: S.directive_definition) : unit = 
    tt_directive_definition_1 c d;
    tt_directive_definition_2 c d;
    tt_directive_definition_3 c d;
    tt_directive_definition_4 c d

  let tt_type_definition ctx d: unit =
    let err = TypeError "The type must not have a name which begins with the characters \"__\" (two underscores)." in
    let c n = if starts_with n "__" then raise err else () in
    match d with
    | S.InterfaceTypeDefinition t -> c t.name; tt_interface_type_definition ctx t
    | S.UnionTypeDefinition t -> c t.name; tt_union_type_definition ctx t
    | S.EnumTypeDefinition t -> c t.name; tt_enum_type_definition ctx t
    | S.InputObjectTypeDefinition t -> c t.name; tt_input_object_type_definition ctx t
    | S.ScalarTypeDefinition t -> c t.name; tt_scalar_type_definition ctx t
    | S.ObjectTypeDefinition t -> c t.name; tt_object_type_definition ctx t


  let tt_schema (c: ctx) (s: S.schema_definition) = 
    List.fold_right
      (fun (op: S.operation_type_definition) _ -> 
         match (c.find_type op.tpe) with
         | S.ObjectTypeDefinition _ -> ()
         | _ -> raise (TypeError ("Operations must be an object type"))
      )
      s.operations
      ();
    match Utils.find_opt (fun (op: S.operation_type_definition) -> op.operation == S.Query ) s.operations
    with
    | None -> raise (TypeError ("A query operation must be defined."))
    | _ -> ()


  let c (doc: S.schema_document): S.schema_document = 
    let
      interfaces = List.fold_right (fun l acc -> 
        match l with 
        | S.InterfaceTypeDefinition d -> (d.name, d)::acc
        | _ -> acc
      ) doc.types []
    in
    let
      types = List.map (fun t -> match t with
        | S.InterfaceTypeDefinition d -> (d.name, t)
        | S.ScalarTypeDefinition d -> (d.name, t)
        | S.ObjectTypeDefinition d -> (d.name, t)
        | S.EnumTypeDefinition  d -> (d.name, t)
        | S.UnionTypeDefinition  d -> (d.name, t)
        | S.InputObjectTypeDefinition  d -> (d.name, t)
      ) (List.append doc.types build_in_scalars)
    in
    let 
      directives = List.map (fun (d: S.directive_definition) -> (d.name, d)) doc.directives
    in
    let ctx = {
      interfaces = interfaces; 
      types = types;
      directives = directives;
      find_type = find_type types;
      find_interface = find_interface interfaces;
      find_directive = find_directive directives;
    } 
    in
    List.fold_right 
      (fun t _ -> tt_type_definition ctx t) 
      doc.types
      ();
    tt_schema ctx doc.schema;
    List.fold_right (
      fun t _ ->
        tt_directive_definition ctx t
    )
      doc.directives
      ();
    doc
end



let (>-): S.schema_document -> (S.schema_document -> S.schema_document) -> S.schema_document = fun s -> fun m -> m s

type transformation = {
  t: T.document;
  os: S.schema_document;
  tr: Schema.res;
  ts: S.schema_document;
}

type t = transformation

let schema (t: transformation) : S.schema_document =  t.ts

let original_schema (t: transformation): S.schema_document = t.os

let transform s t: transformation = (
  try 
    let 
      (schema, r) = Schema.s s t 
    in
    let ts =  schema >- Correct.c >- ShakeIt.c >- TypeCheck.c in
    {
      t = t;
      os = s;
      tr = r;
      ts = ts 
    }
  with
  | Schema.Transformation_error e -> raise (Transform_error ("Transformation error: " ^ e))
  | Correct.Correction_error e -> raise (Transform_error ("Correction error: " ^ e))
  | TypeCheck.TypeError e -> raise (Transform_error ("Type error: " ^ e))
)


module Exec: sig
  val c: transformation -> S.executable_document -> S.executable_document
  exception Transformation_error of string
end = struct
  exception Transformation_error of string

  type ctx = { 
    find_new_operation: S.operation_type -> S.operation_type_definition;
    find_type: S.name -> S.type_definition;
    find_field: S.name -> S.name -> S.field_definition;
    find_directive_argument: S.name -> S.name -> S.input_value_definition;
    find_input_field: S.name -> S.name -> S.input_value_definition;
    find_field_argument: S.name -> S.name -> S.name -> S.input_value_definition;
    find_new_field: S.name -> S.name -> S.field_definition;
    find_fixed_arguments: S.name -> S.name -> S.vc S.argument list;
    find_fixed_field: S.name -> S.vc S.argument list;
  }

  let rec t_value (c: ctx) (t: S.tpe) (v: S.v): S.v = 
    match t, v with
    | (S.ListType t, S.ListValue vs) -> S.ListValue (List.map (t_value c t) vs)
    | (S.ListType t, v) -> t_value c t v
    | (S.NonNullType (S.NamedType n), v) -> t_value c (S.NamedType n) v
    | (S.NonNullType (S.ListType t), v) -> t_value c (S.ListType t) v
    | (S.NamedType n, S.ObjectValue fs) -> 
      ( match c.find_type n with
        | S.InputObjectTypeDefinition o -> S.ObjectValue (t_object_fields c o fs)
        | _ -> v
      )
    | _ -> v

  and t_object_fields (c: ctx) (o: S.input_object_type_definition) (fs: S.v S.object_field list): S.v S.object_field list = 
    List.concat (
      (List.map (t_object_field c (fun n -> c.find_input_field o.name n)) fs)
      ::(List.map (fun (a: S.vc S.argument) -> S.a_to_of (S.map_a a S.vc_to_v)) (c.find_fixed_field o.name))
      ::[]
    )

  and t_object_field (c: ctx) (l: S.name -> S.input_value_definition) (f: S.v S.object_field): S.v S.object_field = 
    let d = l f.name in
    let v = t_value c d.tpe f.value in
    {f with value = v}


  let t_argument (c: ctx) (l : S.name -> S.input_value_definition) (a: S.v S.argument) : S.v S.argument = 
    let d = l a.name in
    {
      a with
      value = t_value c d.tpe a.value
    }

  let t_directive (c: ctx) (d: S.v S.directive): S.v S.directive = 
    {d with arguments = List.map (t_argument c (c.find_directive_argument d.name)) d.arguments}

  let t_fragment_spread (c: ctx) (f: S.fragment_spread) : S.fragment_spread = 
    {f with directives = List.map (t_directive c) f.directives}

  let rec tpe_to_name (t: S.tpe) =
    match t with
    | S.NamedType n -> n
    | S.ListType t -> tpe_to_name t
    | S.NonNullType (S.NamedType n) -> n
    | S.NonNullType (S.ListType t) -> tpe_to_name (S.ListType t)

  let rec t_field (c: ctx) (t: S.name) (f: S.field): S.field =
    let fd = c.find_field t f.name in
    let nfd = c.find_new_field t f.name in
    let (name, alias) = f.name, f.alias in
    let (name, alias) = (fd.name, match alias with | Some a -> a | None -> name) in
    let alias = if name = alias then None else Some alias in
    let orig_args = List.map (t_argument c (c.find_field_argument t f.name)) f.arguments in
    let args = c.find_fixed_arguments t f.name in
    let args: S.v S.argument list = List.map (fun (a: S.vc S.argument) -> {a with value = S.vc_to_v a.value}) args in
    let directives = List.map (t_directive c) f.directives in
    {
      name = fd.name;
      alias = alias; 
      arguments = List.concat (orig_args::args::[]);
      directives = directives;
      selectionSet = t_selection_set c (tpe_to_name nfd.tpe) f.selectionSet;
    }

  and t_field_internal (c: ctx) (t: S.name) (f: S.field): S.field = if starts_with f.name "__" then f else t_field c t f

  and t_inline_fragment (c: ctx) (t: S.name) (f: S.inline_fragment) : S.inline_fragment = 
    let condition = Utils.opt_map (fun n -> td_to_name (c.find_type n)) f.condition in
    let selections = t_selection_set c (match f.condition with | Some c -> c | None -> t) f.selectionSet in
    {
      condition = condition;
      selectionSet = selections;
      directives = List.map (t_directive c) f.directives
    }
  and t_inline_fragment_internal (c: ctx) (t: S.name) (f: S.inline_fragment) : S.inline_fragment = 
    match f.condition with
    | Some tc -> if starts_with tc "__" then f else t_inline_fragment c t f
    | _ -> t_inline_fragment_internal c t f

  and t_selection (c: ctx) (t: S.name) (s: S.selection): S.selection =
    match s with
    | S.Field f -> S.Field (t_field_internal c t f)
    | S.InlineFragment f -> (S.InlineFragment (t_inline_fragment_internal c t f))
    | S.FragmentSpread f -> (S.FragmentSpread (t_fragment_spread c f))

  and t_selection_set (c: ctx) (t: S.name) (o: S.selection list): S.selection list =
    List.map (t_selection c t ) o

  let t_operation (c: ctx) (o: S.operation_definition): S.operation_definition = 
    let t = (c.find_new_operation o.tpe).tpe in
    {
      o with 
      selectionSet = t_selection_set c t o.selectionSet;
      directives = List.map (t_directive c) o.directives
    }


  let t_fragment (c: ctx) (f: S.fragment_definition): S.fragment_definition =
    { f with
      directives = List.map (t_directive c) f.directives;
      condition = td_to_name (c.find_type f.condition)
    }

  let t_fragment_internal (c: ctx) (f: S.fragment_definition): S.fragment_definition =
    if starts_with f.condition "__" then
      f
    else 
      t_fragment c f

  let t_fragments (c: ctx) (fs: S.fragment_definition list): S.fragment_definition list = 
    List.map (t_fragment_internal c) fs

  let c (t: transformation) (e: S.executable_document): S.executable_document  = 
    let c = {
      find_type = 
        (fun n -> 
           try List.assoc n t.tr.types
           with Not_found -> raise (Transformation_error ("Failed to fetch type: " ^ n) )
        );
      find_new_operation =
        (fun o -> (
             match 
               Utils.find_opt
                 (fun ({operation}: S.operation_type_definition) -> operation = o)
                 t.ts.schema.operations
             with
             | Some t -> t
             | None -> raise (Transformation_error ("Failed to find operation " ^ (match o with | S.Mutation -> "mutation" | S.Query -> "query" | S.Subscription -> "subscription")))
           ));
      find_field = (
        (fun o f ->
           try List.assoc (o, f) t.tr.fields
           with Not_found -> raise (Transformation_error ("Failed to find field: " ^ (o) ^ "." ^ f) )
        )
      );
      find_new_field = (
        (fun o f -> 
           try List.assoc (o, f) t.tr.new_fields
           with Not_found -> raise (Transformation_error ("Failed to find field type: " ^ (o) ^ "." ^ f) )
        )
      );
      find_input_field = (
        (fun o f -> 
           try List.assoc (o, f) t.tr.input_fields 
           with Not_found -> raise (Transformation_error ("Failed to find input field: " ^ (o) ^ "." ^ f) )
        )
      );
      find_field_argument = (
        (fun o f a -> 
           try List.assoc (o, f, a) t.tr.arguments
           with Not_found -> raise (Transformation_error ("Failed to find argument: " ^ (o) ^ "." ^ f ^ "." ^ a) )
        )
      );
      find_directive_argument = (
        (fun d f -> 
           try List.assoc (d, f) t.tr.directive_arguments
           with Not_found -> raise (Transformation_error ("Failed to find directive argument: " ^ (d) ^ "." ^ f ) )
        )
      );
      find_fixed_arguments = (
        (fun o f -> 
           let
             filtered = 
             List.filter 
               (fun ((o1, f1), _) -> o1 = o && f1 = f) 
               t.tr.fixed_arguments 
           in
           List.map (fun (_, v)  ->v) filtered
        )
      );
      find_fixed_field = (
        (fun o -> 
           let
             filtered = 
             List.filter 
               (fun (o1, _) -> o1 = o) 
               t.tr.fixed_input_fields 
           in
           List.map (fun (_, v)  ->v) filtered
        )
      )
    } 
    in
    {
      operation = 
        t_operation
          c
          e.operation; 
      fragments = 
        t_fragments 
          c
          e.fragments
    }

end

let executable t a = 
  try Exec.c t a with
  | Exec.Transformation_error e -> raise (Query_transform_error e)

