
(* The type of tokens. *)

type token = 
  | UNION
  | TRANSFORM
  | TYPE
  | TSDIR_UNION
  | TSDIR_SCHEMA
  | TSDIR_SCALAR
  | TSDIR_OBJECT
  | TSDIR_INTERFACE
  | TSDIR_INPUT_OBJECT
  | TSDIR_INPUT_FIELD_DEFINITION
  | TSDIR_FIELD_DEFINITION
  | TSDIR_ENUM_VALUE
  | TSDIR_ENUM
  | TSDIR_ARGUMENT_DEFINITION
  | TRUE
  | STRING of (string)
  | SPREAD
  | SCHEMA
  | SCALAR
  | R_SQ_BRACKET
  | R_PAREN
  | R_BRACKET
  | PIPE
  | OP_SUBSCRIPTION
  | OP_QUERY
  | OP_MUTATION
  | ON
  | NULL
  | NAME of (string)
  | L_SQ_BRACKET
  | L_PAREN
  | L_BRACKET
  | INTERFACE
  | INT of (string)
  | INPUT
  | IMPLEMENTS
  | FRAGMENT
  | FLOAT of (string)
  | FALSE
  | EXTEND
  | EXCLAMATION
  | EQUAL
  | EOF
  | ENUM
  | EDIR_SUBSCRIPTION
  | EDIR_QUERY
  | EDIR_MUTATION
  | EDIR_INLINE_FRAGMENT
  | EDIR_FRAGMENT_SPREAD
  | EDIR_FRAGMENT_DEFINITION
  | EDIR_FIELD
  | DOLLAR
  | DIRECTIVE
  | COLON
  | BLOCK_STRING of (string)
  | AT
  | AMPERSAND

(* This exception is raised by the monolithic API functions. *)

exception Error

exception Expected of string

(* The monolithic API. *)


module G = Gql_ast

type lexer = Lexing.lexbuf -> token

type 'a lexf = token -> lexer -> Lexing.lexbuf -> (token * 'a)

let c_lexf: 'a -> 'a lexf = fun v tok _ _ -> (tok, v)

let e1_lexf: 'a -> 'a lexf = fun v _ lexer buf -> (lexer buf, v)

type lexft = token -> lexer -> Lexing.lexbuf -> (token)

let e1_lexft: lexft = fun _ l b -> l b


let to_name: token -> G.name option = 
  fun t -> 
    match t with
    | NAME n ->  Some(        n )
    | ON -> Some ("on")
    | EXTEND -> Some("extend" )
    | FRAGMENT -> Some("fragment" )
    | TRUE -> Some("true" )
    | FALSE -> Some("false" )
    | NULL -> Some("null" )
    | SCHEMA -> Some("schema" )
    | TYPE -> Some("type" )
    | ENUM -> Some("enum" )
    | INTERFACE -> Some("interface" )
    | IMPLEMENTS -> Some("implements" )
    | DIRECTIVE -> Some("directive" )
    | SCALAR -> Some("scalar" )
    | TRANSFORM -> Some ("transform")
    | INPUT -> Some("input" )
    | UNION -> Some("union" )
    | OP_MUTATION -> Some("mutation" )
    | OP_QUERY -> Some("query" )
    | OP_SUBSCRIPTION -> Some("subscription" )
    | EDIR_QUERY -> Some("QUERY" )
    | EDIR_MUTATION -> Some("MUTATION" )
    | EDIR_SUBSCRIPTION -> Some("SUBSCRIPTION" )
    | EDIR_FIELD -> Some("FIELD" )
    | EDIR_FRAGMENT_DEFINITION -> Some("FRAGMENT_DEFINITION" )
    | EDIR_FRAGMENT_SPREAD -> Some("FRAGMENT_SPREAD" )
    | EDIR_INLINE_FRAGMENT -> Some("INLINE_FRAGMENT" )
    | TSDIR_SCHEMA -> Some("SCHEMA" )
    | TSDIR_SCALAR -> Some("SCALAR" )
    | TSDIR_OBJECT -> Some("OBJECT" )
    | TSDIR_FIELD_DEFINITION -> Some("FIELD_DEFINITION" )
    | TSDIR_ARGUMENT_DEFINITION -> Some("ARGUMENT_DEFINITION" )
    | TSDIR_INTERFACE -> Some("INTERFACE" )
    | TSDIR_UNION -> Some("UNION" )
    | TSDIR_ENUM -> Some("ENUM" )
    | TSDIR_ENUM_VALUE -> Some("ENUM_VALUE" )
    | TSDIR_INPUT_OBJECT -> Some("INPUT_OBJECT" )
    | TSDIR_INPUT_FIELD_DEFINITION -> Some("INPUT_FIELD_DEFINITION" )
    | _ -> None

let to_enum_value: token -> G.enum_value option =
  fun t ->
    match t with
    | NULL
    | FALSE
    | TRUE -> None
    | t -> to_name t

let to_fragment_name: token -> G.fragment_name option =
  fun t ->
    match t with
    | ON -> None
    | t -> to_name t


let colon: lexft = 
  fun t lexer buf ->
    match t with
    | COLON -> lexer buf
    | _ -> raise (Expected ":")

let l_paren: lexft = 
  fun t lexer buf ->
    match t with
    | L_PAREN -> lexer buf
    | _ -> raise (Expected "(")

let r_paren: lexft = 
  fun t lexer buf ->
    match t with
    | R_PAREN -> lexer buf
    | _ -> raise (Expected ")")

let r_bracket: lexft = 
  fun t lexer buf ->
    match t with
    | R_BRACKET -> lexer buf
    | _ -> raise (Expected "}")

let l_bracket: lexft = 
  fun t lexer buf ->
    match t with
    | L_BRACKET -> lexer buf
    | _ -> raise (Expected "{")

let dollar: lexft = 
  fun t lexer buf ->
    match t with
    | DOLLAR -> lexer buf
    | _ -> raise (Expected "$")

let exclamation: lexft = 
  fun t lexer buf ->
    match t with
    | EXCLAMATION -> lexer buf
    | _ -> raise (Expected "!")

let r_sq_bracket: lexft = 
  fun t lexer buf ->
    match t with
    | R_SQ_BRACKET -> lexer buf
    | _ -> raise (Expected "]")

let l_sq_bracket: lexft = 
  fun t lexer buf ->
    match t with
    | L_SQ_BRACKET -> lexer buf
    | _ -> raise (Expected "[")

let spread: lexft = 
  fun t lexer buf ->
    match t with
    | SPREAD -> lexer buf
    | _ -> raise (Expected "...")

let on: lexft = 
  fun t lexer buf ->
    match t with
    | ON -> lexer buf
    | _ -> raise (Expected "on")

let fragment: lexft = 
  fun t lexer buf ->
    match t with
    | FRAGMENT -> lexer buf
    | _ -> raise (Expected "fragment")

let extend: lexft = 
  fun t lexer buf ->
    match t with
    | EXTEND -> lexer buf
    | _ -> raise (Expected "extend")

let schema: lexft = 
  fun t lexer buf ->
    match t with
    | SCHEMA -> lexer buf
    | _ -> raise (Expected "schema")

let t_directive: lexft = 
  fun t lexer buf ->
    match t with
    | DIRECTIVE -> lexer buf
    | _ -> raise (Expected "directive")

let t_type: lexft = 
  fun t lexer buf ->
    match t with
    | TYPE -> lexer buf
    | _ -> raise (Expected "type")

let t_interface: lexft = 
  fun t lexer buf ->
    match t with
    | INTERFACE -> lexer buf
    | _ -> raise (Expected "interface")

let t_enum: lexft = 
  fun t lexer buf ->
    match t with
    | ENUM -> lexer buf
    | _ -> raise (Expected "enum")

let t_union: lexft = 
  fun t lexer buf ->
    match t with
    | UNION -> lexer buf
    | _ -> raise (Expected "union")

let t_input: lexft = 
  fun t lexer buf ->
    match t with
    | INPUT -> lexer buf
    | _ -> raise (Expected "input")

let t_scalar: lexft = 
  fun t lexer buf ->
    match t with
    | SCALAR -> lexer buf
    | _ -> raise (Expected "scalar")

let at: lexft = 
  fun t lexer buf ->
    match t with
    | AT -> lexer buf
    | _ -> raise (Expected "@")

let equal: lexft = 
  fun t lexer buf ->
    match t with
    | EQUAL -> lexer buf
    | _ -> raise (Expected "=")

let pipe: lexft = 
  fun t lexer buf ->
    match t with
    | PIPE -> lexer buf
    | _ -> raise (Expected "pipe")

let implements: lexft = 
  fun t lexer buf ->
    match t with
    | IMPLEMENTS -> lexer buf
    | _ -> raise (Expected "implements")

let transform: lexft = 
  fun t lexer buf ->
    match t with
    | TRANSFORM -> lexer buf
    | _ -> raise (Expected "transform")

let ampersand: lexft = 
  fun t lexer buf ->
    match t with
    | AMPERSAND -> lexer buf
    | _ -> raise (Expected "&")

let name_opt: token -> lexer -> Lexing.lexbuf -> (token * G.name option) = 
  fun tok lexer buf ->
    match to_name tok with
    | None -> (tok, None)
    | Some n -> 
      let tok = lexer buf in
      (tok, Some n)

let name: G.name lexf = 
  fun tok lexer buf -> 
    let tok, n = name_opt tok lexer buf in
    match n with
    | Some n -> tok, n
    | _ -> raise (Expected "name")

let fragment_name : G.fragment_name lexf = 
  fun t -> 
    match to_fragment_name t with
    | Some v -> e1_lexf v t
    | _ -> raise (Expected "fragment-name")

let enum_value : G.enum_value lexf = 
  fun t -> 
    match to_enum_value t with
    | Some v -> e1_lexf v t
    | _ -> raise (Expected "enum-value")

let named_tpe: G.named_type lexf = name

let type_condition_opt: G.type_condition option lexf = 
  fun tok lexer buf -> match tok with 
    | ON -> (
        let tok = on tok lexer buf in
        let (tok, nt) = named_tpe tok lexer buf in
        (tok, Some nt)
      )
    | _ -> tok, None

let type_condition: G.type_condition lexf =
  fun t l b ->
    let (tok, cond) = type_condition_opt t l b in
    match cond with
    | None -> raise (Expected "type-condition")
    | Some t -> tok, t


let string_v_opt:  G.string_value option lexf = 
  fun tok lexer buffer ->
    match tok with 
    | STRING s -> 
      let tok = e1_lexft tok lexer buffer in
      tok, Some (G.StringValue s)
    | BLOCK_STRING s ->
      let tok = e1_lexft tok lexer buffer in
      tok, Some (G.BlockStringValue s)
    | _ -> tok, None

let variable: G.variable lexf = 
  fun tok lexer buf ->
    let tok = dollar tok lexer buf in
    name tok lexer buf

let object_field: ('a lexf) -> ('a G.object_field lexf) = 
  fun v tok lexer buf ->
    let tok, n = name tok lexer buf  in
    let tok = colon tok lexer buf in
    let tok, va = v tok lexer buf in
    tok, {name = n; value = va}


let rec object_value_inner: ('a lexf) -> 'a G.object_field list lexf =
  fun v tok lexer buf -> 
    match tok with
    | R_BRACKET -> tok, []
    | _ -> (
        let tok, va = object_field v tok lexer buf in
        let tok, vas = object_value_inner v tok lexer buf in
        tok, va::vas
      )

let object_value: ('a lexf) -> 'a G.object_field list lexf = 
  fun v tok lexer buf ->
    let tok = l_bracket tok lexer buf in
    let tok, vs = object_value_inner v tok lexer buf in
    let tok = r_bracket tok lexer buf in
    tok, vs

let rec list_value_inner: ('a lexf) -> 'a list lexf = 
  fun v tok lexer buf ->
    match tok with 
    | R_SQ_BRACKET -> tok, []
    | _ -> (
        let tok, va = v tok lexer buf in
        let tok, vas = list_value_inner v tok lexer buf in
        tok, va::vas
      )

let list_value: ('a lexf) -> 'a list lexf = 
  fun v tok lexer buf ->
    let tok = l_sq_bracket tok lexer buf in
    let tok,vs = list_value_inner v tok lexer buf in
    let tok = r_sq_bracket tok lexer buf in
    tok, vs

let e1_v_lexf : G.v -> G.v lexf = e1_lexf
let e1_vc_lexf : G.vc -> G.vc lexf = e1_lexf

let rec value: G.v lexf = 
  fun tok ->
    match tok, to_enum_value tok with 
    | _, Some v -> e1_v_lexf (G.EnumValue v) tok
    | INT i, _ -> e1_v_lexf (G.IntValue (Int32.of_string i)) tok
    | FLOAT i, _ -> e1_v_lexf (G.FloatValue i) tok
    | STRING v, _ -> e1_v_lexf (G.StringValue (G.StringValue v)) tok
    | BLOCK_STRING v, _ -> e1_v_lexf (G.StringValue (G.BlockStringValue v)) tok
    | TRUE, _ -> e1_v_lexf (G.BooleanValue true) tok
    | FALSE, _ -> e1_v_lexf (G.BooleanValue false) tok
    | NULL, _ -> e1_v_lexf (G.NullValue) tok
    | L_BRACKET, _ -> (fun lexer buf -> 
        let tok, fields = object_value value tok lexer buf in
        tok, G.ObjectValue fields
      )
    | L_SQ_BRACKET, _ -> (fun lexer buf ->
        let tok, vs = list_value value tok lexer buf in
        tok, G.ListValue vs
      )
    | DOLLAR, _ -> (fun lexer buf -> 
        let tok, v = variable tok lexer buf in
        tok, G.Variable v
      )
    | _ -> raise (Expected "value")

let rec value_const: G.vc lexf = 
  fun tok ->
    match tok, to_enum_value tok with 
    | _, Some v -> e1_vc_lexf (G.EnumValue v) tok
    | INT i, _ -> e1_vc_lexf (G.IntValue (Int32.of_string i)) tok
    | FLOAT i, _ -> e1_vc_lexf (G.FloatValue i) tok
    | STRING v, _ -> e1_vc_lexf (G.StringValue (G.StringValue v)) tok
    | BLOCK_STRING v, _ -> e1_vc_lexf (G.StringValue (G.BlockStringValue v)) tok
    | TRUE, _ -> e1_vc_lexf (G.BooleanValue true) tok
    | FALSE, _ -> e1_vc_lexf (G.BooleanValue false) tok
    | NULL, _ -> e1_vc_lexf (G.NullValue) tok
    | L_BRACKET, _ -> (fun lexer buf -> 
        let tok, fields = object_value value_const tok lexer buf in
        tok, G.ObjectValue fields
      )
    | L_SQ_BRACKET, _ -> (fun lexer buf ->
        let tok, vs = list_value value_const tok lexer buf in
        tok, G.ListValue vs
      )
    | _ -> raise (Expected "value")


let operation_type: token -> lexer -> Lexing.lexbuf -> (token * G.operation_type) = 
  fun tok -> 
    let tpe = 
      match tok with
      | OP_QUERY -> G.Query
      | OP_SUBSCRIPTION -> G.Subscription
      | OP_MUTATION -> G.Mutation
      | _ -> raise (Expected "operation-type")
    in
    fun lexer buf ->
      let tok = lexer buf in
      (tok, tpe)



let argument: ('a lexf) -> 'a G.argument lexf = 
  fun v tok lexer buf ->
    match to_name tok with
    | Some n -> (
        let tok = lexer buf in (* Consume name *)
        let tok = colon tok lexer buf in
        let (tok, va) = v tok lexer buf in
        (tok , {name = n; value = va})
      )
    | _ -> raise (Expected "name")

let rec arguments_inner: ('a lexf) -> 'a G.argument list lexf = 
  fun v tok lexer buf ->
    match tok with
    | R_PAREN -> (tok, [])
    | _ -> (
        let (tok, arg) = argument v tok lexer buf in
        let (tok, args) = arguments_inner v tok lexer buf in
        (tok, arg::args)
      )

let arguments_opt: ('a lexf) -> 'a G.argument list lexf =
  fun v tok lexer buf ->
    match tok with
    | L_PAREN -> (
        let tok = l_paren tok lexer buf in
        let (tok, arg) = argument v tok lexer buf in
        let (_, args) = arguments_inner v tok lexer buf in
        let tok = r_paren tok lexer buf in
        (tok, arg::args)
      )
    | _ -> (tok, [])



let directive: ('a lexf) -> token -> lexer -> Lexing.lexbuf -> (token * 'a G.directive) = 
  fun v tok lexer buf ->
    let tok = at tok lexer buf in
    let (tok, n) = name tok lexer buf in
    let (tok, args) = arguments_opt v tok lexer buf in
    (
      tok, 
      {
        name = n; 
        arguments = args
      })


let rec directives_opt: ('a lexf) -> token -> lexer -> Lexing.lexbuf -> (token * 'a G.directive list) =
  fun v tok lexer buf ->
    match tok with
    | AT -> (
        let (tok, d) = directive v tok lexer buf in
        let (tok, ds) = directives_opt v tok lexer buf in
        (tok, d::ds)
      )
    | _ -> tok, []

let directives: ('a lexf) -> token -> lexer -> Lexing.lexbuf -> (token * 'a G.directive list) =
  fun v tok lexer buf ->
    let (tok, d) = directive v tok lexer buf in
    let (tok, ds) = directives_opt v tok lexer buf in
    (tok, d::ds)

let rec fragment_or_inline_fragment_spread: G.selection lexf = 
  fun tok lexer buf ->
    let tok = spread tok lexer buf in
    match to_fragment_name tok with
    | Some _ -> (
        let (tok, name) = name tok lexer buf in
        let (tok, dirs) = directives_opt value tok lexer buf in
        (tok, G.FragmentSpread {name = name; directives = dirs})
      )
    | _ -> (
        let (tok, tc) = type_condition_opt tok lexer buf in
        let (tok, ds) = directives_opt value tok lexer buf in
        let (tok, ss) = selection_set tok lexer buf in
        (tok, G.InlineFragment {condition = tc; directives = ds; selectionSet = ss})
      )


and field: G.field lexf = 
  fun tok lexer buf ->
    let (tok, n1) = name tok lexer buf in
    let (tok, alias, name) = (
      match tok with
      | COLON -> (
          let tok = colon tok lexer buf in
          let (tok, n2) = name tok lexer buf in
          (tok, Some n1, n2)
        )
      | _ -> (
          (tok, None, n1)
        )
    ) in
    let (tok, args) = arguments_opt value tok lexer buf in 
    let (tok, dirs) = directives_opt value tok lexer buf in
    let (tok, ss) = selection_set_opt tok lexer buf in
    (tok, {alias = alias; name = name; arguments = args; directives = dirs; selectionSet = ss })


and field_selection: G.selection lexf =
  fun tok lexer buf ->
    let (tok, f) = field tok lexer buf in
    (tok, G.Field f)

and selection: G.selection lexf = 
  fun tok  ->
    match tok, to_name tok with
    | SPREAD, _ -> fragment_or_inline_fragment_spread tok
    | _, Some _ -> field_selection tok
    | _ -> raise (Expected "field or fragment spread")

and selections: G.selection list lexf = 
  fun tok lexer buf ->
    match tok with
    | R_BRACKET -> (tok, [])
    | _ -> 
      let (tok, s) = selection tok lexer buf in
      let (tok, ss) = selections tok lexer buf in
      (tok, s::ss)


and selection_set: token -> lexer -> Lexing.lexbuf -> (token * G.selection list) =
  fun tok lexer buf ->
    let tok = l_bracket tok lexer buf in
    let (tok, s) = selection tok lexer buf in
    let (tok, ss) = selections tok lexer buf in
    let tok = r_bracket tok lexer buf in
    (tok, s::ss)

and selection_set_opt: G.selection list lexf = 
  fun tok ->
    match tok with
    | L_BRACKET -> selection_set tok
    | _ -> c_lexf [] tok


let non_null_tpe: G.non_null_type  -> G.tpe lexf =
  fun nnt tok lexer buf ->
    match tok with
    | EXCLAMATION -> 
      let tok = exclamation tok lexer buf in
      (tok, G.NonNullType nnt)
    | _ -> (tok, match nnt with | G.NamedType n -> G.NamedType n | G.ListType t -> G.ListType t)

let rec list_tpe: G.list_type lexf = 
  fun tok lexer buf ->
    let tok = l_sq_bracket tok lexer buf in
    let (tok, tpe) = tpe tok lexer buf in
    let tok = r_sq_bracket tok lexer buf in
    (tok, tpe)

and tpe: G.tpe lexf =
  fun tok lexer buf ->
    match tok, to_name tok with
    | (L_SQ_BRACKET, _) -> 
      let (tok, t) = list_tpe tok lexer buf in
      non_null_tpe (G.ListType t) tok lexer buf

    | (_, Some _) ->
      let (tok, t) = named_tpe tok lexer buf in
      non_null_tpe (G.NamedType t) tok lexer buf
    | _ -> raise (Expected "Name or list type")






let default_value_opt: G.vc option lexf =  
  fun tok lexer buf -> 
    match tok with
    | EQUAL ->
      let tok = lexer buf in
      let (tok, v) = value_const tok lexer buf in
      (tok, Some v)
    | _ -> (tok, None)

let variable_definition: G.variable_definition lexf = 
  fun tok lexer buf ->
    let (tok, v) = variable tok lexer buf in
    let tok = colon tok lexer buf in
    let (tok, tpe) = tpe tok lexer buf in
    let (tok, df) = default_value_opt tok lexer buf in
    (tok, {variable = v; tpe = tpe; defaultValue = df})


let rec variable_definitions_inner: G.variable_definition list lexf = 
  fun tok lexer buf ->
    match tok with
    | R_PAREN -> (tok, [])
    | _ -> (
        let (tok, d) = variable_definition tok lexer buf in
        let (tok, ds) = variable_definitions_inner tok lexer buf in
        (tok, d::ds)
      )

let variable_definitions_opt: token -> lexer -> Lexing.lexbuf -> (token * G.variable_definition list) = 
  fun tok lexer buf ->
    match tok with
    | L_PAREN -> (
        let tok = l_paren tok lexer buf in
        let (tok, d) = variable_definition tok lexer buf in
        let (tok, ds) = variable_definitions_inner tok lexer buf in
        let tok = r_paren tok lexer buf in
        (tok, d::ds)
      )
    | _ -> (tok, [])




let operation_definition = 
  fun tok lexer buf ->
    match tok with
    | L_BRACKET -> (
        let (tok, ss) = selection_set tok lexer buf in
        (tok, G.ExecutableDefinition (G.OperationDefinition ({tpe = G.Query; name = None; variables = []; directives = []; selectionSet = ss})))
      )
    | _ -> 
      let (tok, op) = operation_type tok lexer buf in
      let (tok, n) = name_opt tok lexer buf in
      let (tok, vars) = variable_definitions_opt tok lexer buf in
      let (tok, dirs) = directives_opt value tok lexer buf in
      let (tok, ss) = selection_set tok lexer buf in
      (tok, G.ExecutableDefinition (G.OperationDefinition ({
           tpe = op;
           name = n;
           directives = dirs;
           variables = vars;
           selectionSet = ss;
         })))

let fragment_definition: G.definition lexf = 
  fun tok lexer buf ->
    let tok = fragment tok lexer buf in
    let (tok, fn) = fragment_name tok lexer buf in
    let (tok, tc) = type_condition tok lexer buf in
    let (tok, dirs) = directives_opt value tok lexer buf in
    let (tok, ss) = selection_set tok lexer buf in
    (tok, (G.ExecutableDefinition (G.FragmentDefinition {name = fn; condition = tc; directives = dirs; selectionSet = ss})))

let operation_type_definition: G.operation_type_definition lexf = 
  fun tok lexer buf ->
    let (tok, op) = operation_type tok lexer buf in
    let tok = colon tok lexer buf in
    let (tok, nt) = named_tpe tok lexer buf in
    (tok, {operation = op; tpe = nt})

let rec operation_type_definitions: G.operation_type_definition list lexf = 
  fun tok lexer buf ->
    match tok with
    | R_BRACKET -> (tok, [])
    | _ -> 
      let (tok, op) = operation_type_definition tok lexer buf in
      let (tok, ops) = operation_type_definitions tok lexer buf in
      (tok, op::ops)

let schema_definition: G.definition lexf =
  fun tok lexer buf ->
    let tok = schema tok lexer buf in
    let (tok, ds) = directives_opt value_const tok lexer buf in
    let tok = l_bracket tok lexer buf in
    let (tok, op) = operation_type_definition tok lexer buf in
    let (tok, ops) = operation_type_definitions tok lexer buf in
    let tok = r_bracket tok lexer buf in
    (
      tok,
      (
        G.TypeSystemDefinition (
          G.SchemaDefinition {
            directives = ds;
            operations = op::ops;
          }
        )
      )
    )


let input_value_definition: G.input_value_definition lexf = 
  fun tok lexer buf ->
    let (tok, desc) = string_v_opt tok lexer buf in
    let (tok, n) = name tok lexer buf in
    let tok = colon tok lexer buf in
    let (tok, tpe) = tpe tok lexer buf in
    let (tok, dfv) = default_value_opt tok lexer buf in
    let (tok, dirs) = directives_opt value_const tok lexer buf in
    (
      tok,
      {
        description = desc;
        name = n;
        tpe = tpe;
        defaultValue = dfv;
        directives = dirs;
      }
    )



let rec brac_input_value_definitions_inner: G.input_value_definition list lexf = 
  fun tok lexer buf ->
    match tok with
    | R_BRACKET -> (tok, [])
    | _ -> (
        let (tok, iv) = input_value_definition tok lexer buf in
        let (tok, ivs) = brac_input_value_definitions_inner tok lexer buf in
        (tok, iv::ivs)
      )

let brac_input_value_definitions: G.input_value_definition list lexf =
  fun tok lexer buf ->
    let (tok, i) = input_value_definition tok lexer buf in
    let (tok, is) = brac_input_value_definitions_inner tok lexer buf in
    (tok, i::is)

let rec paren_input_value_definitions_inner: G.input_value_definition list lexf = 
  fun tok lexer buf ->
    match tok with
    | R_PAREN -> (tok, [])
    | _ -> (
        let (tok, iv) = input_value_definition tok lexer buf in
        let (tok, ivs) = paren_input_value_definitions_inner tok lexer buf in
        (tok, iv::ivs)
      )

let paren_input_value_definitions: G.input_value_definition list lexf =
  fun tok lexer buf ->
    let (tok, i) = input_value_definition tok lexer buf in
    let (tok, is) = paren_input_value_definitions_inner tok lexer buf in
    (tok, i::is)


let arguments_definition_opt: G.input_value_definition list lexf = 
  fun tok lexer buf ->
    match tok with
    | L_PAREN -> 
      let tok = l_paren tok lexer buf in
      let (tok, is) = paren_input_value_definitions tok lexer buf in
      let tok = r_paren tok lexer buf in
      (tok, is)
    | _ -> (tok, [])

let directive_location: G.directive_location lexf = 
  fun tok ->
    match tok with
    | EDIR_QUERY -> e1_lexf (G.ExecutableDirectiveLocation G.Query) tok 
    | EDIR_MUTATION  -> e1_lexf (G.ExecutableDirectiveLocation  G.Mutation) tok 
    | EDIR_SUBSCRIPTION  -> e1_lexf (G.ExecutableDirectiveLocation  G.Subscription ) tok 
    | EDIR_FIELD  -> e1_lexf (G.ExecutableDirectiveLocation  G.Field ) tok 
    | EDIR_FRAGMENT_DEFINITION  -> e1_lexf (G.ExecutableDirectiveLocation  G.FragmentDefinition ) tok 
    | EDIR_FRAGMENT_SPREAD  -> e1_lexf (G.ExecutableDirectiveLocation  G.FragmentSpread ) tok 
    | EDIR_INLINE_FRAGMENT  -> e1_lexf (G.ExecutableDirectiveLocation  G.InlineFragment ) tok 
    | TSDIR_SCHEMA  -> e1_lexf (G.TypeSystemDirectiveLocation Schema ) tok
    | TSDIR_SCALAR  -> e1_lexf (G.TypeSystemDirectiveLocation Scalar ) tok
    | TSDIR_OBJECT  -> e1_lexf (G.TypeSystemDirectiveLocation Object ) tok
    | TSDIR_FIELD_DEFINITION  -> e1_lexf (G.TypeSystemDirectiveLocation FieldDefinition ) tok
    | TSDIR_ARGUMENT_DEFINITION  -> e1_lexf (G.TypeSystemDirectiveLocation ArgumentDefinition ) tok
    | TSDIR_INTERFACE  -> e1_lexf (G.TypeSystemDirectiveLocation Interface ) tok
    | TSDIR_UNION  -> e1_lexf (G.TypeSystemDirectiveLocation Union ) tok
    | TSDIR_ENUM  -> e1_lexf (G.TypeSystemDirectiveLocation Enum ) tok
    | TSDIR_ENUM_VALUE  -> e1_lexf (G.TypeSystemDirectiveLocation EnumValue ) tok
    | TSDIR_INPUT_OBJECT  -> e1_lexf (G.TypeSystemDirectiveLocation InputObject ) tok
    | TSDIR_INPUT_FIELD_DEFINITION  -> e1_lexf (G.TypeSystemDirectiveLocation InputFieldDefinition ) tok
    | _ -> raise (Expected "Directive location")

let rec directive_locations_opt: G.directive_location list lexf = 
  fun tok lexer buf ->
    match tok with
    | PIPE -> (
        let tok = pipe tok lexer buf in
        let (tok, loc) = directive_location tok lexer buf in
        let (tok, locs) = directive_locations_opt tok lexer buf in
        (tok, loc::locs)
      )
    | _ -> tok, []


let directive_locations: G.directive_location list lexf = 
  fun tok lexer buf ->
    let tok = match tok with | PIPE -> pipe tok lexer buf | _ -> tok in
    let (tok, l) = directive_location tok lexer buf in
    let (tok, ls) = directive_locations_opt tok lexer buf in
    (tok, l::ls)

let directive_definition: G.directive_definition lexf = 
  fun tok lexer buf ->
    let tok = t_directive tok lexer buf in
    let tok = at tok lexer buf in
    let (tok, n) = name tok lexer buf in
    let (tok, args) = arguments_definition_opt tok lexer buf in
    let tok = on tok lexer buf in
    let (tok, locs) = directive_locations tok lexer buf in
    (tok, {description = None; name = n; arguments = args; locations = locs})


let scalar_type_definition: G.scalar_type_definition lexf = 
  fun tok lexer buf ->
    let tok = t_scalar tok lexer buf in
    let (tok, n) = name tok lexer buf in
    let (tok, dirs) = directives_opt value_const tok lexer buf in
    (tok, {description = None; name = n; directives = dirs})


let rec implements_interfaces_inner: G.named_type list lexf = 
  fun tok lexer buf ->
    match tok with
    | AMPERSAND -> 
      let tok = ampersand tok lexer buf in
      let (tok, nt) = named_tpe tok lexer buf in
      let (tok, nts) = implements_interfaces_inner tok lexer buf in
      tok, nt::nts
    | _ -> tok, []

let implements_interfaces: G.named_type list lexf = 
  fun tok lexer buf ->
    let tok = implements tok lexer buf in
    let tok = match tok with | AMPERSAND -> ampersand tok lexer buf | _ -> tok in
    let (tok, nt) = named_tpe tok lexer buf in
    let (tok, nts) = implements_interfaces_inner tok lexer buf in
    (
      tok,
      nt::nts
    )


let implements_interfaces_opt: G.named_type list lexf = 
  fun tok -> 
    match tok with
    | IMPLEMENTS -> implements_interfaces tok
    | _ -> c_lexf ([]) tok


let field_definition: G.field_definition lexf = 
  fun tok lexer buf ->
    let (tok, desc) = string_v_opt  tok lexer buf in
    let (tok, n) = name tok lexer buf in
    let (tok, args) = arguments_definition_opt tok lexer buf in
    let tok = colon tok lexer buf in
    let (tok, tpe) = tpe tok lexer buf in
    let (tok, dirs) = directives_opt value_const tok lexer buf in
    tok, {
      description = desc;
      name = n;
      arguments = args;
      tpe = tpe;
      directives = dirs;
    }


let rec field_definition_inner: G.field_definition list lexf = 
  fun tok lexer buf ->
    match tok with
    | R_BRACKET -> tok, []
    | _ ->
      let tok, fd = field_definition tok lexer buf in
      let tok, fds = field_definition_inner tok lexer buf in
      tok, (fd::fds)

let field_definitions: G.field_definition list lexf = 
  fun tok lexer buf ->
    let tok = l_bracket tok lexer buf in
    let (tok, fd) = field_definition tok lexer buf in
    let (tok, fds) = field_definition_inner tok lexer buf in
    let tok = r_bracket tok lexer buf in
    (tok, fd::fds)


let field_definitions_opt: G.field_definition list lexf = 
  fun tok ->
    match tok with
    | L_BRACKET  -> field_definitions tok
    | _ -> c_lexf [] tok

let object_type_definition: G.object_type_definition lexf = 
  fun tok lexer buf ->
    let tok = t_type tok lexer buf in
    let (tok, n) = name tok lexer buf in
    let (tok, impl) = implements_interfaces_opt tok lexer buf in
    let (tok, dirs) = directives_opt value_const tok lexer buf in
    let (tok, fds) = field_definitions_opt tok lexer buf in
    (
      tok,
      {
        description = None;
        name = n;
        implements = impl;
        directives = dirs;
        fields = fds;
      }
    )

let interface_type_definition: G.interface_type_definition lexf = 
  fun tok lexer buf ->
    let tok = t_interface tok lexer buf in
    let (tok, n) = name tok lexer buf in
    let (tok, dirs) = directives_opt value_const tok lexer buf in
    let (tok, fds) = field_definitions_opt tok lexer buf in
    (
      tok,
      {
        description = None;
        name = n;
        directives = dirs;
        fields = fds;
      }
    )

let rec union_member_types_inner: G.named_type list lexf =
  fun tok lexer buf ->
    match tok with
    | PIPE -> 
      let tok = pipe tok lexer buf in
      let tok, nt = named_tpe tok lexer buf in
      let tok, nts = union_member_types_inner tok lexer buf in
      tok, nt::nts
    | _ -> tok, []



let union_member_types: G.named_type list lexf = 
  fun tok lexer buf  ->
    let tok = equal tok lexer buf in
    let tok = match tok with | PIPE -> pipe tok lexer buf | _ -> tok in
    let tok, nt = named_tpe tok lexer buf in
    let tok, nts = union_member_types_inner tok lexer buf in
    tok, nt::nts



let union_member_types_opt: G.named_type list lexf = 
  fun tok ->
    match tok with
    | EQUAL -> union_member_types tok
    | _ -> c_lexf [] tok


let union_type_definition: G.union_type_definition lexf = 
  fun tok lexer buf ->
    let tok = t_union tok lexer buf in
    let (tok, n) = name tok lexer buf in
    let (tok, dirs) = directives_opt value_const tok lexer buf in
    let (tok, umt) = union_member_types_opt tok lexer buf in
    (
      tok,
      {
        description = None;
        name = n;
        directives = dirs;
        types = umt
      }
    )


let enum_value_definition: G.enum_value_definition lexf =
  fun tok lexer buf ->
    let tok, desc = string_v_opt tok lexer buf in
    let tok, v = enum_value tok lexer buf in
    let tok, dirs = directives_opt value_const tok lexer buf in
    tok, {description = desc; value = v; directives = dirs}

let rec enum_values_definition_inner: G.enum_value_definition list lexf =
  fun tok lexer buf ->
    match tok with
    | R_BRACKET -> tok, []
    | _ -> (
        let tok,v = enum_value_definition tok lexer buf in
        let tok, vs = enum_values_definition_inner tok lexer buf in
        tok, v::vs
      )

let enum_values_definition: G.enum_value_definition list lexf = 
  fun tok lexer buf ->
    let tok = l_bracket tok lexer buf in
    let tok, v = enum_value_definition tok lexer buf in
    let tok, vs = enum_values_definition_inner tok lexer buf in
    let tok = r_bracket tok lexer buf in
    tok, v::vs


let enum_values_definition_opt: G.enum_value_definition list lexf = 
  fun tok ->
    match tok with
    | L_BRACKET -> enum_values_definition tok
    | _ -> c_lexf [] tok


let enum_type_definition: G.enum_type_definition lexf = 
  fun tok lexer buf ->
    let tok = t_enum tok lexer buf in
    let (tok, n) = name tok lexer buf in
    let (tok, dirs) = directives_opt value_const tok lexer buf in
    let (tok, vs) = enum_values_definition_opt tok lexer buf in
    tok,
    {
      description = None;
      name = n;
      directives = dirs;
      values = vs;
    }

let input_fields_definition: G.input_value_definition list lexf = 
  fun tok lexer buf ->
    let tok = l_bracket tok lexer buf in
    let tok, vs = brac_input_value_definitions tok lexer buf in
    let tok = r_bracket tok lexer buf in
    tok, vs

let input_fields_definition_opt: G.input_value_definition list lexf = 
  fun tok ->
    match tok with
    | L_BRACKET -> input_fields_definition tok
    | _ -> c_lexf [] tok

let input_object_type_definition: G.input_object_type_definition lexf = 
  fun tok lexer buf ->
    let tok = t_input tok lexer buf in
    let (tok, n) = name tok lexer buf in
    let (tok, dirs) = directives_opt value_const tok lexer buf in
    let (tok, fs) = input_fields_definition_opt tok lexer buf in
    (
      tok,
      {
        description = None;
        name = n;
        directives = dirs;
        fields = fs;
      }
    )



let directive_or_type_definition: G.definition lexf = 
  fun tok lexer buf ->
    let (tok, desc) = string_v_opt tok lexer buf in
    match tok with
    | DIRECTIVE -> 
      let (tok, d) = directive_definition tok lexer buf in
      (tok, G.TypeSystemDefinition (G.DirectiveDefinition {d with description = desc}))
    | TYPE -> 
      let (tok, d) = object_type_definition tok lexer buf in
      (tok, G.TypeSystemDefinition (G.TypeDefinition (G.ObjectTypeDefinition {d with description = desc})))
    | INTERFACE -> 
      let (tok, d) = interface_type_definition tok lexer buf in
      (tok, G.TypeSystemDefinition (G.TypeDefinition (G.InterfaceTypeDefinition {d with description = desc})))
    | UNION -> 
      let (tok, d) = union_type_definition tok lexer buf in
      (tok, G.TypeSystemDefinition (G.TypeDefinition (G.UnionTypeDefinition {d with description = desc})))
    | ENUM -> 
      let (tok, d) = enum_type_definition tok lexer buf in
      (tok, G.TypeSystemDefinition (G.TypeDefinition (G.EnumTypeDefinition {d with description = desc})))
    | INPUT -> 
      let (tok, d) = input_object_type_definition tok lexer buf in
      (tok, G.TypeSystemDefinition (G.TypeDefinition (G.InputObjectTypeDefinition {d with description = desc})))
    | SCALAR ->
      let tok, d = scalar_type_definition tok lexer buf in
      tok, G.TypeSystemDefinition (G.TypeDefinition (G.ScalarTypeDefinition {d with description = desc}))
    | _ -> raise (Expected "directive or type")

let schema_extension_rest: G.operation_type_definition list lexf= 
  fun tok lexer buf ->
    let tok = l_bracket tok lexer buf in
    let (tok, op) = operation_type_definition tok lexer buf in
    let (tok, ops) = operation_type_definitions tok lexer buf in
    let tok = r_bracket tok lexer buf in
    (tok, op::ops)


let schema_extension_rest_opt: G.operation_type_definition list lexf= 
  fun tok lexer buf ->
    match tok with
    | L_BRACKET -> 
      schema_extension_rest tok lexer buf
    | _ -> (tok, [])



let schema_extension: G.definition lexf = 
  fun tok lexer buf ->
    let tok = schema tok lexer buf in
    match tok with
    | AT -> (
        let (tok, dirs) = directives value_const tok lexer buf in
        let (tok, ops) = schema_extension_rest_opt tok lexer buf in
        (tok, G.TypeSystemExtension (G.SchemaExtension {directives = dirs; operations = ops}))
      )
    | _ -> (
        let (tok, ops) = schema_extension_rest tok lexer buf in
        (tok, G.TypeSystemExtension (G.SchemaExtension {directives = []; operations = ops}))
      )


let scalar_type_extension: G.definition lexf = 
  fun tok lexer buf ->
    let tok = t_scalar tok lexer buf in
    let (tok, n) = name tok lexer buf in
    let (tok, ds) = directives value_const tok lexer buf in
    (
      tok,
      G.TypeSystemExtension (
        G.TypeExtension (
          G.ScalarTypeExtension (
            {
              name = n;
              directives = ds
            }
          )
        )
      )
    )

let object_type_extension: G.definition lexf = 
  fun tok lexer buf ->
    let tok = t_type tok lexer buf in
    let (tok, n) = name tok lexer buf in
    match tok with
    | L_BRACKET -> (
        let (tok, fd) = field_definitions tok lexer buf in
        (tok, 
         G.TypeSystemExtension (
           G.TypeExtension (
             G.ObjectTypeExtension (
               {name = n; implements = []; directives = []; fields = fd}
             )
           )
         )
        )
      )
    | AT -> (
        let (tok, dirs) = directives value_const tok lexer buf in
        let (tok, fds) = field_definitions_opt tok lexer buf in
        (tok, 
         G.TypeSystemExtension (
           G.TypeExtension (
             G.ObjectTypeExtension (
               {name = n; implements = []; directives = dirs; fields = fds}
             )
           )
         )
        )
      )
    | IMPLEMENTS -> (
        let (tok, impl) = implements_interfaces tok lexer buf in
        let (tok, dirs) = directives_opt value_const tok lexer buf in
        let (tok, fds) = field_definitions_opt tok lexer buf in
        (tok, 
         G.TypeSystemExtension (
           G.TypeExtension (
             G.ObjectTypeExtension (
               {name = n; implements = impl; directives = dirs; fields = fds}
             )
           )
         )
        )
      )
    | _ -> raise (Expected "implements, @, or {")

let interface_type_extension: G.definition lexf = 
  fun tok lexer buf ->
    let tok = t_interface tok lexer buf in
    let (tok, n) = name tok lexer buf in
    match tok with
    | AT ->
      let (tok, dirs) = directives value_const tok lexer buf in
      let (tok, fds) = field_definitions_opt tok lexer buf in
      (
        tok,
        G.TypeSystemExtension (
          G.TypeExtension (
            G.InterfaceTypeExtension (
              {
                name = n;
                directives = dirs;
                fields = fds;
              }
            )
          )
        )
      )
    | L_BRACKET ->
      let (tok, fds) = field_definitions tok lexer buf in
      (
        tok,
        G.TypeSystemExtension (
          G.TypeExtension (
            G.InterfaceTypeExtension (
              {
                name = n;
                directives = [];
                fields = fds;
              }
            )
          )
        )
      )
    | _ -> raise (Expected "@ or {")


let union_type_extension: G.definition lexf = 
  fun tok lexer buf -> 
    let tok = t_union tok lexer buf in
    let (tok, n) = name tok lexer buf in
    match tok with
    | AT ->
      let (tok, dirs) = directives value_const tok lexer buf in
      let (tok, fds) = union_member_types_opt tok lexer buf in
      (
        tok,
        G.TypeSystemExtension (
          G.TypeExtension (
            G.UnionTypeExtension (
              {
                name = n;
                directives = dirs;
                types = fds;
              }
            )
          )
        )
      )
    | EQUAL ->
      let (tok, fds) = union_member_types tok lexer buf in
      (
        tok,
        G.TypeSystemExtension (
          G.TypeExtension (
            G.UnionTypeExtension (
              {
                name = n;
                directives = [];
                types = fds;
              }
            )
          )
        )
      )
    | _ -> raise (Expected "@ or =")



let enum_type_extension: G.definition lexf = 
  fun tok lexer buf -> 
    let tok = t_enum tok lexer buf in
    let (tok, n) = name tok lexer buf in
    match tok with
    | AT ->
      let (tok, dirs) = directives value_const tok lexer buf in
      let (tok, fds) = enum_values_definition_opt tok lexer buf in
      (
        tok,
        G.TypeSystemExtension (
          G.TypeExtension (
            G.EnumTypeExtension (
              {
                name = n;
                directives = dirs;
                values = fds;
              }
            )
          )
        )
      )
    | L_BRACKET ->
      let (tok, fds) = enum_values_definition tok lexer buf in
      (
        tok,
        G.TypeSystemExtension (
          G.TypeExtension (
            G.EnumTypeExtension (
              {
                name = n;
                directives = [];
                values = fds;
              }
            )
          )
        )
      )
    | _ -> raise (Expected "@ or =")

let input_type_extension: G.definition lexf = 
  fun tok lexer buf ->
    let tok = t_input tok lexer buf in
    let (tok, n) = name tok lexer buf in
    match tok with
    | AT ->
      let (tok, dirs) = directives value_const tok lexer buf in
      let (tok, fds) = input_fields_definition_opt tok lexer buf in
      (
        tok,
        G.TypeSystemExtension (
          G.TypeExtension (
            G.InputObjectTypeExtension (
              {
                name = n;
                directives = dirs;
                fields = fds;
              }
            )
          )
        )
      )
    | L_BRACKET ->
      let (tok, fds) = input_fields_definition tok lexer buf in
      (
        tok,
        G.TypeSystemExtension (
          G.TypeExtension (
            G.InputObjectTypeExtension (
              {
                name = n;
                directives = [];
                fields = fds;
              }
            )
          )
        )
      )
    | _ -> raise (Expected "@ or =")


let type_system_extension: G.definition lexf = 
  fun tok lexer buf ->
    let tok = extend tok lexer buf in
    match tok with
    | SCHEMA -> schema_extension tok lexer buf
    | SCALAR -> scalar_type_extension tok lexer buf
    | TYPE -> object_type_extension tok lexer buf
    | INTERFACE -> interface_type_extension tok lexer buf
    | UNION -> union_type_extension tok lexer buf
    | ENUM -> enum_type_extension tok lexer buf
    | INPUT -> input_type_extension tok lexer buf
    | _ -> raise (Expected "type or schema")



let definition: token -> (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (token * G.definition) = 
  fun t ->
    match t with
    | SCHEMA -> schema_definition t
    | BLOCK_STRING _ 
    | STRING _ 
    | INPUT
    | ENUM
    | SCALAR
    | UNION
    | TYPE
    | INTERFACE
    | DIRECTIVE
      -> 
      directive_or_type_definition t
    | EXTEND -> type_system_extension t
    | FRAGMENT -> fragment_definition t
    | OP_QUERY
    | OP_SUBSCRIPTION 
    | OP_MUTATION
    | L_BRACKET -> operation_definition t
    | _ -> raise (Expected "operation definition")


let rec definitions: G.definition list lexf = 
  fun tok lexer buf -> 
    match tok with
    | EOF -> (EOF, [])
    | _ -> 
      let (tok, def) = definition tok lexer buf in
      let (tok, defs) = definitions tok lexer buf in
      (tok, def::defs)


let document: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (G.document) = 
  fun lexer buf ->
    let tok = lexer buf in
    let (tok, d) = definition tok lexer buf in
    let (_, ds) = definitions tok lexer buf in
    { definitions = d::ds }

let input_value: G.input_value lexf = 
  fun tok lexer buf ->
    let tok, desc = string_v_opt tok lexer buf in
    let tok, n = name tok lexer buf in
    let tok, df = default_value_opt tok lexer buf in
    tok, {description = desc; name = n; value = df}

let type_selector : G.type_selector lexf = 
  fun tok lexer buf ->
    let tok, n1 = name tok lexer buf in
    match tok with
    | COLON -> (
        let tok = colon tok lexer buf in
        let tok, n2 = name tok lexer buf in
        tok, {name = n2; alias = Some n1}
      )
    | _ -> tok, {name = n1; alias = None}


let field_selector: G.field_selector lexf = type_selector

let rec field_transform_arguments_inner: G.input_value list lexf =
  fun tok lexer buf ->
    match tok with
    | R_PAREN -> tok, []
    | _ -> 
      let tok, v = input_value tok lexer buf in
      let tok, vs = field_transform_arguments_inner tok lexer buf in
      tok, v::vs


let field_transform_arguments_opt: G.input_value list lexf = 
  fun tok lexer buf ->
    match tok with
    | L_PAREN -> 
      let tok = l_paren tok lexer buf in
      let tok, arg = input_value tok lexer buf in
      let tok, args = field_transform_arguments_inner tok lexer buf in
      let tok = r_paren tok lexer buf in    
      tok, arg::args
    | _ -> tok, []

let field_transform: G.field_transformation lexf = 
  fun tok lexer buf ->
    let tok, desc = string_v_opt tok lexer buf in
    let tok, fs = field_selector tok lexer buf in
    let tok, args = field_transform_arguments_opt tok lexer buf in
    tok, {description= desc; selector = fs; arguments = args}

let rec fields_transform_inner: G.field_transformation list lexf = 
  fun tok lexer buf ->
    match tok with
    | R_BRACKET -> tok, []
    | _ -> 
      let tok, v = field_transform tok lexer buf in
      let tok, vs = fields_transform_inner tok lexer buf in
      tok, v::vs


let fields_transform_opt: G.field_transformation list lexf = 
  fun tok lexer buf ->
    match tok with
    | L_BRACKET -> (
        let tok = l_bracket tok lexer buf in
        let tok, v = field_transform tok lexer buf in
        let tok, vs = fields_transform_inner tok lexer buf in
        let tok = r_bracket tok lexer buf in
        tok, v::vs
      )
    |_ -> tok, []


let rec input_fields_transform_inner: G.input_value list lexf = 
  fun tok lexer buf ->
    match tok with
    | R_BRACKET -> tok, []
    | _ -> 
      let tok, v = input_value tok lexer buf in
      let tok, vs = input_fields_transform_inner tok lexer buf in
      tok, v::vs

let input_fields_transform_opt: G.input_value list lexf = 
  fun tok lexer buf -> 
    match tok with
    | L_BRACKET ->(
        let tok = l_bracket tok lexer buf in
        let tok, v = input_value tok lexer buf in
        let tok, vs = input_fields_transform_inner tok lexer buf in
        let tok = r_bracket tok lexer buf in
        tok, v::vs
      )
    | _ -> tok, []


let rec operation_type_transformation_definitions_inner: G.operation_type list lexf =
  fun tok lexer buf -> 
    match tok with
    | R_BRACKET -> tok, []
    | _ -> 
      let tok, op = operation_type tok lexer buf in
      let tok, ops = operation_type_transformation_definitions_inner tok lexer buf in
      tok, op::ops



let operation_type_transformation_definitions: G.operation_type list lexf =
  fun tok lexer buf ->
    let tok = l_bracket tok lexer buf in
    let tok, op = operation_type tok lexer buf in
    let tok, ops = operation_type_transformation_definitions_inner tok lexer buf in
    let tok = r_bracket tok lexer buf in
    tok, op::ops


let scalar_type_transformation: G.scalar_type_transformation lexf = 
  fun tok lexer buf ->
    let tok = t_scalar tok lexer buf in
    let tok, ts = type_selector tok lexer buf in
    tok, {description = None; selector = ts}


let object_type_transformation: G.object_type_transformation lexf = 
  fun tok lexer buf ->
    let tok = t_type tok lexer buf in
    let tok, ts = type_selector tok lexer buf in
    let tok, fs = fields_transform_opt tok lexer buf in
    tok, {description = None; selector = ts; fields = fs}



let enum_value_transformation: G.enum_value_transformation lexf = 
  fun tok lexer buf ->
    let tok, desc = string_v_opt tok lexer buf in
    let tok, v = enum_value tok lexer buf in
    tok, {description = desc; value = v}

let rec enum_value_transformation_inner: G.enum_value_transformation list lexf = 
  fun tok lexer buf ->
    match tok with
    | R_BRACKET -> tok, []
    | _ -> 
      let tok, v = enum_value_transformation tok lexer buf in
      let tok, vs = enum_value_transformation_inner tok lexer buf in
      tok, v::vs


let enum_value_transformation_opt: G.enum_value_transformation list lexf = 
  fun tok lexer buf ->
    match tok with
    | L_BRACKET -> 
      let tok = l_bracket tok lexer buf in
      let tok, vs = enum_value_transformation_inner tok lexer buf in
      let tok = r_bracket tok lexer buf in
      tok, vs
    | _ -> tok, []

let enum_type_transformation: G.enum_type_transformation lexf = 
  fun tok lexer buf ->
    let tok = t_enum tok lexer buf in
    let tok, ts = type_selector tok lexer buf in
    let tok, vs = enum_value_transformation_opt tok lexer buf in
    tok, {description = None; selector = ts; values = vs}

let interface_type_transformation: G.interface_type_transformation lexf = 
  fun tok lexer buf ->
    let tok = t_interface tok lexer buf in
    let tok, ts = type_selector tok lexer buf in
    let tok, fs = fields_transform_opt tok lexer buf in
    tok, {description = None; selector = ts; fields = fs}

let input_object_type_transformation: G.input_object_type_transformation lexf = 
  fun tok lexer buf ->
    let tok = t_input tok lexer buf in
    let tok, ts = type_selector tok lexer buf in
    let tok, fs = input_fields_transform_opt tok lexer buf in
    tok, {description = None; selector = ts; fields = fs}


let union_type_transformation: G.union_type_transformation lexf = 
  fun tok lexer buf ->
    let tok = t_union tok lexer buf in
    let tok, ts = type_selector tok lexer buf in
    tok, {description = None; selector = ts}


let type_transformation: G.string_value option -> G.type_transformation lexf = 
  fun desc tok lexer buf ->
    match tok with
    | SCALAR -> 
      let tok, d = scalar_type_transformation tok lexer buf in
      tok, G.ScalarTypeTransformation {d with description = desc}
    | TYPE -> 
      let tok, d = object_type_transformation tok lexer buf in
      tok, G.ObjectTypeTransformation {d with description = desc}
    | ENUM -> 
      let tok, d = enum_type_transformation tok lexer buf in
      tok, G.EnumTypeTransformation {d with description = desc}
    | INTERFACE -> 
      let tok, d = interface_type_transformation tok lexer buf in
      tok, G.InterfaceTypeTransformation {d with description = desc}
    | INPUT -> 
      let tok, d = input_object_type_transformation tok lexer buf in
      tok, G.InputObjectTypeTransformation {d with description = desc}
    | UNION -> 
      let tok, d = union_type_transformation tok lexer buf in
      tok, G.UnionTypeTransformation {d with description = desc}
    | _ -> raise (Expected "type")


let schema_transformation: G.schema_transformation lexf =
  fun tok lexer buf ->
    let tok = schema tok lexer buf in
    let tok, ops = operation_type_transformation_definitions tok lexer buf in
    tok, ops


let type_or_schema_transformation: G.transformation lexf = 
  fun tok lexer buf ->
    let tok = transform tok lexer buf in
    match tok with
    | SCHEMA -> 
      let tok, t = schema_transformation tok lexer buf in
      tok, G.SchemaTransformation t
    | SCALAR 
    | TYPE
    | ENUM
    | UNION
    | INTERFACE
    | INPUT -> 
      let tok, t = type_transformation None tok lexer buf in
      tok, G.TypeTransformation t      
    | _ -> raise (Expected "transformation target")

let transformation: G.transformation lexf = 
  fun tok lexer buf ->
    match tok with
    | STRING _
    | BLOCK_STRING _ -> (
        let tok, desc = string_v_opt tok lexer buf in
        let tok = transform tok lexer buf in
        let tok, t = type_transformation desc tok lexer buf in
        tok, G.TypeTransformation t
      )
    | TRANSFORM -> 
      type_or_schema_transformation tok lexer buf
    | _ -> raise (Expected "transformation")

let rec transformations: G.transformation list lexf =
  fun tok lexer buf ->
    match tok with
    | EOF -> (EOF, [])
    | _ ->
      let tok, t = transformation tok lexer buf in
      let tok, ts = transformations tok lexer buf in
      tok, t::ts


let trans_document: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (G.trans_document) =
  fun lexer buf ->
    let tok = lexer buf in
    let tok, t = transformation tok lexer buf in
    let _, ts = transformations tok lexer buf in
    { transformations = t::ts }
