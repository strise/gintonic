
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | UNION
    | TYPE
    | TRUE
    | TRANSFORM
    | SUBSCRIPTION
    | STRING of (
# 28 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 16 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
  )
    | SCHEMA
    | SCALAR
    | R_SQ_BRACKET
    | R_PAREN
    | R_BRACKET
    | QUERY
    | NULL
    | NAME of (
# 27 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 28 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
  )
    | MUTATION
    | L_SQ_BRACKET
    | L_PAREN
    | L_BRACKET
    | INTERFACE
    | INT of (
# 30 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 38 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
  )
    | INPUT
    | FLOAT of (
# 31 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 44 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
  )
    | FALSE
    | EQUAL
    | EOF
    | ENUM
    | COLON
    | BLOCK_STRING of (
# 29 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 54 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
  )
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState147
  | MenhirState146
  | MenhirState144
  | MenhirState143
  | MenhirState141
  | MenhirState140
  | MenhirState138
  | MenhirState136
  | MenhirState135
  | MenhirState133
  | MenhirState123
  | MenhirState117
  | MenhirState113
  | MenhirState112
  | MenhirState111
  | MenhirState110
  | MenhirState105
  | MenhirState104
  | MenhirState103
  | MenhirState101
  | MenhirState100
  | MenhirState98
  | MenhirState94
  | MenhirState90
  | MenhirState85
  | MenhirState81
  | MenhirState75
  | MenhirState66
  | MenhirState51
  | MenhirState49
  | MenhirState48
  | MenhirState47
  | MenhirState35
  | MenhirState33
  | MenhirState32
  | MenhirState29
  | MenhirState25
  | MenhirState24
  | MenhirState23
  | MenhirState21
  | MenhirState2
  | MenhirState0

# 33 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  
    open Trans_ast
    let flat(l) = match l with 
      | Some l -> l
      | None -> []


# 123 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"

let rec _menhir_goto_enum_type_transformation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_enum_type_transformation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv569) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_enum_type_transformation) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv567) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((t : 'tv_enum_type_transformation) : 'tv_enum_type_transformation) = _v in
    ((let _v : 'tv_type_transformation = 
# 112 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                          ( EnumTypeTransformation t )
# 138 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv568)) : 'freshtv570)

and _menhir_goto_interface_type_transformation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_interface_type_transformation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv565) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_interface_type_transformation) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv563) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((t : 'tv_interface_type_transformation) : 'tv_interface_type_transformation) = _v in
    ((let _v : 'tv_type_transformation = 
# 110 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                          ( InterfaceTypeTransformation t )
# 155 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv564)) : 'freshtv566)

and _menhir_goto_object_type_transformation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_object_type_transformation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv561) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_object_type_transformation) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv559) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((t : 'tv_object_type_transformation) : 'tv_object_type_transformation) = _v in
    ((let _v : 'tv_type_transformation = 
# 107 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                          ( ObjectTypeTransformation t )
# 172 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv560)) : 'freshtv562)

and _menhir_goto_input_object_type_transformation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_input_object_type_transformation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv557) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_input_object_type_transformation) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv555) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((t : 'tv_input_object_type_transformation) : 'tv_input_object_type_transformation) = _v in
    ((let _v : 'tv_type_transformation = 
# 111 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                          ( InputObjectTypeTransformation t )
# 189 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv556)) : 'freshtv558)

and _menhir_goto_nonempty_list_transformation_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_transformation_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv539 * _menhir_state * 'tv_transformation) * _menhir_state * 'tv_nonempty_list_transformation_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv537 * _menhir_state * 'tv_transformation) * _menhir_state * 'tv_nonempty_list_transformation_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_transformation)), _, (xs : 'tv_nonempty_list_transformation_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_transformation_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 206 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_nonempty_list_transformation_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv538)) : 'freshtv540)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv553 * _menhir_state * 'tv_nonempty_list_transformation_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv549 * _menhir_state * 'tv_nonempty_list_transformation_) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv547 * _menhir_state * 'tv_nonempty_list_transformation_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (ts : 'tv_nonempty_list_transformation_)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 41 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (Trans_ast.document)
# 225 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
            ) = 
# 48 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ( {transformations = ts })
# 229 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv545) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 41 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (Trans_ast.document)
# 237 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv543) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 41 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (Trans_ast.document)
# 245 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv541) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 41 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (Trans_ast.document)
# 253 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
            )) : (
# 41 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (Trans_ast.document)
# 257 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv542)) : 'freshtv544)) : 'freshtv546)) : 'freshtv548)) : 'freshtv550)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv551 * _menhir_state * 'tv_nonempty_list_transformation_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv552)) : 'freshtv554)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_field_transformation_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_field_transformation_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv531 * _menhir_state) * _menhir_state * 'tv_nonempty_list_field_transformation_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv527 * _menhir_state) * _menhir_state * 'tv_nonempty_list_field_transformation_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv525 * _menhir_state) * _menhir_state * 'tv_nonempty_list_field_transformation_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (ft : 'tv_nonempty_list_field_transformation_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_fields_transformation = 
# 220 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ( ft )
# 292 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv523) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_fields_transformation) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv521) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_fields_transformation) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv519) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((x : 'tv_fields_transformation) : 'tv_fields_transformation) = _v in
            ((let _v : 'tv_option_fields_transformation_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 309 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_option_fields_transformation_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv520)) : 'freshtv522)) : 'freshtv524)) : 'freshtv526)) : 'freshtv528)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv529 * _menhir_state) * _menhir_state * 'tv_nonempty_list_field_transformation_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv530)) : 'freshtv532)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv535 * _menhir_state * 'tv_field_transformation) * _menhir_state * 'tv_nonempty_list_field_transformation_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv533 * _menhir_state * 'tv_field_transformation) * _menhir_state * 'tv_nonempty_list_field_transformation_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_field_transformation)), _, (xs : 'tv_nonempty_list_field_transformation_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_field_transformation_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 328 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_nonempty_list_field_transformation_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv534)) : 'freshtv536)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_enum_values_transformation_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_enum_values_transformation_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv513 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_option_enum_values_transformation_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv511 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((fs : 'tv_option_enum_values_transformation_) : 'tv_option_enum_values_transformation_) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (sel : 'tv_type_selector)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_enum_type_transformation = 
# 126 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ({description = None; selector = sel; values = flat fs})
# 352 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_enum_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv512)) : 'freshtv514)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv517 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_option_enum_values_transformation_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv515 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((fs : 'tv_option_enum_values_transformation_) : 'tv_option_enum_values_transformation_) = _v in
        ((let ((_menhir_stack, _menhir_s, (desc : 'tv_description)), _, (sel : 'tv_type_selector)) = _menhir_stack in
        let _3 = () in
        let _2 = () in
        let _v : 'tv_enum_type_transformation = 
# 121 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ({description = Some desc; selector = sel; values = flat fs})
# 370 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_enum_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv516)) : 'freshtv518)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_fields_transformation_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_fields_transformation_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv497 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_option_fields_transformation_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv495 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((fs : 'tv_option_fields_transformation_) : 'tv_option_fields_transformation_) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (ts : 'tv_type_selector)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_object_type_transformation = 
# 164 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    (let a: object_type_transformation = { description = None; selector = ts; fields = flat fs } in a)
# 394 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_object_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv496)) : 'freshtv498)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv501 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_option_fields_transformation_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv499 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((fs : 'tv_option_fields_transformation_) : 'tv_option_fields_transformation_) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (ts : 'tv_type_selector)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_interface_type_transformation = 
# 177 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    (let a: interface_type_transformation = { description = None; selector = ts; fields = flat fs } in a)
# 412 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_interface_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv500)) : 'freshtv502)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv505 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_option_fields_transformation_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv503 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((fs : 'tv_option_fields_transformation_) : 'tv_option_fields_transformation_) = _v in
        ((let ((_menhir_stack, _menhir_s, (desc : 'tv_description)), _, (ts : 'tv_type_selector)) = _menhir_stack in
        let _3 = () in
        let _2 = () in
        let _v : 'tv_object_type_transformation = 
# 170 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    (let a: object_type_transformation = { description = Some desc; selector = ts; fields = flat fs } in a)
# 430 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_object_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv504)) : 'freshtv506)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv509 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_option_fields_transformation_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv507 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((fs : 'tv_option_fields_transformation_) : 'tv_option_fields_transformation_) = _v in
        ((let ((_menhir_stack, _menhir_s, (desc : 'tv_description)), _, (ts : 'tv_type_selector)) = _menhir_stack in
        let _3 = () in
        let _2 = () in
        let _v : 'tv_interface_type_transformation = 
# 183 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    (let a: interface_type_transformation = { description = Some desc; selector = ts; fields = flat fs } in a)
# 448 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_interface_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv508)) : 'freshtv510)
    | _ ->
        _menhir_fail ()

and _menhir_goto_type_transformation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_transformation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv493) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_type_transformation) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv491) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((t : 'tv_type_transformation) : 'tv_type_transformation) = _v in
    ((let _v : 'tv_transformation = 
# 91 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                            ( TypeTransformation t )
# 467 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv492)) : 'freshtv494)

and _menhir_goto_option_input_fields_transformation_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_input_fields_transformation_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv485 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_option_input_fields_transformation_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv483 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((fs : 'tv_option_input_fields_transformation_) : 'tv_option_input_fields_transformation_) = _v in
        ((let ((_menhir_stack, _menhir_s), _, (ts : 'tv_type_selector)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_input_object_type_transformation = 
# 144 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ({selector = ts; fields = flat fs; description = None})
# 489 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_input_object_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv484)) : 'freshtv486)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv489 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_option_input_fields_transformation_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv487 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((fs : 'tv_option_input_fields_transformation_) : 'tv_option_input_fields_transformation_) = _v in
        ((let ((_menhir_stack, _menhir_s, (desc : 'tv_description)), _, (ts : 'tv_type_selector)) = _menhir_stack in
        let _3 = () in
        let _2 = () in
        let _v : 'tv_input_object_type_transformation = 
# 150 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ({selector = ts; fields = flat fs; description = Some desc})
# 507 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_input_object_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv488)) : 'freshtv490)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_enum_value_transformation_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_enum_value_transformation_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv477 * _menhir_state) * _menhir_state * 'tv_nonempty_list_enum_value_transformation_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv473 * _menhir_state) * _menhir_state * 'tv_nonempty_list_enum_value_transformation_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv471 * _menhir_state) * _menhir_state * 'tv_nonempty_list_enum_value_transformation_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (fs : 'tv_nonempty_list_enum_value_transformation_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_enum_values_transformation = 
# 132 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ( fs )
# 535 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv469) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_enum_values_transformation) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv467) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_enum_values_transformation) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv465) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((x : 'tv_enum_values_transformation) : 'tv_enum_values_transformation) = _v in
            ((let _v : 'tv_option_enum_values_transformation_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 552 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_option_enum_values_transformation_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv466)) : 'freshtv468)) : 'freshtv470)) : 'freshtv472)) : 'freshtv474)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv475 * _menhir_state) * _menhir_state * 'tv_nonempty_list_enum_value_transformation_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv476)) : 'freshtv478)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv481 * _menhir_state * 'tv_enum_value_transformation) * _menhir_state * 'tv_nonempty_list_enum_value_transformation_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv479 * _menhir_state * 'tv_enum_value_transformation) * _menhir_state * 'tv_nonempty_list_enum_value_transformation_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_enum_value_transformation)), _, (xs : 'tv_nonempty_list_enum_value_transformation_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_enum_value_transformation_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 571 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_nonempty_list_enum_value_transformation_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv480)) : 'freshtv482)
    | _ ->
        _menhir_fail ()

and _menhir_goto_transformation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_transformation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv463 * _menhir_state * 'tv_transformation) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
    | STRING _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
    | TRANSFORM ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState123
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv461 * _menhir_state * 'tv_transformation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_transformation)) = _menhir_stack in
        let _v : 'tv_nonempty_list_transformation_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 598 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_nonempty_list_transformation_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv462)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123) : 'freshtv464)

and _menhir_goto_option_arguments_ : _menhir_env -> 'ttv_tail -> 'tv_option_arguments_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv459 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_field_selector) = Obj.magic _menhir_stack in
    let (_v : 'tv_option_arguments_) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv457 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_field_selector) = Obj.magic _menhir_stack in
    let ((args : 'tv_option_arguments_) : 'tv_option_arguments_) = _v in
    ((let ((_menhir_stack, _menhir_s, (ds : 'tv_option_description_)), _, (fs : 'tv_field_selector)) = _menhir_stack in
    let _v : 'tv_field_transformation = 
# 226 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ({description = ds; selector = fs; arguments = flat args})
# 618 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv455) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_field_transformation) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv453 * _menhir_state * 'tv_field_transformation) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | STRING _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState85 _v
    | ENUM | FALSE | INPUT | INTERFACE | MUTATION | NAME _ | NULL | QUERY | SCALAR | SCHEMA | SUBSCRIPTION | TRANSFORM | TRUE | TYPE | UNION ->
        _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | R_BRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv451 * _menhir_state * 'tv_field_transformation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_field_transformation)) = _menhir_stack in
        let _v : 'tv_nonempty_list_field_transformation_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 643 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_nonempty_list_field_transformation_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv452)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85) : 'freshtv454)) : 'freshtv456)) : 'freshtv458)) : 'freshtv460)

and _menhir_reduce75 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_enum_values_transformation_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 656 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_option_enum_values_transformation_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run112 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | STRING _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState112 _v
    | ENUM | INPUT | INTERFACE | MUTATION | NAME _ | QUERY | SCALAR | SCHEMA | SUBSCRIPTION | TRANSFORM | TYPE | UNION ->
        _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) MenhirState112
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112

and _menhir_reduce79 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_input_fields_transformation_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 682 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_option_input_fields_transformation_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run105 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | STRING _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
    | ENUM | FALSE | INPUT | INTERFACE | MUTATION | NAME _ | NULL | QUERY | SCALAR | SCHEMA | SUBSCRIPTION | TRANSFORM | TRUE | TYPE | UNION ->
        _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) MenhirState105
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105

and _menhir_goto_scalar_type_transformation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_scalar_type_transformation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv449) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_scalar_type_transformation) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv447) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((t : 'tv_scalar_type_transformation) : 'tv_scalar_type_transformation) = _v in
    ((let _v : 'tv_type_transformation = 
# 108 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                          ( ScalarTypeTransformation t )
# 716 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv448)) : 'freshtv450)

and _menhir_reduce77 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_fields_transformation_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 725 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_option_fields_transformation_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | STRING _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | ENUM | FALSE | INPUT | INTERFACE | MUTATION | NAME _ | NULL | QUERY | SCALAR | SCHEMA | SUBSCRIPTION | TRANSFORM | TRUE | TYPE | UNION ->
        _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_goto_union_type_transformation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_union_type_transformation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv445) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_union_type_transformation) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv443) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((t : 'tv_union_type_transformation) : 'tv_union_type_transformation) = _v in
    ((let _v : 'tv_type_transformation = 
# 109 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                          ( UnionTypeTransformation t )
# 759 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv444)) : 'freshtv446)

and _menhir_goto_nonempty_list_input_value_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_input_value_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv423) * _menhir_state * 'tv_nonempty_list_input_value_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv419) * _menhir_state * 'tv_nonempty_list_input_value_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv417) * _menhir_state * 'tv_nonempty_list_input_value_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, (args : 'tv_nonempty_list_input_value_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_arguments = 
# 241 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ( args )
# 785 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv415) = _menhir_stack in
            let (_v : 'tv_arguments) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv413) = Obj.magic _menhir_stack in
            let (_v : 'tv_arguments) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv411) = Obj.magic _menhir_stack in
            let ((x : 'tv_arguments) : 'tv_arguments) = _v in
            ((let _v : 'tv_option_arguments_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 799 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_option_arguments_ _menhir_env _menhir_stack _v) : 'freshtv412)) : 'freshtv414)) : 'freshtv416)) : 'freshtv418)) : 'freshtv420)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv421) * _menhir_state * 'tv_nonempty_list_input_value_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv422)) : 'freshtv424)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv427 * _menhir_state * 'tv_input_value) * _menhir_state * 'tv_nonempty_list_input_value_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv425 * _menhir_state * 'tv_input_value) * _menhir_state * 'tv_nonempty_list_input_value_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_input_value)), _, (xs : 'tv_nonempty_list_input_value_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_input_value_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 818 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_nonempty_list_input_value_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)) : 'freshtv428)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv441 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv437 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv435 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (fs : 'tv_nonempty_list_input_value_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_input_fields_transformation = 
# 156 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ( fs )
# 839 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv433) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_input_fields_transformation) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv431) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_input_fields_transformation) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv429) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((x : 'tv_input_fields_transformation) : 'tv_input_fields_transformation) = _v in
            ((let _v : 'tv_option_input_fields_transformation_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 856 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_option_input_fields_transformation_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv430)) : 'freshtv432)) : 'freshtv434)) : 'freshtv436)) : 'freshtv438)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv439 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv440)) : 'freshtv442)
    | _ ->
        _menhir_fail ()

and _menhir_reduce73 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_description_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 874 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_option_description_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_list_value_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_value_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv395 * _menhir_state * 'tv_value) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv393 * _menhir_state * 'tv_value) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_value)), _, (xs : 'tv_list_value_)) = _menhir_stack in
        let _v : 'tv_list_value_ = 
# 187 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 891 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_list_value_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv394)) : 'freshtv396)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv409 * _menhir_state) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_SQ_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv405 * _menhir_state) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv403 * _menhir_state) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (vs : 'tv_list_value_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_list_value = 
# 275 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  (vs)
# 912 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv401) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_list_value) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv399) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_list_value) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv397) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((l : 'tv_list_value) : 'tv_list_value) = _v in
            ((let _v : 'tv_value = 
# 262 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                              ( ListValue l )
# 929 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv398)) : 'freshtv400)) : 'freshtv402)) : 'freshtv404)) : 'freshtv406)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv407 * _menhir_state) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv408)) : 'freshtv410)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_object_field_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_object_field_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv377 * _menhir_state * 'tv_object_field) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv375 * _menhir_state * 'tv_object_field) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_object_field)), _, (xs : 'tv_list_object_field_)) = _menhir_stack in
        let _v : 'tv_list_object_field_ = 
# 187 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 955 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_list_object_field_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv376)) : 'freshtv378)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv391 * _menhir_state) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv387 * _menhir_state) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv385 * _menhir_state) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (fs : 'tv_list_object_field_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_object_value = 
# 281 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ( fs )
# 976 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv383) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_object_value) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv381) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_object_value) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv379) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((o : 'tv_object_value) : 'tv_object_value) = _v in
            ((let _v : 'tv_value = 
# 263 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                              ( ObjectValue o )
# 993 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)) : 'freshtv382)) : 'freshtv384)) : 'freshtv386)) : 'freshtv388)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv389 * _menhir_state) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv390)) : 'freshtv392)
    | _ ->
        _menhir_fail ()

and _menhir_goto_enum_value : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_enum_value -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState35 | MenhirState47 | MenhirState66 | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv363) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_enum_value) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv361) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((n : 'tv_enum_value) : 'tv_enum_value) = _v in
        ((let _v : 'tv_value = 
# 261 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                              ( EnumValue n )
# 1021 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv362)) : 'freshtv364)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv373 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_enum_value) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv371 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((v : 'tv_enum_value) : 'tv_enum_value) = _v in
        ((let (_menhir_stack, _menhir_s, (ds : 'tv_option_description_)) = _menhir_stack in
        let _v : 'tv_enum_value_transformation = 
# 137 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ({ description = ds; value = v })
# 1037 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv369) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_enum_value_transformation) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv367 * _menhir_state * 'tv_enum_value_transformation) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BLOCK_STRING _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState117 _v
        | STRING _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState117 _v
        | ENUM | INPUT | INTERFACE | MUTATION | NAME _ | QUERY | SCALAR | SCHEMA | SUBSCRIPTION | TRANSFORM | TYPE | UNION ->
            _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) MenhirState117
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv365 * _menhir_state * 'tv_enum_value_transformation) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_enum_value_transformation)) = _menhir_stack in
            let _v : 'tv_nonempty_list_enum_value_transformation_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 1062 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_nonempty_list_enum_value_transformation_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv366)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState117) : 'freshtv368)) : 'freshtv370)) : 'freshtv372)) : 'freshtv374)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_operation_type_definition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_operation_type_definition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv345 * _menhir_state * 'tv_operation_type_definition) * _menhir_state * 'tv_nonempty_list_operation_type_definition_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv343 * _menhir_state * 'tv_operation_type_definition) * _menhir_state * 'tv_nonempty_list_operation_type_definition_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_operation_type_definition)), _, (xs : 'tv_nonempty_list_operation_type_definition_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_operation_type_definition_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 1085 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_nonempty_list_operation_type_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv344)) : 'freshtv346)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv359 * _menhir_state))) * _menhir_state * 'tv_nonempty_list_operation_type_definition_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv355 * _menhir_state))) * _menhir_state * 'tv_nonempty_list_operation_type_definition_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv353 * _menhir_state))) * _menhir_state * 'tv_nonempty_list_operation_type_definition_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (ods : 'tv_nonempty_list_operation_type_definition_)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_schema_transformation = 
# 99 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ( ods )
# 1108 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv351) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_schema_transformation) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv349) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_schema_transformation) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((s : 'tv_schema_transformation) : 'tv_schema_transformation) = _v in
            ((let _v : 'tv_transformation = 
# 90 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                              ( SchemaTransformation s )
# 1125 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv348)) : 'freshtv350)) : 'freshtv352)) : 'freshtv354)) : 'freshtv356)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv357 * _menhir_state))) * _menhir_state * 'tv_nonempty_list_operation_type_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv358)) : 'freshtv360)
    | _ ->
        _menhir_fail ()

and _menhir_goto_field_selector : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_field_selector -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv341 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_field_selector) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_PAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv335) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BLOCK_STRING _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
        | STRING _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
        | ENUM | FALSE | INPUT | INTERFACE | MUTATION | NAME _ | NULL | QUERY | SCALAR | SCHEMA | SUBSCRIPTION | TRANSFORM | TRUE | TYPE | UNION ->
            _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) MenhirState32
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32) : 'freshtv336)
    | BLOCK_STRING _ | ENUM | FALSE | INPUT | INTERFACE | MUTATION | NAME _ | NULL | QUERY | R_BRACKET | SCALAR | SCHEMA | STRING _ | SUBSCRIPTION | TRANSFORM | TRUE | TYPE | UNION ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv337) = Obj.magic _menhir_stack in
        ((let _v : 'tv_option_arguments_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 1168 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_option_arguments_ _menhir_env _menhir_stack _v) : 'freshtv338)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_field_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv340)) : 'freshtv342)

and _menhir_reduce1 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_name -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (n : 'tv_name)) = _menhir_stack in
    let _v : 'tv_alias = 
# 86 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ( n )
# 1185 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv333) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_alias) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState146 | MenhirState143 | MenhirState140 | MenhirState138 | MenhirState135 | MenhirState133 | MenhirState110 | MenhirState103 | MenhirState100 | MenhirState98 | MenhirState23 | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv325 * _menhir_state * 'tv_alias) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv321 * _menhir_state * 'tv_alias) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ENUM ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | FALSE ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | INPUT ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | INTERFACE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | MUTATION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | NAME _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
            | NULL ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | QUERY ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | SCALAR ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | SCHEMA ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | SUBSCRIPTION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | TRANSFORM ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | TRUE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | TYPE ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | UNION ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv322)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv323 * _menhir_state * 'tv_alias) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv324)) : 'freshtv326)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv331 * _menhir_state * 'tv_alias) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv327 * _menhir_state * 'tv_alias) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | ENUM ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | FALSE ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | INPUT ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | INTERFACE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | MUTATION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | NAME _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState81 _v
            | NULL ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | QUERY ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | SCALAR ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | SCHEMA ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | SUBSCRIPTION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | TRANSFORM ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | TRUE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | TYPE ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | UNION ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState81
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81) : 'freshtv328)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv329 * _menhir_state * 'tv_alias) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv330)) : 'freshtv332)
    | _ ->
        _menhir_fail ()) : 'freshtv334)

and _menhir_goto_type_selector : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_selector -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv291 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv289 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (ts : 'tv_type_selector)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_union_type_transformation = 
# 200 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ({ description = None; selector = ts;})
# 1317 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_union_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv290)) : 'freshtv292)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv293 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | BLOCK_STRING _ | EOF | STRING _ | TRANSFORM ->
            _menhir_reduce77 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv294)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv297 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv295 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (ts : 'tv_type_selector)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_scalar_type_transformation = 
# 189 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ({ description = None; selector = ts;})
# 1345 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_scalar_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv296)) : 'freshtv298)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv299 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | BLOCK_STRING _ | EOF | STRING _ | TRANSFORM ->
            _menhir_reduce77 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101) : 'freshtv300)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv301 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | BLOCK_STRING _ | EOF | STRING _ | TRANSFORM ->
            _menhir_reduce79 _menhir_env (Obj.magic _menhir_stack) MenhirState104
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104) : 'freshtv302)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv303 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | BLOCK_STRING _ | EOF | STRING _ | TRANSFORM ->
            _menhir_reduce75 _menhir_env (Obj.magic _menhir_stack) MenhirState111
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState111) : 'freshtv304)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv307 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv305 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (desc : 'tv_description)), _, (ts : 'tv_type_selector)) = _menhir_stack in
        let _3 = () in
        let _2 = () in
        let _v : 'tv_union_type_transformation = 
# 205 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ({ description = Some desc; selector = ts;})
# 1401 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_union_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv306)) : 'freshtv308)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv309 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | BLOCK_STRING _ | EOF | STRING _ | TRANSFORM ->
            _menhir_reduce77 _menhir_env (Obj.magic _menhir_stack) MenhirState136
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState136) : 'freshtv310)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv313 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv311 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (desc : 'tv_description)), _, (ts : 'tv_type_selector)) = _menhir_stack in
        let _3 = () in
        let _2 = () in
        let _v : 'tv_scalar_type_transformation = 
# 194 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ({ description = Some desc; selector = ts;})
# 1429 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_scalar_type_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv312)) : 'freshtv314)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv315 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | BLOCK_STRING _ | EOF | STRING _ | TRANSFORM ->
            _menhir_reduce77 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141) : 'freshtv316)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv317 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run105 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | BLOCK_STRING _ | EOF | STRING _ | TRANSFORM ->
            _menhir_reduce79 _menhir_env (Obj.magic _menhir_stack) MenhirState144
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144) : 'freshtv318)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv319 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | BLOCK_STRING _ | EOF | STRING _ | TRANSFORM ->
            _menhir_reduce75 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147) : 'freshtv320)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_default_value_ : _menhir_env -> 'ttv_tail -> 'tv_option_default_value_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv287 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
    let (_v : 'tv_option_default_value_) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv285 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
    let ((v : 'tv_option_default_value_) : 'tv_option_default_value_) = _v in
    ((let ((_menhir_stack, _menhir_s, (desc : 'tv_option_description_)), _, (n : 'tv_name)) = _menhir_stack in
    let _v : 'tv_input_value = 
# 247 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ({ description = desc; name = n; value = v })
# 1489 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv283) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_input_value) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv281 * _menhir_state * 'tv_input_value) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | STRING _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | ENUM | FALSE | INPUT | INTERFACE | MUTATION | NAME _ | NULL | QUERY | SCALAR | SCHEMA | SUBSCRIPTION | TRANSFORM | TRUE | TYPE | UNION ->
        _menhir_reduce73 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | R_BRACKET | R_PAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279 * _menhir_state * 'tv_input_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_input_value)) = _menhir_stack in
        let _v : 'tv_nonempty_list_input_value_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 1514 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_nonempty_list_input_value_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv280)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv282)) : 'freshtv284)) : 'freshtv286)) : 'freshtv288)

and _menhir_reduce34 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_value_ = 
# 185 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [] )
# 1527 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_list_value_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv277) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_value = 
# 255 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                              ( BooleanValue true )
# 1541 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv278)

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv275) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_value = 
# 260 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                              ( NullValue )
# 1555 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv276)

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | ENUM ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | FALSE ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | FLOAT _v ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | INPUT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | INT _v ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | INTERFACE ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | L_BRACKET ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | L_SQ_BRACKET ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | MUTATION ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | NAME _v ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | NULL ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | QUERY ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | SCALAR ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | SCHEMA ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | STRING _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | SUBSCRIPTION ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | TRANSFORM ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | TRUE ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | TYPE ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | UNION ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | R_SQ_BRACKET ->
        _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ENUM ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | FALSE ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | INPUT ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | INTERFACE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | MUTATION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | NAME _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | NULL ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | QUERY ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | SCALAR ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | SCHEMA ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | SUBSCRIPTION ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | TRANSFORM ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | TRUE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | TYPE ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | UNION ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | R_BRACKET ->
        _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 30 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 1660 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv273) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 30 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 1670 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) : (
# 30 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 1674 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) = _v in
    ((let _v : 'tv_value = 
# 257 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                              ( IntValue (Int32.of_string i) )
# 1679 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)

and _menhir_run55 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 31 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 1686 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv271) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((f : (
# 31 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 1696 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) : (
# 31 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 1700 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) = _v in
    ((let _v : 'tv_value = 
# 258 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                              ( FloatValue f )
# 1705 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv272)

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv269) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_value = 
# 256 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                              ( BooleanValue false )
# 1719 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv270)

and _menhir_reduce32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_object_field_ = 
# 185 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [] )
# 1728 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_list_object_field_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv267) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 79 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "union" )
# 1742 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv265) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 75 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "type" )
# 1756 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv266)

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv263) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 71 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "transform" )
# 1770 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv264)

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv261) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 74 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "subscription" )
# 1784 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv262)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv259) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 70 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "schema" )
# 1798 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv260)

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv257) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 80 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "scalar" )
# 1812 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv258)

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv255) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 72 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "query" )
# 1826 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv256)

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 27 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 1833 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv253) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((n : (
# 27 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 1843 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) : (
# 27 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 1847 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) = _v in
    ((let _v : 'tv_enum_value = 
# 81 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( n )
# 1852 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv254)

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv251) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 73 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "mutation" )
# 1866 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv252)

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv249) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 78 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "interface" )
# 1880 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv250)

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv247) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 77 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "input" )
# 1894 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv248)

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv245) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 76 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "enum" )
# 1908 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv246)

and _menhir_goto_operation_type_definition : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_operation_type_definition -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv243 * _menhir_state * 'tv_operation_type_definition) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | MUTATION ->
        _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState94
    | QUERY ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState94
    | SUBSCRIPTION ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState94
    | R_BRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv241 * _menhir_state * 'tv_operation_type_definition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_operation_type_definition)) = _menhir_stack in
        let _v : 'tv_nonempty_list_operation_type_definition_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 1933 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_nonempty_list_operation_type_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv242)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv244)

and _menhir_goto_name : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState146 | MenhirState143 | MenhirState140 | MenhirState138 | MenhirState135 | MenhirState133 | MenhirState110 | MenhirState103 | MenhirState100 | MenhirState98 | MenhirState23 | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv211 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BLOCK_STRING _ | EOF | L_BRACKET | STRING _ | TRANSFORM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv207 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (n : 'tv_name)) = _menhir_stack in
            let _v : 'tv_type_selector = 
# 210 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ( {name = n; alias = None} )
# 1958 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_type_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv208)
        | COLON ->
            _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv209 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)) : 'freshtv212)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv215 * _menhir_state * 'tv_alias)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv213 * _menhir_state * 'tv_alias)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (a : 'tv_alias)), _, (n : 'tv_name)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_type_selector = 
# 214 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ({alias = Some a; name = n})
# 1980 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_type_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv214)) : 'freshtv216)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BLOCK_STRING _ | ENUM | FALSE | INPUT | INTERFACE | L_PAREN | MUTATION | NAME _ | NULL | QUERY | R_BRACKET | SCALAR | SCHEMA | STRING _ | SUBSCRIPTION | TRANSFORM | TRUE | TYPE | UNION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv217 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (n : 'tv_name)) = _menhir_stack in
            let _v : 'tv_field_selector = 
# 231 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ( {name = n; alias = None} )
# 1996 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_field_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv218)
        | COLON ->
            _menhir_reduce1 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv219 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)) : 'freshtv222)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv229 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUAL ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv223) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BLOCK_STRING _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | ENUM ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | FALSE ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | FLOAT _v ->
                _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | INPUT ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | INT _v ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | INTERFACE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | L_BRACKET ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | L_SQ_BRACKET ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | MUTATION ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | NAME _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | NULL ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | QUERY ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | SCALAR ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | SCHEMA ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | STRING _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | SUBSCRIPTION ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | TRANSFORM ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | TRUE ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | TYPE ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | UNION ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35) : 'freshtv224)
        | BLOCK_STRING _ | ENUM | FALSE | INPUT | INTERFACE | MUTATION | NAME _ | NULL | QUERY | R_BRACKET | R_PAREN | SCALAR | SCHEMA | STRING _ | SUBSCRIPTION | TRANSFORM | TRUE | TYPE | UNION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv225) = Obj.magic _menhir_stack in
            ((let _v : 'tv_option_default_value_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 2072 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_option_default_value_ _menhir_env _menhir_stack _v) : 'freshtv226)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv227 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)) : 'freshtv230)
    | MenhirState48 | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv235 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv231 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BLOCK_STRING _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | ENUM ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | FALSE ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | FLOAT _v ->
                _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | INPUT ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | INT _v ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | INTERFACE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | L_BRACKET ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | L_SQ_BRACKET ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | MUTATION ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | NAME _v ->
                _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | NULL ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | QUERY ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | SCALAR ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | SCHEMA ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | STRING _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | SUBSCRIPTION ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | TRANSFORM ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | TRUE ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | TYPE ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | UNION ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51) : 'freshtv232)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv233 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)) : 'freshtv236)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv239 * _menhir_state * 'tv_alias)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv237 * _menhir_state * 'tv_alias)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (a : 'tv_alias)), _, (n : 'tv_name)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_field_selector = 
# 235 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ({alias = Some a; name = n})
# 2157 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_field_selector _menhir_env _menhir_stack _menhir_s _v) : 'freshtv238)) : 'freshtv240)
    | _ ->
        _menhir_fail ()

and _menhir_goto_value : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_value -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv193 * _menhir_state * 'tv_name)) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv191 * _menhir_state * 'tv_name)) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (n : 'tv_name)), _, (v : 'tv_value)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_object_field = 
# 287 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ({name = n; value = v})
# 2177 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv189) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_object_field) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv187 * _menhir_state * 'tv_object_field) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ENUM ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | FALSE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | INPUT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | INTERFACE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | MUTATION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | NAME _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | NULL ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | QUERY ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | SCALAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | SCHEMA ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | SUBSCRIPTION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | TRANSFORM ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | TRUE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | TYPE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | UNION ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | R_BRACKET ->
            _menhir_reduce32 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv188)) : 'freshtv190)) : 'freshtv192)) : 'freshtv194)
    | MenhirState66 | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv195 * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BLOCK_STRING _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | ENUM ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | FALSE ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | FLOAT _v ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | INPUT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | INT _v ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | INTERFACE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | L_BRACKET ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | L_SQ_BRACKET ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MUTATION ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | NAME _v ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | NULL ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | QUERY ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | SCALAR ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | SCHEMA ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | STRING _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | SUBSCRIPTION ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | TRANSFORM ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | TRUE ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | TYPE ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | UNION ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | R_SQ_BRACKET ->
            _menhir_reduce34 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66) : 'freshtv196)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv205) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv203) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _, (v : 'tv_value)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_default_value = 
# 252 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ( v )
# 2289 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201) = _menhir_stack in
        let (_v : 'tv_default_value) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv199) = Obj.magic _menhir_stack in
        let (_v : 'tv_default_value) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv197) = Obj.magic _menhir_stack in
        let ((x : 'tv_default_value) : 'tv_default_value) = _v in
        ((let _v : 'tv_option_default_value_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 2303 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_option_default_value_ _menhir_env _menhir_stack _v) : 'freshtv198)) : 'freshtv200)) : 'freshtv202)) : 'freshtv204)) : 'freshtv206)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_option_description_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_description_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState85 | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv181 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ENUM ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | FALSE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | INPUT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | INTERFACE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | MUTATION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | NAME _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
        | NULL ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | QUERY ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | SCALAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | SCHEMA ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | SUBSCRIPTION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | TRANSFORM ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | TRUE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | TYPE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | UNION ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState29
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29) : 'freshtv182)
    | MenhirState105 | MenhirState75 | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv183 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ENUM ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | FALSE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | INPUT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | INTERFACE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | MUTATION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | NAME _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | NULL ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | QUERY ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | SCALAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | SCHEMA ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | SUBSCRIPTION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | TRANSFORM ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | TRUE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | TYPE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | UNION ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33) : 'freshtv184)
    | MenhirState117 | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv185 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ENUM ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | INPUT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | INTERFACE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | MUTATION ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | NAME _v ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState113 _v
        | QUERY ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | SCALAR ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | SCHEMA ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | SUBSCRIPTION ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | TRANSFORM ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | TYPE ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | UNION ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState113
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState113) : 'freshtv186)
    | _ ->
        _menhir_fail ()

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv179) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_operation_type_definition = 
# 104 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( Subscription)
# 2445 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_operation_type_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv180)

and _menhir_run92 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv177) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_operation_type_definition = 
# 102 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( Query )
# 2459 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_operation_type_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv178)

and _menhir_run93 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv175) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_operation_type_definition = 
# 103 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( Mutation )
# 2473 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_operation_type_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv176)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv173) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 64 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "union" )
# 2487 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv174)

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv171) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 60 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "type" )
# 2501 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv172)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv169) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 52 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "true" )
# 2515 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv170)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv167) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 55 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "transform" )
# 2529 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv168)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv165) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 59 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "subscription" )
# 2543 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv166)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv163) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 56 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "schema" )
# 2557 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv164)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv161) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 65 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "scalar" )
# 2571 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv162)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv159) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 57 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "query" )
# 2585 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv160)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv157) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 54 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "null" )
# 2599 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv158)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 27 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 2606 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv155) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((n : (
# 27 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 2616 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) : (
# 27 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 2620 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) = _v in
    ((let _v : 'tv_name = 
# 66 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( n )
# 2625 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv156)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv153) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 58 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "mutation" )
# 2639 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv154)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv151) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 63 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "interface" )
# 2653 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv152)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv149) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 62 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "input" )
# 2667 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv150)

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv147) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 53 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "false" )
# 2681 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv148)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv145) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 61 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                  ( "enum" )
# 2695 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv146)

and _menhir_goto_string_value : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_string_value -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState0 | MenhirState123 | MenhirState117 | MenhirState112 | MenhirState105 | MenhirState85 | MenhirState75 | MenhirState32 | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_string_value) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((s : 'tv_string_value) : 'tv_string_value) = _v in
        ((let _v : 'tv_description = 
# 291 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
  ( s )
# 2714 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_description) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState112 | MenhirState117 | MenhirState105 | MenhirState25 | MenhirState85 | MenhirState32 | MenhirState75 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv113 * _menhir_state * 'tv_description) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv111 * _menhir_state * 'tv_description) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_description)) = _menhir_stack in
            let _v : 'tv_option_description_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 2731 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
             in
            _menhir_goto_option_description_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)) : 'freshtv114)
        | MenhirState0 | MenhirState123 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv133 * _menhir_state * 'tv_description) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | TRANSFORM ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv129 * _menhir_state * 'tv_description) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ENUM ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv115 * _menhir_state * 'tv_description)) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | ENUM ->
                        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | FALSE ->
                        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | INPUT ->
                        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | INTERFACE ->
                        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | MUTATION ->
                        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | NAME _v ->
                        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
                    | NULL ->
                        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | QUERY ->
                        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | SCALAR ->
                        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | SCHEMA ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | SUBSCRIPTION ->
                        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | TRANSFORM ->
                        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | TRUE ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | TYPE ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | UNION ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState146
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146) : 'freshtv116)
                | INPUT ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv117 * _menhir_state * 'tv_description)) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | ENUM ->
                        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | FALSE ->
                        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | INPUT ->
                        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | INTERFACE ->
                        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | MUTATION ->
                        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | NAME _v ->
                        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState143 _v
                    | NULL ->
                        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | QUERY ->
                        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | SCALAR ->
                        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | SCHEMA ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | SUBSCRIPTION ->
                        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | TRANSFORM ->
                        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | TRUE ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | TYPE ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | UNION ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState143
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143) : 'freshtv118)
                | INTERFACE ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv119 * _menhir_state * 'tv_description)) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | ENUM ->
                        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | FALSE ->
                        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | INPUT ->
                        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | INTERFACE ->
                        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | MUTATION ->
                        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | NAME _v ->
                        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState140 _v
                    | NULL ->
                        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | QUERY ->
                        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | SCALAR ->
                        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | SCHEMA ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | SUBSCRIPTION ->
                        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | TRANSFORM ->
                        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | TRUE ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | TYPE ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | UNION ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState140
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState140) : 'freshtv120)
                | SCALAR ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv121 * _menhir_state * 'tv_description)) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | ENUM ->
                        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | FALSE ->
                        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | INPUT ->
                        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | INTERFACE ->
                        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | MUTATION ->
                        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | NAME _v ->
                        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState138 _v
                    | NULL ->
                        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | QUERY ->
                        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | SCALAR ->
                        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | SCHEMA ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | SUBSCRIPTION ->
                        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | TRANSFORM ->
                        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | TRUE ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | TYPE ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | UNION ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState138
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState138) : 'freshtv122)
                | TYPE ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv123 * _menhir_state * 'tv_description)) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | ENUM ->
                        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | FALSE ->
                        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | INPUT ->
                        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | INTERFACE ->
                        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | MUTATION ->
                        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | NAME _v ->
                        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState135 _v
                    | NULL ->
                        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | QUERY ->
                        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | SCALAR ->
                        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | SCHEMA ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | SUBSCRIPTION ->
                        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | TRANSFORM ->
                        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | TRUE ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | TYPE ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | UNION ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState135
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135) : 'freshtv124)
                | UNION ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv125 * _menhir_state * 'tv_description)) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | ENUM ->
                        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | FALSE ->
                        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | INPUT ->
                        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | INTERFACE ->
                        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | MUTATION ->
                        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | NAME _v ->
                        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
                    | NULL ->
                        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | QUERY ->
                        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | SCALAR ->
                        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | SCHEMA ->
                        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | SUBSCRIPTION ->
                        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | TRANSFORM ->
                        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | TRUE ->
                        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | TYPE ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | UNION ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState133
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133) : 'freshtv126)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv127 * _menhir_state * 'tv_description)) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)) : 'freshtv130)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv131 * _menhir_state * 'tv_description) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)) : 'freshtv134)
        | _ ->
            _menhir_fail ()) : 'freshtv136)) : 'freshtv138)) : 'freshtv140)
    | MenhirState35 | MenhirState47 | MenhirState66 | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv143) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_string_value) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv141) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((s : 'tv_string_value) : 'tv_string_value) = _v in
        ((let _v : 'tv_value = 
# 259 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
                                              ( StringValue s )
# 3014 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
         in
        _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv142)) : 'freshtv144)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv27 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState146 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv29 * _menhir_state * 'tv_description))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState144 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv31 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState143 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv33 * _menhir_state * 'tv_description))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState141 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv35 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState140 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv37 * _menhir_state * 'tv_description))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState138 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv39 * _menhir_state * 'tv_description))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState136 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv41 * _menhir_state * 'tv_description))) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState135 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv43 * _menhir_state * 'tv_description))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState133 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv45 * _menhir_state * 'tv_description))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState123 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state * 'tv_transformation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState117 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state * 'tv_enum_value_transformation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState113 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv51 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState112 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState111 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv55 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv57 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv59 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState104 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv61 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv65 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState98 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv69 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv71 * _menhir_state * 'tv_operation_type_definition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState90 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv73 * _menhir_state))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState85 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75 * _menhir_state * 'tv_field_transformation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState81 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv77 * _menhir_state * 'tv_alias)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv79 * _menhir_state * 'tv_input_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState66 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState51 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state * 'tv_name)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state * 'tv_object_field) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState48 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv87 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState47 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv89 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv92)
    | MenhirState33 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState32 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv96)
    | MenhirState29 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState25 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv101 * _menhir_state)) * _menhir_state * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv105 * _menhir_state * 'tv_alias)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv107 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv110)

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ENUM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ENUM ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | FALSE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | INPUT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | INTERFACE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | MUTATION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | NAME _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState110 _v
        | NULL ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | QUERY ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | SCALAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | SCHEMA ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | SUBSCRIPTION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | TRANSFORM ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | TRUE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | TYPE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | UNION ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv8)
    | INPUT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ENUM ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | FALSE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | INPUT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | INTERFACE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | MUTATION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | NAME _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
        | NULL ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | QUERY ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | SCALAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | SCHEMA ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | SUBSCRIPTION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | TRANSFORM ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | TRUE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | TYPE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | UNION ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103) : 'freshtv10)
    | INTERFACE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ENUM ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | FALSE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | INPUT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | INTERFACE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | MUTATION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | NAME _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | NULL ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | QUERY ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | SCALAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | SCHEMA ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | SUBSCRIPTION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TRANSFORM ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TRUE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TYPE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | UNION ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100) : 'freshtv12)
    | SCALAR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ENUM ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | FALSE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | INPUT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | INTERFACE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | MUTATION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | NAME _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
        | NULL ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | QUERY ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | SCALAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | SCHEMA ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | SUBSCRIPTION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | TRANSFORM ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | TRUE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | TYPE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | UNION ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98) : 'freshtv14)
    | SCHEMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv15 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | MUTATION ->
                _menhir_run93 _menhir_env (Obj.magic _menhir_stack) MenhirState90
            | QUERY ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState90
            | SUBSCRIPTION ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState90
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState90) : 'freshtv16)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv17 * _menhir_state)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)) : 'freshtv20)
    | TYPE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ENUM ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | FALSE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | INPUT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | INTERFACE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | MUTATION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | NAME _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | NULL ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | QUERY ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | SCALAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | SCHEMA ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | SUBSCRIPTION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | TRANSFORM ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | TRUE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | TYPE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | UNION ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23) : 'freshtv22)
    | UNION ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv23 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ENUM ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | FALSE ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | INPUT ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | INTERFACE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | MUTATION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | NAME _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | NULL ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | QUERY ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | SCALAR ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | SCHEMA ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | SUBSCRIPTION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | TRANSFORM ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | TRUE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | TYPE ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | UNION ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2) : 'freshtv24)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv25 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 28 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 3517 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : (
# 28 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 3527 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) : (
# 28 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 3531 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) = _v in
    ((let _v : 'tv_string_value = 
# 267 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ( StringValue s )
# 3536 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_string_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv6)

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 29 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 3543 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((b : (
# 29 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 3553 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) : (
# 29 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (string)
# 3557 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
    )) = _v in
    ((let _v : 'tv_string_value = 
# 269 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
    ( BlockStringValue b )
# 3562 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
     in
    _menhir_goto_string_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and document : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 41 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.mly"
       (Trans_ast.document)
# 3581 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | STRING _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | TRANSFORM ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 219 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
  


# 3615 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/trans_parser.ml"
