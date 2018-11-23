
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | STRING of (
# 12 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
  )
    | R_SQ_BRACKET
    | R_PAREN
    | R_BRACKET
    | NULL
    | NAME of (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 20 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
  )
    | L_SQ_BRACKET
    | L_PAREN
    | L_BRACKET
    | INT of (
# 13 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 28 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
  )
    | FLOAT of (
# 14 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 33 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
  )
    | EOF
    | COLON
    | BOOL of (
# 10 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (bool)
# 40 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
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
  | MenhirState39
  | MenhirState31
  | MenhirState27
  | MenhirState24
  | MenhirState21
  | MenhirState14
  | MenhirState11
  | MenhirState4
  | MenhirState0

# 16 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
  
    open Schema_ast

# 72 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"

let rec _menhir_goto_list_content : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_content -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv163 * _menhir_state * 'tv_value) * _menhir_state * 'tv_list_content) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state * 'tv_value) * _menhir_state * 'tv_list_content) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (l : 'tv_value)), _, (ls : 'tv_list_content)) = _menhir_stack in
        let _v : 'tv_list_content = 
# 104 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( l::ls )
# 87 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
         in
        _menhir_goto_list_content _menhir_env _menhir_stack _menhir_s _v) : 'freshtv162)) : 'freshtv164)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv177 * _menhir_state) * _menhir_state * 'tv_list_content) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_SQ_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv173 * _menhir_state) * _menhir_state * 'tv_list_content) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv171 * _menhir_state) * _menhir_state * 'tv_list_content) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (ls : 'tv_list_content)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_list_value = 
# 98 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( ls )
# 108 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv169) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_list_value) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv167) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_list_value) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv165) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((l : 'tv_list_value) : 'tv_list_value) = _v in
            ((let _v : 'tv_value = 
# 92 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
                   ( List l )
# 125 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
             in
            _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv166)) : 'freshtv168)) : 'freshtv170)) : 'freshtv172)) : 'freshtv174)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv175 * _menhir_state) * _menhir_state * 'tv_list_content) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)) : 'freshtv178)
    | _ ->
        _menhir_fail ()

and _menhir_goto_arg_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_arg_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv155) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv151) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv149) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, (ars : 'tv_arg_list)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_args = 
# 71 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( ars )
# 160 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
             in
            _menhir_goto_args _menhir_env _menhir_stack _v) : 'freshtv150)) : 'freshtv152)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv153) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)) : 'freshtv156)
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv159 * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv157 * _menhir_state * 'tv_arg) * _menhir_state * 'tv_arg_list) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (a : 'tv_arg)), _, (ars : 'tv_arg_list)) = _menhir_stack in
        let _v : 'tv_arg_list = 
# 78 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( a::ars )
# 179 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
         in
        _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv158)) : 'freshtv160)
    | _ ->
        _menhir_fail ()

and _menhir_goto_fields : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_fields -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv143 * _menhir_state * 'tv_docs) * 'tv_type_selector)) * _menhir_state * 'tv_fields) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv139 * _menhir_state * 'tv_docs) * 'tv_type_selector)) * _menhir_state * 'tv_fields) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv137 * _menhir_state * 'tv_docs) * 'tv_type_selector)) * _menhir_state * 'tv_fields) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (ds : 'tv_docs)), (sel : 'tv_type_selector)), _, (fs : 'tv_fields)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _v : 'tv_transformation = 
# 35 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( { tpe = sel; fields = fs; doc = ds  } )
# 207 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
             in
            _menhir_goto_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv138)) : 'freshtv140)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv141 * _menhir_state * 'tv_docs) * 'tv_type_selector)) * _menhir_state * 'tv_fields) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)) : 'freshtv144)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv147 * _menhir_state * 'tv_field) * _menhir_state * 'tv_fields) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv145 * _menhir_state * 'tv_field) * _menhir_state * 'tv_fields) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (f : 'tv_field)), _, (fs : 'tv_fields)) = _menhir_stack in
        let _v : 'tv_fields = 
# 52 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( f::fs )
# 226 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
         in
        _menhir_goto_fields _menhir_env _menhir_stack _menhir_s _v) : 'freshtv146)) : 'freshtv148)
    | _ ->
        _menhir_fail ()

and _menhir_reduce13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_content = 
# 101 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( [] )
# 237 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
     in
    _menhir_goto_list_content _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_value : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_value -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState31 | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BOOL _v ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | FLOAT _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | INT _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | L_SQ_BRACKET ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | NULL ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | STRING _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | R_SQ_BRACKET ->
            _menhir_reduce13 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv126)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv135 * _menhir_state * 'tv_docs) * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 274 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
        ))) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv133 * _menhir_state * 'tv_docs) * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 280 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
        ))) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (ds : 'tv_docs)), (n : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 285 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
        ))), _, (v : 'tv_value)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_arg = 
# 84 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
     ( { name = n; value = v; doc = ds } )
# 291 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_arg) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv129 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | NAME _ ->
            _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | R_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv127 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (a : 'tv_arg)) = _menhir_stack in
            let _v : 'tv_arg_list = 
# 75 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    (a::[])
# 314 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
             in
            _menhir_goto_arg_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv128)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39) : 'freshtv130)) : 'freshtv132)) : 'freshtv134)) : 'freshtv136)
    | _ ->
        _menhir_fail ()

and _menhir_goto_args : _menhir_env -> 'ttv_tail -> 'tv_args -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv123 * _menhir_state * 'tv_docs) * 'tv_field_selector) = Obj.magic _menhir_stack in
    let (_v : 'tv_args) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv121 * _menhir_state * 'tv_docs) * 'tv_field_selector) = Obj.magic _menhir_stack in
    let ((ars : 'tv_args) : 'tv_args) = _v in
    ((let ((_menhir_stack, _menhir_s, (ds : 'tv_docs)), (selector : 'tv_field_selector)) = _menhir_stack in
    let _v : 'tv_field = 
# 58 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( { field = selector; args= ars; doc = ds } )
# 336 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv119) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_field) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv117 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
    | R_BRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv115 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (f : 'tv_field)) = _menhir_stack in
        let _v : 'tv_fields = 
# 49 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( f::[] )
# 357 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
         in
        _menhir_goto_fields _menhir_env _menhir_stack _menhir_s _v) : 'freshtv116)
    | NAME _ ->
        _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) MenhirState14
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14) : 'freshtv118)) : 'freshtv120)) : 'freshtv122)) : 'freshtv124)

and _menhir_goto_transformation : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_transformation -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv113 * _menhir_state * 'tv_transformation) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | EOF ->
        _menhir_reduce19 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | NAME _ ->
        _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4) : 'freshtv114)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 394 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv111) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : (
# 12 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 404 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
    )) : (
# 12 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 408 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
    )) = _v in
    ((let _v : 'tv_value = 
# 88 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
               ( String s )
# 413 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv112)

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_value = 
# 91 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
         ( Null )
# 427 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL _v ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | FLOAT _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | INT _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | L_SQ_BRACKET ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | NULL ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | STRING _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | R_SQ_BRACKET ->
        _menhir_reduce13 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 459 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv107) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 13 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 469 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
    )) : (
# 13 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 473 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
    )) = _v in
    ((let _v : 'tv_value = 
# 90 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
            ( Int (Int32.of_string i) )
# 478 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 14 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 485 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv105) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((f : (
# 14 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 495 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
    )) : (
# 14 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 499 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
    )) = _v in
    ((let _v : 'tv_value = 
# 89 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
              ( Float f )
# 504 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv106)

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 10 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (bool)
# 511 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv103) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((b : (
# 10 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (bool)
# 521 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
    )) : (
# 10 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (bool)
# 525 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
    )) = _v in
    ((let _v : 'tv_value = 
# 87 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
             ( Bool b )
# 530 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv104)

and _menhir_goto_field_selector : _menhir_env -> 'ttv_tail -> 'tv_field_selector -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv101 * _menhir_state * 'tv_docs) * 'tv_field_selector) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_PAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | NAME _ ->
            _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv96)
    | NAME _ | R_BRACKET | STRING _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97) = Obj.magic _menhir_stack in
        ((let _v : 'tv_args = 
# 67 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ([])
# 562 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
         in
        _menhir_goto_args _menhir_env _menhir_stack _v) : 'freshtv98)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv99 * _menhir_state * 'tv_docs) * 'tv_field_selector) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)) : 'freshtv102)

and _menhir_goto_type_selector : _menhir_env -> 'ttv_tail -> 'tv_type_selector -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv93 * _menhir_state * 'tv_docs) * 'tv_type_selector) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_BRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv87 * _menhir_state * 'tv_docs) * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | NAME _ ->
            _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11) : 'freshtv88)
    | EOF | NAME _ | STRING _ ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state * 'tv_docs) * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (ds : 'tv_docs)), (sel : 'tv_type_selector)) = _menhir_stack in
        let _v : 'tv_transformation = 
# 38 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( { tpe = sel; fields = []; doc = ds } )
# 602 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
         in
        _menhir_goto_transformation _menhir_env _menhir_stack _menhir_s _v) : 'freshtv90)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv91 * _menhir_state * 'tv_docs) * 'tv_type_selector) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)) : 'freshtv94)

and _menhir_goto_transformations : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_transformations -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv81 * _menhir_state * 'tv_transformations) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv77 * _menhir_state * 'tv_transformations) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv75 * _menhir_state * 'tv_transformations) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (ts : 'tv_transformations)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 20 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (Schema_ast.program)
# 633 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
            ) = 
# 23 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
                                  ( { transformations = ts } )
# 637 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv73) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 20 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (Schema_ast.program)
# 645 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv71) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 20 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (Schema_ast.program)
# 653 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv69) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 20 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (Schema_ast.program)
# 661 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
            )) : (
# 20 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (Schema_ast.program)
# 665 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv70)) : 'freshtv72)) : 'freshtv74)) : 'freshtv76)) : 'freshtv78)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv79 * _menhir_state * 'tv_transformations) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)) : 'freshtv82)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv85 * _menhir_state * 'tv_transformation) * _menhir_state * 'tv_transformations) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state * 'tv_transformation) * _menhir_state * 'tv_transformations) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (t : 'tv_transformation)), _, (ts : 'tv_transformations)) = _menhir_stack in
        let _v : 'tv_transformations = 
# 27 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
                                                ( t::ts )
# 684 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
         in
        _menhir_goto_transformations _menhir_env _menhir_stack _menhir_s _v) : 'freshtv84)) : 'freshtv86)
    | _ ->
        _menhir_fail ()

and _menhir_goto_docs : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_docs -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state * 'tv_docs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAME _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv35) = Obj.magic _menhir_stack in
            let (_v : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 706 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv29 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 717 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAME _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv25 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 727 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    let (_v : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 732 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv23 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 739 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    let ((n : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 744 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    )) : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 748 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, (alias : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 753 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    ))) = _menhir_stack in
                    let _2 = () in
                    let _v : 'tv_type_selector = 
# 45 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( { name = n; alias = Some alias } )
# 759 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                     in
                    _menhir_goto_type_selector _menhir_env _menhir_stack _v) : 'freshtv24)) : 'freshtv26)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv27 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 769 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    (raise _eRR : 'freshtv28)) : 'freshtv30)
            | EOF | L_BRACKET | NAME _ | STRING _ ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv31 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 777 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, (n : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 782 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                ))) = _menhir_stack in
                let _v : 'tv_type_selector = 
# 43 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( { name = n; alias = None } )
# 787 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                 in
                _menhir_goto_type_selector _menhir_env _menhir_stack _v) : 'freshtv32)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv33 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 797 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                )) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv34)) : 'freshtv36)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv37 * _menhir_state * 'tv_docs) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)) : 'freshtv40)
    | MenhirState11 | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state * 'tv_docs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAME _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv53) = Obj.magic _menhir_stack in
            let (_v : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 819 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv47 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 830 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | NAME _v ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv43 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 840 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    let (_v : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 845 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    )) = _v in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv41 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 852 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    let ((n : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 857 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    )) : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 861 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    )) = _v in
                    ((let (_menhir_stack, (a : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 866 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    ))) = _menhir_stack in
                    let _2 = () in
                    let _v : 'tv_field_selector = 
# 64 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
   ( { name = n; alias = Some a } )
# 872 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                     in
                    _menhir_goto_field_selector _menhir_env _menhir_stack _v) : 'freshtv42)) : 'freshtv44)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : ('freshtv45 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 882 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                    ))) = Obj.magic _menhir_stack in
                    (raise _eRR : 'freshtv46)) : 'freshtv48)
            | L_PAREN | NAME _ | R_BRACKET | STRING _ ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv49 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 890 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, (n : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 895 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                ))) = _menhir_stack in
                let _v : 'tv_field_selector = 
# 62 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
   ( { name = n; alias = None } )
# 900 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                 in
                _menhir_goto_field_selector _menhir_env _menhir_stack _v) : 'freshtv50)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv51 * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 910 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                )) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv52)) : 'freshtv54)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv55 * _menhir_state * 'tv_docs) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)) : 'freshtv58)
    | MenhirState39 | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv67 * _menhir_state * 'tv_docs) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | NAME _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv63 * _menhir_state * 'tv_docs) = Obj.magic _menhir_stack in
            let (_v : (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 932 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | COLON ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv59 * _menhir_state * 'tv_docs) * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 943 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | BOOL _v ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
                | FLOAT _v ->
                    _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
                | INT _v ->
                    _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
                | L_SQ_BRACKET ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState24
                | NULL ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState24
                | STRING _v ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24) : 'freshtv60)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv61 * _menhir_state * 'tv_docs) * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 971 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)) : 'freshtv64)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv65 * _menhir_state * 'tv_docs) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)) : 'freshtv68)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState39 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5 * _menhir_state * 'tv_arg) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv6)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7 * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv8)
    | MenhirState27 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv10)
    | MenhirState24 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv11 * _menhir_state * 'tv_docs) * (
# 11 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 1008 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv14)
    | MenhirState14 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state * 'tv_field) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)
    | MenhirState11 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv17 * _menhir_state * 'tv_docs) * 'tv_type_selector)) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state * 'tv_transformation) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv22)

and _menhir_reduce6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_docs = 
# 108 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( None )
# 1041 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
     in
    _menhir_goto_docs _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_transformations = 
# 26 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
                                                ( [] )
# 1050 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
     in
    _menhir_goto_transformations _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 1057 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : (
# 12 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 1067 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
    )) : (
# 12 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (string)
# 1071 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
    )) = _v in
    ((let _v : 'tv_docs = 
# 110 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
    ( Some s )
# 1076 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
     in
    _menhir_goto_docs _menhir_env _menhir_stack _menhir_s _v) : 'freshtv4)

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

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 20 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.mly"
       (Schema_ast.program)
# 1095 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
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
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | EOF ->
        _menhir_reduce19 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NAME _ ->
        _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 219 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
  


# 1129 "/Users/budde/git/mitoai/graphql-transformer/src/schema/schema_parser.ml"
