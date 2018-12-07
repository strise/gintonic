
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | UNION
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
    | STRING of (
# 57 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 25 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
  )
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
    | NAME of (
# 56 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 42 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
  )
    | L_SQ_BRACKET
    | L_PAREN
    | L_BRACKET
    | INTERFACE
    | INT of (
# 59 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 51 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
  )
    | INPUT
    | IMPLEMENTS
    | FRAGMENT
    | FLOAT of (
# 60 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 59 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
  )
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
    | BLOCK_STRING of (
# 58 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 80 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
  )
    | AT
    | AMPERSAND
  
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
  | MenhirState441
  | MenhirState423
  | MenhirState422
  | MenhirState416
  | MenhirState415
  | MenhirState414
  | MenhirState413
  | MenhirState411
  | MenhirState408
  | MenhirState386
  | MenhirState384
  | MenhirState382
  | MenhirState381
  | MenhirState378
  | MenhirState377
  | MenhirState376
  | MenhirState374
  | MenhirState373
  | MenhirState372
  | MenhirState370
  | MenhirState369
  | MenhirState368
  | MenhirState366
  | MenhirState365
  | MenhirState362
  | MenhirState361
  | MenhirState360
  | MenhirState359
  | MenhirState356
  | MenhirState355
  | MenhirState354
  | MenhirState339
  | MenhirState336
  | MenhirState332
  | MenhirState331
  | MenhirState330
  | MenhirState329
  | MenhirState328
  | MenhirState325
  | MenhirState321
  | MenhirState320
  | MenhirState319
  | MenhirState316
  | MenhirState314
  | MenhirState313
  | MenhirState311
  | MenhirState310
  | MenhirState307
  | MenhirState303
  | MenhirState302
  | MenhirState300
  | MenhirState297
  | MenhirState293
  | MenhirState291
  | MenhirState288
  | MenhirState284
  | MenhirState279
  | MenhirState278
  | MenhirState274
  | MenhirState269
  | MenhirState267
  | MenhirState266
  | MenhirState258
  | MenhirState257
  | MenhirState255
  | MenhirState254
  | MenhirState253
  | MenhirState252
  | MenhirState250
  | MenhirState249
  | MenhirState248
  | MenhirState245
  | MenhirState241
  | MenhirState239
  | MenhirState238
  | MenhirState237
  | MenhirState236
  | MenhirState233
  | MenhirState232
  | MenhirState231
  | MenhirState230
  | MenhirState223
  | MenhirState222
  | MenhirState219
  | MenhirState218
  | MenhirState217
  | MenhirState216
  | MenhirState215
  | MenhirState213
  | MenhirState211
  | MenhirState209
  | MenhirState205
  | MenhirState201
  | MenhirState196
  | MenhirState185
  | MenhirState181
  | MenhirState179
  | MenhirState178
  | MenhirState177
  | MenhirState174
  | MenhirState170
  | MenhirState169
  | MenhirState168
  | MenhirState167
  | MenhirState147
  | MenhirState127
  | MenhirState126
  | MenhirState124
  | MenhirState116
  | MenhirState114
  | MenhirState110
  | MenhirState105
  | MenhirState100
  | MenhirState73
  | MenhirState71
  | MenhirState70
  | MenhirState69
  | MenhirState46
  | MenhirState42
  | MenhirState3
  | MenhirState2
  | MenhirState0

# 65 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  
    open Gql_ast

    let flat(l) = match l with 
      | Some l -> l
      | None -> []


# 232 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"

let rec _menhir_goto_rev_directive_locations : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_rev_directive_locations -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1593 * _menhir_state * 'tv_rev_directive_locations) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PIPE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1575 * _menhir_state * 'tv_rev_directive_locations) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EDIR_FIELD ->
            _menhir_run404 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run403 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run402 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run401 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | EDIR_MUTATION ->
            _menhir_run400 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | EDIR_QUERY ->
            _menhir_run399 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | EDIR_SUBSCRIPTION ->
            _menhir_run398 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run397 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | TSDIR_ENUM ->
            _menhir_run396 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | TSDIR_ENUM_VALUE ->
            _menhir_run395 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run394 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run393 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | TSDIR_INPUT_OBJECT ->
            _menhir_run392 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | TSDIR_INTERFACE ->
            _menhir_run391 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | TSDIR_OBJECT ->
            _menhir_run390 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | TSDIR_SCALAR ->
            _menhir_run389 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | TSDIR_SCHEMA ->
            _menhir_run388 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | TSDIR_UNION ->
            _menhir_run387 _menhir_env (Obj.magic _menhir_stack) MenhirState386
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState386) : 'freshtv1576)
    | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | L_BRACKET | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1589 * _menhir_state * 'tv_rev_directive_locations) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (res : 'tv_rev_directive_locations)) = _menhir_stack in
        let _v : 'tv_directive_locations = 
# 737 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( List.rev res )
# 295 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1587) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_directive_locations) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1585 * _menhir_state * 'tv_option_description_))) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_directive_locations) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv1583 * _menhir_state * 'tv_option_description_))) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((locations : 'tv_directive_locations) : 'tv_directive_locations) = _v in
        ((let (((_menhir_stack, _menhir_s, (ds : 'tv_option_description_)), _, (n : 'tv_name)), _, (args : 'tv_option_arguments_definition_)) = _menhir_stack in
        let _6 = () in
        let _3 = () in
        let _2 = () in
        let _v : 'tv_directive_definition = 
# 589 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({description = ds; name = n; arguments = (flat args); locations = locations})
# 316 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1581) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_directive_definition) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1579) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_directive_definition) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1577) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((d : 'tv_directive_definition) : 'tv_directive_definition) = _v in
        ((let _v : 'tv_type_system_definition = 
# 314 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                              ( DirectiveDefinition d )
# 333 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_type_system_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1578)) : 'freshtv1580)) : 'freshtv1582)) : 'freshtv1584)) : 'freshtv1586)) : 'freshtv1588)) : 'freshtv1590)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1591 * _menhir_state * 'tv_rev_directive_locations) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1592)) : 'freshtv1594)

and _menhir_goto_directive_location : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_directive_location -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState386 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1569 * _menhir_state * 'tv_rev_directive_locations)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_directive_location) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1567 * _menhir_state * 'tv_rev_directive_locations)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((l : 'tv_directive_location) : 'tv_directive_location) = _v in
        ((let (_menhir_stack, _menhir_s, (ls : 'tv_rev_directive_locations)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_rev_directive_locations = 
# 746 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( l::ls )
# 361 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_rev_directive_locations _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1568)) : 'freshtv1570)
    | MenhirState408 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1573 * _menhir_state * 'tv_option_PIPE_) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_directive_location) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1571 * _menhir_state * 'tv_option_PIPE_) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((l : 'tv_directive_location) : 'tv_directive_location) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_option_PIPE_)) = _menhir_stack in
        let _v : 'tv_rev_directive_locations = 
# 742 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( l::[] )
# 377 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_rev_directive_locations _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1572)) : 'freshtv1574)
    | _ ->
        _menhir_fail ()

and _menhir_goto_type_system_directive_location : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_system_directive_location -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1565) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_type_system_directive_location) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1563) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : 'tv_type_system_directive_location) : 'tv_type_system_directive_location) = _v in
    ((let _v : 'tv_directive_location = 
# 752 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( TypeSystemDirectiveLocation s )
# 396 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1564)) : 'freshtv1566)

and _menhir_goto_executable_directive_location : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_executable_directive_location -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1561) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_executable_directive_location) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1559) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : 'tv_executable_directive_location) : 'tv_executable_directive_location) = _v in
    ((let _v : 'tv_directive_location = 
# 750 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( ExecutableDirectiveLocation s )
# 413 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1560)) : 'freshtv1562)

and _menhir_goto_field : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_field -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1557) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_field) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1555) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((f : 'tv_field) : 'tv_field) = _v in
    ((let _v : 'tv_selection = 
# 136 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                            ( Field f )
# 430 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_selection _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1556)) : 'freshtv1558)

and _menhir_goto_operation_definition : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_operation_definition -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1553) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_operation_definition) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1551) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((d : 'tv_operation_definition) : 'tv_operation_definition) = _v in
    ((let _v : 'tv_executable_definition = 
# 89 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( OperationDefinition d )
# 447 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_executable_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1552)) : 'freshtv1554)

and _menhir_goto_executable_definition : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_executable_definition -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1549) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_executable_definition) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1547) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((ex : 'tv_executable_definition) : 'tv_executable_definition) = _v in
    ((let _v : 'tv_definition = 
# 82 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                    ( ExecutableDefinition ex )
# 464 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1548)) : 'freshtv1550)

and _menhir_run387 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1545) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_type_system_directive_location = 
# 770 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                 ( Union )
# 478 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1546)

and _menhir_run388 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1543) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_type_system_directive_location = 
# 764 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ( Schema )
# 492 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1544)

and _menhir_run389 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1541) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_type_system_directive_location = 
# 765 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ( Scalar )
# 506 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1542)

and _menhir_run390 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1539) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_type_system_directive_location = 
# 766 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ( Object )
# 520 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1540)

and _menhir_run391 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1537) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_type_system_directive_location = 
# 769 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                     ( Interface )
# 534 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1538)

and _menhir_run392 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1535) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_type_system_directive_location = 
# 773 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        ( InputObject )
# 548 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1536)

and _menhir_run393 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1533) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_type_system_directive_location = 
# 774 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                  ( InputFieldDefinition )
# 562 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1534)

and _menhir_run394 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1531) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_type_system_directive_location = 
# 767 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                            ( FieldDefinition )
# 576 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1532)

and _menhir_run395 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1529) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_type_system_directive_location = 
# 772 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( EnumValue )
# 590 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1530)

and _menhir_run396 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1527) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_type_system_directive_location = 
# 771 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ( Enum )
# 604 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1528)

and _menhir_run397 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1525) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_type_system_directive_location = 
# 768 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                               ( ArgumentDefinition )
# 618 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1526)

and _menhir_run398 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1523) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_executable_directive_location = 
# 757 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                       ( Subscription )
# 632 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_executable_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1524)

and _menhir_run399 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1521) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_executable_directive_location = 
# 755 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ( Query )
# 646 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_executable_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1522)

and _menhir_run400 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1519) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_executable_directive_location = 
# 756 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                   ( Mutation )
# 660 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_executable_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1520)

and _menhir_run401 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1517) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_executable_directive_location = 
# 761 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          ( InlineFragment )
# 674 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_executable_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1518)

and _menhir_run402 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1515) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_executable_directive_location = 
# 760 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          ( FragmentSpread )
# 688 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_executable_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1516)

and _menhir_run403 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1513) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_executable_directive_location = 
# 759 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                              ( FragmentDefinition )
# 702 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_executable_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1514)

and _menhir_run404 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1511) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_executable_directive_location = 
# 758 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ( Field )
# 716 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_executable_directive_location _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1512)

and _menhir_goto_option_selection_set_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_selection_set_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1505 * _menhir_state * 'tv_name) * _menhir_state) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_option_selection_set_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1503 * _menhir_state * 'tv_name) * _menhir_state) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((ss : 'tv_option_selection_set_) : 'tv_option_selection_set_) = _v in
        ((let (((((_menhir_stack, _menhir_s, (alias : 'tv_name)), _), _, (n : 'tv_name)), _, (args : 'tv_option_arguments_nc_)), _, (ds : 'tv_option_directives_nc_)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_field = 
# 167 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({ alias = Some alias; name = n; arguments = flat args; directives = flat ds; selectionSet = flat ss})
# 737 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_field _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1504)) : 'freshtv1506)
    | MenhirState223 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1509 * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_option_selection_set_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1507 * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((ss : 'tv_option_selection_set_) : 'tv_option_selection_set_) = _v in
        ((let (((_menhir_stack, _menhir_s, (n : 'tv_name)), _, (args : 'tv_option_arguments_nc_)), _, (ds : 'tv_option_directives_nc_)) = _menhir_stack in
        let _v : 'tv_field = 
# 172 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({ alias = None; name = n; arguments = flat args; directives = flat ds; selectionSet = flat ss})
# 753 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_field _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1508)) : 'freshtv1510)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_selection_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_selection_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1459 * _menhir_state * 'tv_selection) * _menhir_state * 'tv_nonempty_list_selection_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1457 * _menhir_state * 'tv_selection) * _menhir_state * 'tv_nonempty_list_selection_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_selection)), _, (xs : 'tv_nonempty_list_selection_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_selection_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 772 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_selection_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1458)) : 'freshtv1460)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1501 * _menhir_state) * _menhir_state * 'tv_nonempty_list_selection_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1497 * _menhir_state) * _menhir_state * 'tv_nonempty_list_selection_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1495 * _menhir_state) * _menhir_state * 'tv_nonempty_list_selection_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (ss : 'tv_nonempty_list_selection_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_selection_set = 
# 133 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( ss )
# 793 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1493) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_selection_set) = _v in
            ((match _menhir_s with
            | MenhirState205 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1469 * _menhir_state) * _menhir_state * 'tv_option_type_condition_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_selection_set) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1467 * _menhir_state) * _menhir_state * 'tv_option_type_condition_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((ss : 'tv_selection_set) : 'tv_selection_set) = _v in
                ((let (((_menhir_stack, _menhir_s), _, (tc : 'tv_option_type_condition_)), _, (ds : 'tv_option_directives_nc_)) = _menhir_stack in
                let _1 = () in
                let _v : 'tv_inline_fragment = 
# 152 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({
    condition = tc;
    directives = flat ds;
    selectionSet = ss;
  })
# 818 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1465) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_inline_fragment) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1463) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_inline_fragment) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1461) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((i : 'tv_inline_fragment) : 'tv_inline_fragment) = _v in
                ((let _v : 'tv_selection = 
# 138 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                            ( InlineFragment i )
# 835 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_selection _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1462)) : 'freshtv1464)) : 'freshtv1466)) : 'freshtv1468)) : 'freshtv1470)
            | MenhirState223 | MenhirState219 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1473) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_selection_set) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1471) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((x : 'tv_selection_set) : 'tv_selection_set) = _v in
                ((let _v : 'tv_option_selection_set_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 850 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_option_selection_set_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1472)) : 'freshtv1474)
            | MenhirState233 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1483 * _menhir_state) * _menhir_state * 'tv_fragment_name) * _menhir_state * 'tv_type_condition) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_selection_set) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1481 * _menhir_state) * _menhir_state * 'tv_fragment_name) * _menhir_state * 'tv_type_condition) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((ss : 'tv_selection_set) : 'tv_selection_set) = _v in
                ((let ((((_menhir_stack, _menhir_s), _, (n : 'tv_fragment_name)), _, (tc : 'tv_type_condition)), _, (ds : 'tv_option_directives_nc_)) = _menhir_stack in
                let _1 = () in
                let _v : 'tv_fragment_definition = 
# 126 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({ name = n; condition = tc; directives = flat ds; selectionSet = ss })
# 867 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1479) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_fragment_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1477) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_fragment_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1475) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((d : 'tv_fragment_definition) : 'tv_fragment_definition) = _v in
                ((let _v : 'tv_executable_definition = 
# 91 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( FragmentDefinition d )
# 884 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_executable_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1476)) : 'freshtv1478)) : 'freshtv1480)) : 'freshtv1482)) : 'freshtv1484)
            | MenhirState441 | MenhirState0 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1487) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_selection_set) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1485) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((ss : 'tv_selection_set) : 'tv_selection_set) = _v in
                ((let _v : 'tv_operation_definition = 
# 101 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({tpe = Query; name = None; variables = []; directives = []; selectionSet = ss})
# 899 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_operation_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1486)) : 'freshtv1488)
            | MenhirState423 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1491 * _menhir_state * 'tv_operation_type) * _menhir_state * 'tv_option_name_) * 'tv_option_variable_definitions_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_selection_set) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1489 * _menhir_state * 'tv_operation_type) * _menhir_state * 'tv_option_name_) * 'tv_option_variable_definitions_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((ss : 'tv_selection_set) : 'tv_selection_set) = _v in
                ((let ((((_menhir_stack, _menhir_s, (op : 'tv_operation_type)), _, (n : 'tv_option_name_)), (vars : 'tv_option_variable_definitions_)), _, (ds : 'tv_option_directives_nc_)) = _menhir_stack in
                let _v : 'tv_operation_definition = 
# 99 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({tpe = op; name = n; variables = flat vars; directives = flat ds; selectionSet = ss})
# 915 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_operation_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1490)) : 'freshtv1492)
            | _ ->
                _menhir_fail ()) : 'freshtv1494)) : 'freshtv1496)) : 'freshtv1498)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1499 * _menhir_state) * _menhir_state * 'tv_nonempty_list_selection_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1500)) : 'freshtv1502)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_definition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_definition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1451 * _menhir_state * 'tv_nonempty_list_definition_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EOF ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1447 * _menhir_state * 'tv_nonempty_list_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1445 * _menhir_state * 'tv_nonempty_list_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (ds : 'tv_nonempty_list_definition_)) = _menhir_stack in
            let _2 = () in
            let _v : (
# 74 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (Gql_ast.document)
# 950 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
            ) = 
# 77 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                  ( { definitions = ds } )
# 954 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1443) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 74 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (Gql_ast.document)
# 962 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1441) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : (
# 74 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (Gql_ast.document)
# 970 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
            )) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1439) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((_1 : (
# 74 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (Gql_ast.document)
# 978 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
            )) : (
# 74 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (Gql_ast.document)
# 982 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
            )) = _v in
            (Obj.magic _1 : 'freshtv1440)) : 'freshtv1442)) : 'freshtv1444)) : 'freshtv1446)) : 'freshtv1448)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1449 * _menhir_state * 'tv_nonempty_list_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1450)) : 'freshtv1452)
    | MenhirState441 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1455 * _menhir_state * 'tv_definition) * _menhir_state * 'tv_nonempty_list_definition_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1453 * _menhir_state * 'tv_definition) * _menhir_state * 'tv_nonempty_list_definition_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_definition)), _, (xs : 'tv_nonempty_list_definition_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_definition_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 1001 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1454)) : 'freshtv1456)
    | _ ->
        _menhir_fail ()

and _menhir_goto_opt_dir_fields : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_opt_dir_fields -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1437 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_implements_interfaces) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_opt_dir_fields) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1435 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_implements_interfaces) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((rest : 'tv_opt_dir_fields) : 'tv_opt_dir_fields) = _v in
    ((let (((_menhir_stack, _menhir_s), _, (n : 'tv_name)), _, (is : 'tv_implements_interfaces)) = _menhir_stack in
    let _2 = () in
    let _1 = () in
    let _v : 'tv_object_type_extension = 
# 247 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({rest with name = n; implements = is })
# 1023 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_object_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1436)) : 'freshtv1438)

and _menhir_goto_option_PIPE_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_PIPE_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState239 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1431 * _menhir_state) * _menhir_state * 'tv_option_PIPE_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState241 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState241
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState241) : 'freshtv1432)
    | MenhirState384 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1433 * _menhir_state * 'tv_option_PIPE_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EDIR_FIELD ->
            _menhir_run404 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run403 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run402 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run401 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | EDIR_MUTATION ->
            _menhir_run400 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | EDIR_QUERY ->
            _menhir_run399 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | EDIR_SUBSCRIPTION ->
            _menhir_run398 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run397 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | TSDIR_ENUM ->
            _menhir_run396 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | TSDIR_ENUM_VALUE ->
            _menhir_run395 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run394 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run393 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | TSDIR_INPUT_OBJECT ->
            _menhir_run392 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | TSDIR_INTERFACE ->
            _menhir_run391 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | TSDIR_OBJECT ->
            _menhir_run390 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | TSDIR_SCALAR ->
            _menhir_run389 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | TSDIR_SCHEMA ->
            _menhir_run388 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | TSDIR_UNION ->
            _menhir_run387 _menhir_env (Obj.magic _menhir_stack) MenhirState408
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState408) : 'freshtv1434)
    | _ ->
        _menhir_fail ()

and _menhir_reduce241 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_selection_set_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 1169 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_option_selection_set_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_selection : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_selection -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1429 * _menhir_state * 'tv_selection) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | EDIR_FIELD ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | EDIR_MUTATION ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | EDIR_QUERY ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | EDIR_SUBSCRIPTION ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | ENUM ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | EXTEND ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | FALSE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | FRAGMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | IMPLEMENTS ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | INPUT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | INTERFACE ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | NAME _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState213 _v
    | NULL ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | ON ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | OP_MUTATION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | OP_QUERY ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | OP_SUBSCRIPTION ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | SCALAR ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | SCHEMA ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | SPREAD ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TRUE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TSDIR_ENUM ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TSDIR_ENUM_VALUE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TSDIR_INPUT_OBJECT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TSDIR_INTERFACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TSDIR_OBJECT ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TSDIR_SCALAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TSDIR_SCHEMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TSDIR_UNION ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | TYPE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | UNION ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState213
    | R_BRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1427 * _menhir_state * 'tv_selection) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_selection)) = _menhir_stack in
        let _v : 'tv_nonempty_list_selection_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 1264 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_selection_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1428)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState213) : 'freshtv1430)

and _menhir_goto_definition : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_definition -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1425 * _menhir_state * 'tv_definition) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState441 _v
    | EXTEND ->
        _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState441
    | FRAGMENT ->
        _menhir_run230 _menhir_env (Obj.magic _menhir_stack) MenhirState441
    | L_BRACKET ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState441
    | OP_MUTATION ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState441
    | OP_QUERY ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState441
    | OP_SUBSCRIPTION ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState441
    | SCHEMA ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState441
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState441 _v
    | DIRECTIVE | ENUM | INPUT | INTERFACE | SCALAR | TYPE | UNION ->
        _menhir_reduce223 _menhir_env (Obj.magic _menhir_stack) MenhirState441
    | EOF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1423 * _menhir_state * 'tv_definition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_definition)) = _menhir_stack in
        let _v : 'tv_nonempty_list_definition_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 1307 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1424)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState441) : 'freshtv1426)

and _menhir_reduce226 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_directives -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s, (x : 'tv_directives)) = _menhir_stack in
    let _v : 'tv_option_directives_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 1321 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_option_directives_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_nonempty_list_directive_nc_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_directive_nc_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState422 | MenhirState232 | MenhirState222 | MenhirState218 | MenhirState211 | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1417) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_nonempty_list_directive_nc_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1415) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((ds : 'tv_nonempty_list_directive_nc_) : 'tv_nonempty_list_directive_nc_) = _v in
        ((let _v : 'tv_directives_nc = 
# 352 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( ds )
# 1340 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1413) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_directives_nc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1411) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_directives_nc) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1409) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((x : 'tv_directives_nc) : 'tv_directives_nc) = _v in
        ((let _v : 'tv_option_directives_nc_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 1357 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_option_directives_nc_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1410)) : 'freshtv1412)) : 'freshtv1414)) : 'freshtv1416)) : 'freshtv1418)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1421 * _menhir_state * 'tv_directive_nc) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_nonempty_list_directive_nc_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1419 * _menhir_state * 'tv_directive_nc) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_nonempty_list_directive_nc_) : 'tv_nonempty_list_directive_nc_) = _v in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_directive_nc)) = _menhir_stack in
        let _v : 'tv_nonempty_list_directive_nc_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 1373 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_directive_nc_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1420)) : 'freshtv1422)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_enum_values_definition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_enum_values_definition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1407 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_option_enum_values_definition_) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1405 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((vs : 'tv_option_enum_values_definition_) : 'tv_option_enum_values_definition_) = _v in
    ((let (((_menhir_stack, _menhir_s), _, (n : 'tv_name)), _, (ds : 'tv_directives)) = _menhir_stack in
    let _2 = () in
    let _1 = () in
    let _v : 'tv_enum_type_extension = 
# 282 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({name = n; directives = ds; values = flat vs })
# 1395 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1406)) : 'freshtv1408)

and _menhir_goto_enum_type_extension : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_enum_type_extension -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1403) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_enum_type_extension) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1401) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : 'tv_enum_type_extension) : 'tv_enum_type_extension) = _v in
    ((let _v : 'tv_type_extension = 
# 207 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( EnumTypeExtension s )
# 1412 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1402)) : 'freshtv1404)

and _menhir_goto_type_system_extension : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_system_extension -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1399) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_type_system_extension) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1397) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((te : 'tv_type_system_extension) : 'tv_type_system_extension) = _v in
    ((let _v : 'tv_definition = 
# 83 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                    ( TypeSystemExtension te )
# 1429 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1398)) : 'freshtv1400)

and _menhir_goto_option_fields_definition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_fields_definition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1395 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_option_fields_definition_) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1393 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((fd : 'tv_option_fields_definition_) : 'tv_option_fields_definition_) = _v in
    ((let (((_menhir_stack, _menhir_s), _, (n : 'tv_name)), _, (ds : 'tv_directives)) = _menhir_stack in
    let _2 = () in
    let _1 = () in
    let _v : 'tv_interface_type_extension = 
# 260 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    (let t: interface_type_extension = {name = n; directives = ds; fields = flat fd } in t)
# 1449 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_interface_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1394)) : 'freshtv1396)

and _menhir_goto_interface_type_extension : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_interface_type_extension -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1391) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_interface_type_extension) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1389) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : 'tv_interface_type_extension) : 'tv_interface_type_extension) = _v in
    ((let _v : 'tv_type_extension = 
# 203 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( InterfaceTypeExtension s )
# 1466 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1390)) : 'freshtv1392)

and _menhir_goto_object_type_extension : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_object_type_extension -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1387) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_object_type_extension) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1385) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : 'tv_object_type_extension) : 'tv_object_type_extension) = _v in
    ((let _v : 'tv_type_extension = 
# 201 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( ObjectTypeExtension s )
# 1483 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1386)) : 'freshtv1388)

and _menhir_goto_opt_fields_definition : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_opt_fields_definition -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1375) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_opt_fields_definition) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1373) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((fd : 'tv_opt_fields_definition) : 'tv_opt_fields_definition) = _v in
        ((let _v : 'tv_opt_dir_fields = 
# 225 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({name = ""; implements = []; directives = []; fields = flat fd})
# 1502 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_opt_dir_fields _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1374)) : 'freshtv1376)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1379 * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_opt_fields_definition) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1377 * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((fd : 'tv_opt_fields_definition) : 'tv_opt_fields_definition) = _v in
        ((let (_menhir_stack, _menhir_s, (dirs : 'tv_directives)) = _menhir_stack in
        let _v : 'tv_opt_dir_fields = 
# 228 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({name = ""; implements = []; directives = dirs; fields = flat fd})
# 1518 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_opt_dir_fields _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1378)) : 'freshtv1380)
    | MenhirState300 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1383 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_opt_fields_definition) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1381 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((fd : 'tv_opt_fields_definition) : 'tv_opt_fields_definition) = _v in
        ((let (((_menhir_stack, _menhir_s), _, (n : 'tv_name)), _, (ds : 'tv_directives)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_object_type_extension = 
# 241 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({ name = n; implements = []; directives = ds; fields = flat fd })
# 1536 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_object_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1382)) : 'freshtv1384)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_input_fields_definition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_input_fields_definition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1371 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_option_input_fields_definition_) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1369 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((fd : 'tv_option_input_fields_definition_) : 'tv_option_input_fields_definition_) = _v in
    ((let (((_menhir_stack, _menhir_s), _, (n : 'tv_name)), _, (ds : 'tv_directives)) = _menhir_stack in
    let _2 = () in
    let _1 = () in
    let _v : 'tv_input_object_type_extension = 
# 296 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({name = n; directives = ds; fields = flat fd })
# 1558 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_input_object_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1370)) : 'freshtv1372)

and _menhir_goto_input_object_type_extension : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_input_object_type_extension -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1367) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_input_object_type_extension) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1365) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : 'tv_input_object_type_extension) : 'tv_input_object_type_extension) = _v in
    ((let _v : 'tv_type_extension = 
# 209 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( InputObjectTypeExtension s )
# 1575 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1366)) : 'freshtv1368)

and _menhir_reduce213 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_PIPE_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 1584 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_option_PIPE_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run240 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1363) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let x = () in
    let _v : 'tv_option_PIPE_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 1598 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_option_PIPE_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1364)

and _menhir_goto_option_arguments_definition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_arguments_definition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState253 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1355 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1351 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | L_SQ_BRACKET ->
                _menhir_run258 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState278 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState278
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState278) : 'freshtv1352)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1353 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1354)) : 'freshtv1356)
    | MenhirState382 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1361 * _menhir_state * 'tv_option_description_))) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv1357 * _menhir_state * 'tv_option_description_))) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | PIPE ->
                _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState384
            | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION ->
                _menhir_reduce213 _menhir_env (Obj.magic _menhir_stack) MenhirState384
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState384) : 'freshtv1358)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv1359 * _menhir_state * 'tv_option_description_))) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1360)) : 'freshtv1362)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_AMPERSAND_ : _menhir_env -> 'ttv_tail -> 'tv_option_AMPERSAND_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv1349 * _menhir_state) * 'tv_option_AMPERSAND_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | EDIR_FIELD ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | EDIR_MUTATION ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | EDIR_QUERY ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | EDIR_SUBSCRIPTION ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | ENUM ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | EXTEND ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | FALSE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | FRAGMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | IMPLEMENTS ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | INPUT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | INTERFACE ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | NAME _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState288 _v
    | NULL ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | ON ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | OP_MUTATION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | OP_QUERY ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | OP_SUBSCRIPTION ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | SCALAR ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | SCHEMA ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TRUE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TSDIR_ENUM ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TSDIR_ENUM_VALUE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TSDIR_INPUT_OBJECT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TSDIR_INTERFACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TSDIR_OBJECT ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TSDIR_SCALAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TSDIR_SCHEMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TSDIR_UNION ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | TYPE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | UNION ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState288
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState288) : 'freshtv1350)

and _menhir_reduce209 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_opt_fields_definition = 
# 219 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( None )
# 1827 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_opt_fields_definition _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce221 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_default_value_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 1836 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_option_default_value_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run267 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState267 _v
    | DIRECTIVE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | EDIR_FIELD ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | EDIR_MUTATION ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | EDIR_QUERY ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | EDIR_SUBSCRIPTION ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | ENUM ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | EXTEND ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | FALSE ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | FLOAT _v ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState267 _v
    | FRAGMENT ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | IMPLEMENTS ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | INPUT ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | INT _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState267 _v
    | INTERFACE ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | L_BRACKET ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | L_SQ_BRACKET ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | NAME _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState267 _v
    | NULL ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | ON ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | OP_MUTATION ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | OP_QUERY ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | OP_SUBSCRIPTION ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | SCALAR ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | SCHEMA ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState267 _v
    | TRUE ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TSDIR_ENUM ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TSDIR_ENUM_VALUE ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TSDIR_INPUT_OBJECT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TSDIR_INTERFACE ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TSDIR_OBJECT ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TSDIR_SCALAR ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TSDIR_SCHEMA ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TSDIR_UNION ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | TYPE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | UNION ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState267
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState267

and _menhir_goto_union_type_extension : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_union_type_extension -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1347) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_union_type_extension) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1345) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : 'tv_union_type_extension) : 'tv_union_type_extension) = _v in
    ((let _v : 'tv_type_extension = 
# 205 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( UnionTypeExtension s )
# 1950 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1346)) : 'freshtv1348)

and _menhir_goto_option_directives_nc_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_directives_nc_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1325 * _menhir_state) * _menhir_state * 'tv_option_type_condition_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState205
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState205) : 'freshtv1326)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1335 * _menhir_state) * _menhir_state * 'tv_fragment_name) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1333 * _menhir_state) * _menhir_state * 'tv_fragment_name) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (fn : 'tv_fragment_name)), _, (ds : 'tv_option_directives_nc_)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_fragment_spread = 
# 145 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  (let v: fragment_spread = {name = fn; directives = flat ds;} in v)
# 1980 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1331) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_fragment_spread) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1329) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_fragment_spread) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1327) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((fs : 'tv_fragment_spread) : 'tv_fragment_spread) = _v in
        ((let _v : 'tv_selection = 
# 137 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                            ( FragmentSpread fs )
# 1997 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_selection _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1328)) : 'freshtv1330)) : 'freshtv1332)) : 'freshtv1334)) : 'freshtv1336)
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv1337 * _menhir_state * 'tv_name) * _menhir_state) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | SCALAR | SCHEMA | SPREAD | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce241 _menhir_env (Obj.magic _menhir_stack) MenhirState219
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState219) : 'freshtv1338)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1339 * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState223
        | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | SCALAR | SCHEMA | SPREAD | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce241 _menhir_env (Obj.magic _menhir_stack) MenhirState223
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState223) : 'freshtv1340)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1341 * _menhir_state) * _menhir_state * 'tv_fragment_name) * _menhir_state * 'tv_type_condition) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState233
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState233) : 'freshtv1342)
    | MenhirState422 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1343 * _menhir_state * 'tv_operation_type) * _menhir_state * 'tv_option_name_) * 'tv_option_variable_definitions_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState423
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState423) : 'freshtv1344)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_schema_extension_rest_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_schema_extension_rest_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv1323 * _menhir_state)) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_option_schema_extension_rest_) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv1321 * _menhir_state)) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((ops : 'tv_option_schema_extension_rest_) : 'tv_option_schema_extension_rest_) = _v in
    ((let ((_menhir_stack, _menhir_s), _, (ds : 'tv_directives)) = _menhir_stack in
    let _2 = () in
    let _1 = () in
    let _v : 'tv_schema_extension = 
# 191 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    (let t: schema_extension = {directives = ds; operations = flat ops} in t)
# 2071 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_schema_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1322)) : 'freshtv1324)

and _menhir_goto_schema_extension : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_schema_extension -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1319) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_schema_extension) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1317) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((se : 'tv_schema_extension) : 'tv_schema_extension) = _v in
    ((let _v : 'tv_type_system_extension = 
# 307 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( SchemaExtension se )
# 2088 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1318)) : 'freshtv1320)

and _menhir_goto_type_system_definition : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_system_definition -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1315) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_type_system_definition) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1313) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((ts : 'tv_type_system_definition) : 'tv_type_system_definition) = _v in
    ((let _v : 'tv_definition = 
# 81 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                    ( TypeSystemDefinition ts )
# 2105 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1314)) : 'freshtv1316)

and _menhir_goto_nonempty_list_directive_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_directive_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState377 | MenhirState373 | MenhirState369 | MenhirState366 | MenhirState361 | MenhirState355 | MenhirState329 | MenhirState332 | MenhirState320 | MenhirState314 | MenhirState311 | MenhirState302 | MenhirState293 | MenhirState249 | MenhirState279 | MenhirState269 | MenhirState237 | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1307) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_nonempty_list_directive_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1305) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((ds : 'tv_nonempty_list_directive_) : 'tv_nonempty_list_directive_) = _v in
        ((let _v : 'tv_directives = 
# 348 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( ds )
# 2124 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1303) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_directives) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState377 | MenhirState373 | MenhirState369 | MenhirState366 | MenhirState361 | MenhirState355 | MenhirState332 | MenhirState311 | MenhirState279 | MenhirState269 | MenhirState2 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1275 * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
            (_menhir_reduce226 _menhir_env (Obj.magic _menhir_stack) : 'freshtv1276)
        | MenhirState237 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1281 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | L_BRACKET | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1277 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
                ((let (((_menhir_stack, _menhir_s), _, (n : 'tv_name)), _, (ds : 'tv_directives)) = _menhir_stack in
                let _2 = () in
                let _1 = () in
                let _v : 'tv_union_type_extension = 
# 274 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({name = n; directives = ds; types = [] })
# 2151 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_union_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1278)
            | EQUAL ->
                _menhir_reduce226 _menhir_env (Obj.magic _menhir_stack)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1279 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1280)) : 'freshtv1282)
        | MenhirState293 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1283 * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_BRACKET ->
                _menhir_run250 _menhir_env (Obj.magic _menhir_stack) MenhirState297
            | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
                _menhir_reduce209 _menhir_env (Obj.magic _menhir_stack) MenhirState297
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState297) : 'freshtv1284)
        | MenhirState249 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1285 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_BRACKET ->
                _menhir_run250 _menhir_env (Obj.magic _menhir_stack) MenhirState300
            | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
                _menhir_reduce209 _menhir_env (Obj.magic _menhir_stack) MenhirState300
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState300) : 'freshtv1286)
        | MenhirState302 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv1289 * _menhir_state)) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_BRACKET ->
                _menhir_run303 _menhir_env (Obj.magic _menhir_stack) MenhirState307
            | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1287) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState307 in
                ((let _v : 'tv_option_schema_extension_rest_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 2206 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_option_schema_extension_rest_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1288)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState307) : 'freshtv1290)
        | MenhirState314 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1293 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_BRACKET ->
                _menhir_run250 _menhir_env (Obj.magic _menhir_stack) MenhirState316
            | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1291) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState316 in
                ((let _v : 'tv_option_fields_definition_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 2228 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_option_fields_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1292)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState316) : 'freshtv1294)
        | MenhirState320 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1297 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_BRACKET ->
                _menhir_run321 _menhir_env (Obj.magic _menhir_stack) MenhirState325
            | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1295) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState325 in
                ((let _v : 'tv_option_input_fields_definition_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 2250 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_option_input_fields_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1296)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState325) : 'freshtv1298)
        | MenhirState329 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv1301 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | L_BRACKET ->
                _menhir_run330 _menhir_env (Obj.magic _menhir_stack) MenhirState339
            | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1299) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState339 in
                ((let _v : 'tv_option_enum_values_definition_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 2272 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_option_enum_values_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1300)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState339) : 'freshtv1302)
        | _ ->
            _menhir_fail ()) : 'freshtv1304)) : 'freshtv1306)) : 'freshtv1308)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1311 * _menhir_state * 'tv_directive) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_nonempty_list_directive_) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1309 * _menhir_state * 'tv_directive) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((xs : 'tv_nonempty_list_directive_) : 'tv_nonempty_list_directive_) = _v in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_directive)) = _menhir_stack in
        let _v : 'tv_nonempty_list_directive_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 2294 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_directive_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1310)) : 'freshtv1312)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_arguments_nc_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_arguments_nc_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1269 * _menhir_state) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv1267 * _menhir_state) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (n : 'tv_name)), _, (args : 'tv_option_arguments_nc_)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_directive_nc = 
# 358 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({name= n; arguments = flat args })
# 2314 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1265) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_directive_nc) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1263 * _menhir_state * 'tv_directive_nc) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState209
        | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | L_BRACKET | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | SCALAR | SCHEMA | SPREAD | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1261 * _menhir_state * 'tv_directive_nc) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_directive_nc)) = _menhir_stack in
            let _v : 'tv_nonempty_list_directive_nc_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 2335 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_nonempty_list_directive_nc_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1262)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState209) : 'freshtv1264)) : 'freshtv1266)) : 'freshtv1268)) : 'freshtv1270)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv1271 * _menhir_state * 'tv_name) * _menhir_state) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | L_BRACKET | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | SCALAR | SCHEMA | SPREAD | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce227 _menhir_env (Obj.magic _menhir_stack) MenhirState218
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState218) : 'freshtv1272)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1273 * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState222
        | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | L_BRACKET | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | SCALAR | SCHEMA | SPREAD | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce227 _menhir_env (Obj.magic _menhir_stack) MenhirState222
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState222) : 'freshtv1274)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_value_nc_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_value_nc_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1245 * _menhir_state * 'tv_value_nc) * _menhir_state * 'tv_list_value_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1243 * _menhir_state * 'tv_value_nc) * _menhir_state * 'tv_list_value_nc_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_value_nc)), _, (xs : 'tv_list_value_nc_)) = _menhir_stack in
        let _v : 'tv_list_value_nc_ = 
# 187 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 2386 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_list_value_nc_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1244)) : 'freshtv1246)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1259 * _menhir_state) * _menhir_state * 'tv_list_value_nc_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_SQ_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1255 * _menhir_state) * _menhir_state * 'tv_list_value_nc_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1253 * _menhir_state) * _menhir_state * 'tv_list_value_nc_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (vs : 'tv_list_value_nc_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_list_value_nc = 
# 547 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( vs )
# 2407 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1251) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_list_value_nc) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1249) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_list_value_nc) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1247) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((l : 'tv_list_value_nc) : 'tv_list_value_nc) = _v in
            ((let _v : 'tv_value_nc = 
# 419 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          (ListValue l)
# 2424 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_value_nc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1248)) : 'freshtv1250)) : 'freshtv1252)) : 'freshtv1254)) : 'freshtv1256)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1257 * _menhir_state) * _menhir_state * 'tv_list_value_nc_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1258)) : 'freshtv1260)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_object_field_nc_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_object_field_nc_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1227 * _menhir_state * 'tv_object_field_nc) * _menhir_state * 'tv_list_object_field_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1225 * _menhir_state * 'tv_object_field_nc) * _menhir_state * 'tv_list_object_field_nc_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_object_field_nc)), _, (xs : 'tv_list_object_field_nc_)) = _menhir_stack in
        let _v : 'tv_list_object_field_nc_ = 
# 187 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 2450 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_list_object_field_nc_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1226)) : 'freshtv1228)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1241 * _menhir_state) * _menhir_state * 'tv_list_object_field_nc_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1237 * _menhir_state) * _menhir_state * 'tv_list_object_field_nc_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1235 * _menhir_state) * _menhir_state * 'tv_list_object_field_nc_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (fs : 'tv_list_object_field_nc_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_object_value_nc = 
# 565 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( fs )
# 2471 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1233) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_object_value_nc) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1231) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_object_value_nc) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1229) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((l : 'tv_object_value_nc) : 'tv_object_value_nc) = _v in
            ((let _v : 'tv_value_nc = 
# 420 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          (ObjectValue l)
# 2488 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_value_nc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1230)) : 'freshtv1232)) : 'freshtv1234)) : 'freshtv1236)) : 'freshtv1238)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1239 * _menhir_state) * _menhir_state * 'tv_list_object_field_nc_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1240)) : 'freshtv1242)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_variable_definition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_variable_definition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState414 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1209 * _menhir_state * 'tv_variable_definition) * _menhir_state * 'tv_nonempty_list_variable_definition_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1207 * _menhir_state * 'tv_variable_definition) * _menhir_state * 'tv_nonempty_list_variable_definition_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_variable_definition)), _, (xs : 'tv_nonempty_list_variable_definition_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_variable_definition_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 2514 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_variable_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1208)) : 'freshtv1210)
    | MenhirState413 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1223) * _menhir_state * 'tv_nonempty_list_variable_definition_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1219) * _menhir_state * 'tv_nonempty_list_variable_definition_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1217) * _menhir_state * 'tv_nonempty_list_variable_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, (vs : 'tv_nonempty_list_variable_definition_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_variable_definitions = 
# 107 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( vs )
# 2535 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1215) = _menhir_stack in
            let (_v : 'tv_variable_definitions) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1213) = Obj.magic _menhir_stack in
            let (_v : 'tv_variable_definitions) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1211) = Obj.magic _menhir_stack in
            let ((x : 'tv_variable_definitions) : 'tv_variable_definitions) = _v in
            ((let _v : 'tv_option_variable_definitions_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 2549 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_option_variable_definitions_ _menhir_env _menhir_stack _v) : 'freshtv1212)) : 'freshtv1214)) : 'freshtv1216)) : 'freshtv1218)) : 'freshtv1220)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1221) * _menhir_state * 'tv_nonempty_list_variable_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1222)) : 'freshtv1224)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_value_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_value_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1191 * _menhir_state * 'tv_value) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1189 * _menhir_state * 'tv_value) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_value)), _, (xs : 'tv_list_value_)) = _menhir_stack in
        let _v : 'tv_list_value_ = 
# 187 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 2575 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_list_value_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1190)) : 'freshtv1192)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1205 * _menhir_state) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_SQ_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1201 * _menhir_state) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1199 * _menhir_state) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (vs : 'tv_list_value_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_list_value = 
# 541 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( vs )
# 2596 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1197) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_list_value) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1195) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_list_value) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1193) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((l : 'tv_list_value) : 'tv_list_value) = _v in
            ((let _v : 'tv_value = 
# 407 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        (let v: vc = ListValue l in v)
# 2613 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1194)) : 'freshtv1196)) : 'freshtv1198)) : 'freshtv1200)) : 'freshtv1202)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1203 * _menhir_state) * _menhir_state * 'tv_list_value_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1204)) : 'freshtv1206)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_object_field_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_object_field_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1173 * _menhir_state * 'tv_object_field) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1171 * _menhir_state * 'tv_object_field) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_object_field)), _, (xs : 'tv_list_object_field_)) = _menhir_stack in
        let _v : 'tv_list_object_field_ = 
# 187 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 2639 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_list_object_field_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1172)) : 'freshtv1174)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1187 * _menhir_state) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1183 * _menhir_state) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1181 * _menhir_state) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (fs : 'tv_list_object_field_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_object_value = 
# 553 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( fs )
# 2660 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1179) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_object_value) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1177) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_object_value) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1175) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((l : 'tv_object_value) : 'tv_object_value) = _v in
            ((let _v : 'tv_value = 
# 408 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        (let v: vc = ObjectValue l in v)
# 2677 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1176)) : 'freshtv1178)) : 'freshtv1180)) : 'freshtv1182)) : 'freshtv1184)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1185 * _menhir_state) * _menhir_state * 'tv_list_object_field_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1186)) : 'freshtv1188)
    | _ ->
        _menhir_fail ()

and _menhir_goto_enum_value : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_enum_value -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState267 | MenhirState46 | MenhirState69 | MenhirState100 | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1163 * _menhir_state * 'tv_enum_value) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1161 * _menhir_state * 'tv_enum_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (n : 'tv_enum_value)) = _menhir_stack in
        let _v : 'tv_value = 
# 406 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        (let v: vc = EnumValue n in v)
# 2703 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1162)) : 'freshtv1164)
    | MenhirState174 | MenhirState177 | MenhirState196 | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1167 * _menhir_state * 'tv_enum_value) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1165 * _menhir_state * 'tv_enum_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (n : 'tv_enum_value)) = _menhir_stack in
        let _v : 'tv_value_nc = 
# 418 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          (EnumValue n)
# 2715 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_value_nc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1166)) : 'freshtv1168)
    | MenhirState331 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1169 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_enum_value) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState332
        | BLOCK_STRING _ | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | SCALAR | SCHEMA | STRING _ | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState332
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState332) : 'freshtv1170)
    | _ ->
        _menhir_fail ()

and _menhir_goto_type_definition : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_definition -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1159) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_type_definition) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1157) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((d : 'tv_type_definition) : 'tv_type_definition) = _v in
    ((let _v : 'tv_type_system_definition = 
# 313 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                              ( TypeDefinition d )
# 2748 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1158)) : 'freshtv1160)

and _menhir_goto_option_union_member_types_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_union_member_types_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1155 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_option_union_member_types_) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1153 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((umt : 'tv_option_union_member_types_) : 'tv_option_union_member_types_) = _v in
    ((let (((_menhir_stack, _menhir_s, (ds : 'tv_option_description_)), _, (n : 'tv_name)), _, (dirs : 'tv_option_directives_)) = _menhir_stack in
    let _2 = () in
    let _v : 'tv_union_type_definition = 
# 715 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({description = ds; name = n; directives = flat dirs; types = flat umt})
# 2767 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1151) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_union_type_definition) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1149) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_union_type_definition) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1147) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((d : 'tv_union_type_definition) : 'tv_union_type_definition) = _v in
    ((let _v : 'tv_type_definition = 
# 577 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                      ( UnionTypeDefinition d )
# 2784 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1148)) : 'freshtv1150)) : 'freshtv1152)) : 'freshtv1154)) : 'freshtv1156)

and _menhir_goto_nonempty_list_enum_value_definition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_enum_value_definition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState330 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1141 * _menhir_state) * _menhir_state * 'tv_nonempty_list_enum_value_definition_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1137 * _menhir_state) * _menhir_state * 'tv_nonempty_list_enum_value_definition_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1135 * _menhir_state) * _menhir_state * 'tv_nonempty_list_enum_value_definition_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (vs : 'tv_nonempty_list_enum_value_definition_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_enum_values_definition = 
# 620 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( vs )
# 2810 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1133) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_enum_values_definition) = _v in
            ((match _menhir_s with
            | MenhirState329 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1117 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_enum_values_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1115 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((vs : 'tv_enum_values_definition) : 'tv_enum_values_definition) = _v in
                ((let ((_menhir_stack, _menhir_s), _, (n : 'tv_name)) = _menhir_stack in
                let _2 = () in
                let _1 = () in
                let _v : 'tv_enum_type_extension = 
# 287 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({name = n; directives = []; values = vs })
# 2832 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_enum_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1116)) : 'freshtv1118)
            | MenhirState339 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1121) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_enum_values_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1119) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((x : 'tv_enum_values_definition) : 'tv_enum_values_definition) = _v in
                ((let _v : 'tv_option_enum_values_definition_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 2847 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_option_enum_values_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1120)) : 'freshtv1122)
            | MenhirState378 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1131 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_enum_values_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1129 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((vs : 'tv_enum_values_definition) : 'tv_enum_values_definition) = _v in
                ((let (((_menhir_stack, _menhir_s, (ds : 'tv_option_description_)), _, (n : 'tv_name)), _, (dirs : 'tv_option_directives_)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_enum_type_definition = 
# 614 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({ description = ds; name = n; directives = flat dirs; values = vs})
# 2864 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1127) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_enum_type_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1125) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_enum_type_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1123) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((d : 'tv_enum_type_definition) : 'tv_enum_type_definition) = _v in
                ((let _v : 'tv_type_definition = 
# 578 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                      ( EnumTypeDefinition d )
# 2881 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_type_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1124)) : 'freshtv1126)) : 'freshtv1128)) : 'freshtv1130)) : 'freshtv1132)
            | _ ->
                _menhir_fail ()) : 'freshtv1134)) : 'freshtv1136)) : 'freshtv1138)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1139 * _menhir_state) * _menhir_state * 'tv_nonempty_list_enum_value_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1140)) : 'freshtv1142)
    | MenhirState336 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1145 * _menhir_state * 'tv_enum_value_definition) * _menhir_state * 'tv_nonempty_list_enum_value_definition_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1143 * _menhir_state * 'tv_enum_value_definition) * _menhir_state * 'tv_nonempty_list_enum_value_definition_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_enum_value_definition)), _, (xs : 'tv_nonempty_list_enum_value_definition_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_enum_value_definition_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 2902 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_enum_value_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1144)) : 'freshtv1146)
    | _ ->
        _menhir_fail ()

and _menhir_goto_type_extension : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_type_extension -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1113) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_type_extension) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1111) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((te : 'tv_type_extension) : 'tv_type_extension) = _v in
    ((let _v : 'tv_type_system_extension = 
# 309 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( TypeExtension te )
# 2921 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_type_system_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1112)) : 'freshtv1114)

and _menhir_goto_nonempty_list_field_definition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_field_definition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState250 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1105 * _menhir_state) * _menhir_state * 'tv_nonempty_list_field_definition_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1101 * _menhir_state) * _menhir_state * 'tv_nonempty_list_field_definition_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1099 * _menhir_state) * _menhir_state * 'tv_nonempty_list_field_definition_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (fs : 'tv_nonempty_list_field_definition_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_fields_definition = 
# 647 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( fs )
# 2947 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1097) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_fields_definition) = _v in
            ((match _menhir_s with
            | MenhirState300 | MenhirState297 | MenhirState293 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1063) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_fields_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1061) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((fd : 'tv_fields_definition) : 'tv_fields_definition) = _v in
                ((let _v : 'tv_opt_fields_definition = 
# 221 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( Some fd )
# 2966 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_opt_fields_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1062)) : 'freshtv1064)
            | MenhirState249 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1067 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_fields_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1065 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((fd : 'tv_fields_definition) : 'tv_fields_definition) = _v in
                ((let ((_menhir_stack, _menhir_s), _, (n : 'tv_name)) = _menhir_stack in
                let _2 = () in
                let _1 = () in
                let _v : 'tv_object_type_extension = 
# 235 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({ name = n; implements = []; directives = []; fields = fd })
# 2984 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_object_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1066)) : 'freshtv1068)
            | MenhirState314 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1071 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_fields_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1069 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((fd : 'tv_fields_definition) : 'tv_fields_definition) = _v in
                ((let ((_menhir_stack, _menhir_s), _, (n : 'tv_name)) = _menhir_stack in
                let _2 = () in
                let _1 = () in
                let _v : 'tv_interface_type_extension = 
# 254 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    (let t: interface_type_extension = {name = n; directives = []; fields = fd } in t)
# 3002 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_interface_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1070)) : 'freshtv1072)
            | MenhirState316 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1075) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_fields_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1073) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((x : 'tv_fields_definition) : 'tv_fields_definition) = _v in
                ((let _v : 'tv_option_fields_definition_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 3017 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_option_fields_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1074)) : 'freshtv1076)
            | MenhirState362 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv1085 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_implements_interfaces_) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_fields_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((('freshtv1083 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_implements_interfaces_) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((fd : 'tv_fields_definition) : 'tv_fields_definition) = _v in
                ((let ((((_menhir_stack, _menhir_s, (ds : 'tv_option_description_)), _, (n : 'tv_name)), _, (impl : 'tv_option_implements_interfaces_)), _, (dirs : 'tv_option_directives_)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_object_type_definition = 
# 783 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({ 
    description = ds; 
    name = n; 
    implements = flat impl;
    directives = flat dirs;
    fields = fd;
    })
# 3040 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1081) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_object_type_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1079) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_object_type_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1077) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((d : 'tv_object_type_definition) : 'tv_object_type_definition) = _v in
                ((let _v : 'tv_type_definition = 
# 575 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                      ( ObjectTypeDefinition d )
# 3057 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_type_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1078)) : 'freshtv1080)) : 'freshtv1082)) : 'freshtv1084)) : 'freshtv1086)
            | MenhirState370 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1095 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_fields_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1093 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((fd : 'tv_fields_definition) : 'tv_fields_definition) = _v in
                ((let (((_menhir_stack, _menhir_s, (ds : 'tv_option_description_)), _, (n : 'tv_name)), _, (dirs : 'tv_option_directives_)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_interface_type_definition = 
# 634 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  (
    let v: interface_type_definition = { 
      description = ds; 
      name = n; 
      directives = flat dirs; 
      fields = fd
      }  
    in v )
# 3081 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1091) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_interface_type_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1089) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_interface_type_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1087) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((d : 'tv_interface_type_definition) : 'tv_interface_type_definition) = _v in
                ((let _v : 'tv_type_definition = 
# 576 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                      ( InterfaceTypeDefinition d )
# 3098 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_type_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1088)) : 'freshtv1090)) : 'freshtv1092)) : 'freshtv1094)) : 'freshtv1096)
            | _ ->
                _menhir_fail ()) : 'freshtv1098)) : 'freshtv1100)) : 'freshtv1102)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1103 * _menhir_state) * _menhir_state * 'tv_nonempty_list_field_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1104)) : 'freshtv1106)
    | MenhirState284 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1109 * _menhir_state * 'tv_field_definition) * _menhir_state * 'tv_nonempty_list_field_definition_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1107 * _menhir_state * 'tv_field_definition) * _menhir_state * 'tv_nonempty_list_field_definition_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_field_definition)), _, (xs : 'tv_nonempty_list_field_definition_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_field_definition_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 3119 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_field_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1108)) : 'freshtv1110)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_input_value_definition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_input_value_definition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState254 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1027 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_definition_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1023 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_definition_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1021 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_definition_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (vs : 'tv_nonempty_list_input_value_definition_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_arguments_definition = 
# 595 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( vs )
# 3147 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1019) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_arguments_definition) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1017) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_arguments_definition) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1015) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((x : 'tv_arguments_definition) : 'tv_arguments_definition) = _v in
            ((let _v : 'tv_option_arguments_definition_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 3164 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_option_arguments_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1016)) : 'freshtv1018)) : 'freshtv1020)) : 'freshtv1022)) : 'freshtv1024)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1025 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1026)) : 'freshtv1028)
    | MenhirState274 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1031 * _menhir_state * 'tv_input_value_definition) * _menhir_state * 'tv_nonempty_list_input_value_definition_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1029 * _menhir_state * 'tv_input_value_definition) * _menhir_state * 'tv_nonempty_list_input_value_definition_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_input_value_definition)), _, (xs : 'tv_nonempty_list_input_value_definition_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_input_value_definition_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 3183 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_input_value_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1030)) : 'freshtv1032)
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv1059 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_definition_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1055 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_definition_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1053 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_definition_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (vs : 'tv_nonempty_list_input_value_definition_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_input_fields_definition = 
# 697 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( vs )
# 3204 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1051) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_input_fields_definition) = _v in
            ((match _menhir_s with
            | MenhirState320 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1035 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_input_fields_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv1033 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((fd : 'tv_input_fields_definition) : 'tv_input_fields_definition) = _v in
                ((let ((_menhir_stack, _menhir_s), _, (n : 'tv_name)) = _menhir_stack in
                let _2 = () in
                let _1 = () in
                let _v : 'tv_input_object_type_extension = 
# 301 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({name = n; directives = []; fields = fd })
# 3226 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_input_object_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1034)) : 'freshtv1036)
            | MenhirState325 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1039) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_input_fields_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1037) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((x : 'tv_input_fields_definition) : 'tv_input_fields_definition) = _v in
                ((let _v : 'tv_option_input_fields_definition_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 3241 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_option_input_fields_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1038)) : 'freshtv1040)
            | MenhirState374 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1049 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_input_fields_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv1047 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((fs : 'tv_input_fields_definition) : 'tv_input_fields_definition) = _v in
                ((let (((_menhir_stack, _menhir_s, (ds : 'tv_option_description_)), _, (n : 'tv_name)), _, (dirs : 'tv_option_directives_)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_input_object_type_definition = 
# 691 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({description = ds; name = n; directives = flat dirs; fields = fs})
# 3258 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1045) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_input_object_type_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1043) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_input_object_type_definition) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv1041) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((d : 'tv_input_object_type_definition) : 'tv_input_object_type_definition) = _v in
                ((let _v : 'tv_type_definition = 
# 579 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                      ( InputObjectTypeDefinition d )
# 3275 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_type_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv1042)) : 'freshtv1044)) : 'freshtv1046)) : 'freshtv1048)) : 'freshtv1050)
            | _ ->
                _menhir_fail ()) : 'freshtv1052)) : 'freshtv1054)) : 'freshtv1056)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv1057 * _menhir_state) * _menhir_state * 'tv_nonempty_list_input_value_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1058)) : 'freshtv1060)
    | _ ->
        _menhir_fail ()

and _menhir_run239 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PIPE ->
        _menhir_run240 _menhir_env (Obj.magic _menhir_stack) MenhirState239
    | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
        _menhir_reduce213 _menhir_env (Obj.magic _menhir_stack) MenhirState239
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState239

and _menhir_goto_option_variable_definitions_ : _menhir_env -> 'ttv_tail -> 'tv_option_variable_definitions_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv1013 * _menhir_state * 'tv_operation_type) * _menhir_state * 'tv_option_name_) * 'tv_option_variable_definitions_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AT ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState422
    | L_BRACKET ->
        _menhir_reduce227 _menhir_env (Obj.magic _menhir_stack) MenhirState422
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState422) : 'freshtv1014)

and _menhir_goto_option_implements_interfaces_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_implements_interfaces_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((('freshtv1011 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_implements_interfaces_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState361
    | L_BRACKET ->
        _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState361
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState361) : 'freshtv1012)

and _menhir_run330 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState330 _v
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState330 _v
    | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
        _menhir_reduce223 _menhir_env (Obj.magic _menhir_stack) MenhirState330
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState330

and _menhir_run321 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState321 _v
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState321 _v
    | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
        _menhir_reduce223 _menhir_env (Obj.magic _menhir_stack) MenhirState321
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState321

and _menhir_reduce217 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_arguments_definition_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 3378 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_option_arguments_definition_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run254 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState254 _v
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState254 _v
    | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
        _menhir_reduce223 _menhir_env (Obj.magic _menhir_stack) MenhirState254
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState254

and _menhir_run250 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState250 _v
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState250 _v
    | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
        _menhir_reduce223 _menhir_env (Obj.magic _menhir_stack) MenhirState250
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState250

and _menhir_run286 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1005) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1003) = Obj.magic _menhir_stack in
        ((let x = () in
        let _v : 'tv_option_AMPERSAND_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 3432 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_option_AMPERSAND_ _menhir_env _menhir_stack _v) : 'freshtv1004)) : 'freshtv1006)
    | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1007) = Obj.magic _menhir_stack in
        ((let _v : 'tv_option_AMPERSAND_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 3441 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_option_AMPERSAND_ _menhir_env _menhir_stack _v) : 'freshtv1008)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv1009 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1010)

and _menhir_run258 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | EDIR_FIELD ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | EDIR_MUTATION ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | EDIR_QUERY ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | EDIR_SUBSCRIPTION ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | ENUM ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | EXTEND ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | FALSE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | FRAGMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | IMPLEMENTS ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | INPUT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | INTERFACE ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | L_SQ_BRACKET ->
        _menhir_run258 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | NAME _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState258 _v
    | NULL ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | ON ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | OP_MUTATION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | OP_QUERY ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | OP_SUBSCRIPTION ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | SCALAR ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | SCHEMA ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TRUE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TSDIR_ENUM ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TSDIR_ENUM_VALUE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TSDIR_INPUT_OBJECT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TSDIR_INTERFACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TSDIR_OBJECT ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TSDIR_SCALAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TSDIR_SCHEMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TSDIR_UNION ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | TYPE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | UNION ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState258
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState258

and _menhir_reduce219 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_arguments_nc_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 3544 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_option_arguments_nc_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run170 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | EDIR_FIELD ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | EDIR_MUTATION ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | EDIR_QUERY ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | EDIR_SUBSCRIPTION ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | ENUM ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | EXTEND ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | FALSE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | FRAGMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | IMPLEMENTS ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | INPUT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | INTERFACE ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | NAME _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState170 _v
    | NULL ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | ON ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | OP_MUTATION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | OP_QUERY ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | OP_SUBSCRIPTION ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | SCALAR ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | SCHEMA ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TRUE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TSDIR_ENUM ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TSDIR_ENUM_VALUE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TSDIR_INPUT_OBJECT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TSDIR_INTERFACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TSDIR_OBJECT ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TSDIR_SCALAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TSDIR_SCHEMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TSDIR_UNION ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | TYPE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | UNION ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState170
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170

and _menhir_goto_rev_implements_interfaces : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_rev_implements_interfaces -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv1001 * _menhir_state * 'tv_rev_implements_interfaces) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AMPERSAND ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv987 * _menhir_state * 'tv_rev_implements_interfaces) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState291 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState291
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState291) : 'freshtv988)
    | AT | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | L_BRACKET | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv997 * _menhir_state * 'tv_rev_implements_interfaces) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (res : 'tv_rev_implements_interfaces)) = _menhir_stack in
        let _v : 'tv_implements_interfaces = 
# 793 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( List.rev res )
# 3732 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv995) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_implements_interfaces) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState249 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv989 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_implements_interfaces) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AT ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState293
            | L_BRACKET ->
                _menhir_run250 _menhir_env (Obj.magic _menhir_stack) MenhirState293
            | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
                _menhir_reduce209 _menhir_env (Obj.magic _menhir_stack) MenhirState293
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState293) : 'freshtv990)
        | MenhirState360 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv993 * _menhir_state * 'tv_implements_interfaces) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv991 * _menhir_state * 'tv_implements_interfaces) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_implements_interfaces)) = _menhir_stack in
            let _v : 'tv_option_implements_interfaces_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 3765 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_option_implements_interfaces_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv992)) : 'freshtv994)
        | _ ->
            _menhir_fail ()) : 'freshtv996)) : 'freshtv998)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv999 * _menhir_state * 'tv_rev_implements_interfaces) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv1000)) : 'freshtv1002)

and _menhir_goto_tpe : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_tpe -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState258 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv979 * _menhir_state) * _menhir_state * 'tv_tpe) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_SQ_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv975 * _menhir_state) * _menhir_state * 'tv_tpe) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv973 * _menhir_state) * _menhir_state * 'tv_tpe) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (t : 'tv_tpe)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_list_type = 
# 674 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( t )
# 3800 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv971) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_list_type) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv969 * _menhir_state * 'tv_list_type) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXCLAMATION ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv963 * _menhir_state * 'tv_list_type) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv961 * _menhir_state * 'tv_list_type) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (n : 'tv_list_type)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_non_null_type = 
# 682 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( ListType n )
# 3823 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_non_null_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv962)) : 'freshtv964)
            | AT | BLOCK_STRING _ | DIRECTIVE | DOLLAR | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EQUAL | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | R_PAREN | R_SQ_BRACKET | SCALAR | SCHEMA | STRING _ | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv965 * _menhir_state * 'tv_list_type) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (lt : 'tv_list_type)) = _menhir_stack in
                let _v : 'tv_tpe = 
# 667 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                            ( ListType lt )
# 3833 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_tpe _menhir_env _menhir_stack _menhir_s _v) : 'freshtv966)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv967 * _menhir_state * 'tv_list_type) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv968)) : 'freshtv970)) : 'freshtv972)) : 'freshtv974)) : 'freshtv976)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv977 * _menhir_state) * _menhir_state * 'tv_tpe) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv978)) : 'freshtv980)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv981 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name)) * _menhir_state * 'tv_tpe) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUAL ->
            _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | AT | BLOCK_STRING _ | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | R_PAREN | SCALAR | SCHEMA | STRING _ | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce221 _menhir_env (Obj.magic _menhir_stack) MenhirState266
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState266) : 'freshtv982)
    | MenhirState278 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv983 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_)) * _menhir_state * 'tv_tpe) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | BLOCK_STRING _ | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | SCALAR | SCHEMA | STRING _ | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState279
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState279) : 'freshtv984)
    | MenhirState415 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv985 * _menhir_state * 'tv_variable) * _menhir_state * 'tv_tpe) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUAL ->
            _menhir_run267 _menhir_env (Obj.magic _menhir_stack) MenhirState416
        | DOLLAR | R_PAREN ->
            _menhir_reduce221 _menhir_env (Obj.magic _menhir_stack) MenhirState416
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState416) : 'freshtv986)
    | _ ->
        _menhir_fail ()

and _menhir_goto_non_null_type : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_non_null_type -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv959) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_non_null_type) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv957) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((nnt : 'tv_non_null_type) : 'tv_non_null_type) = _v in
    ((let _v : 'tv_tpe = 
# 668 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                            ( NonNullType nnt )
# 3908 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_tpe _menhir_env _menhir_stack _menhir_s _v) : 'freshtv958)) : 'freshtv960)

and _menhir_goto_rev_union_member_types : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_rev_union_member_types -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv955 * _menhir_state * 'tv_rev_union_member_types) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PIPE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv939 * _menhir_state * 'tv_rev_union_member_types) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState245 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState245
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState245) : 'freshtv940)
    | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | L_BRACKET | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv951 * _menhir_state * 'tv_rev_union_member_types) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (res : 'tv_rev_union_member_types)) = _menhir_stack in
        let _v : 'tv_union_member_types = 
# 719 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( List.rev res )
# 4011 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv949) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_union_member_types) = _v in
        ((match _menhir_s with
        | MenhirState238 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv943 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_union_member_types) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv941 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
            let (_ : _menhir_state) = _menhir_s in
            let ((mem : 'tv_union_member_types) : 'tv_union_member_types) = _v in
            ((let (((_menhir_stack, _menhir_s), _, (n : 'tv_name)), _, (ds : 'tv_option_directives_)) = _menhir_stack in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_union_type_extension = 
# 269 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ({name = n; directives = flat ds; types = mem })
# 4033 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_union_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv942)) : 'freshtv944)
        | MenhirState356 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv947) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_union_member_types) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv945) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((x : 'tv_union_member_types) : 'tv_union_member_types) = _v in
            ((let _v : 'tv_option_union_member_types_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 4048 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_option_union_member_types_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv946)) : 'freshtv948)
        | _ ->
            _menhir_fail ()) : 'freshtv950)) : 'freshtv952)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv953 * _menhir_state * 'tv_rev_union_member_types) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv954)) : 'freshtv956)

and _menhir_reduce227 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_directives_nc_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 4066 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_option_directives_nc_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run168 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | EDIR_FIELD ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | EDIR_MUTATION ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | EDIR_QUERY ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | EDIR_SUBSCRIPTION ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | ENUM ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | EXTEND ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | FALSE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | FRAGMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | IMPLEMENTS ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | INPUT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | INTERFACE ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | NAME _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState168 _v
    | NULL ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | ON ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | OP_MUTATION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | OP_QUERY ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | OP_SUBSCRIPTION ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | SCALAR ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | SCHEMA ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TRUE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TSDIR_ENUM ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TSDIR_ENUM_VALUE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TSDIR_INPUT_OBJECT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TSDIR_INTERFACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TSDIR_OBJECT ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TSDIR_SCALAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TSDIR_SCHEMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TSDIR_UNION ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | TYPE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | UNION ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState168
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState168

and _menhir_goto_nonempty_list_opreation_type_definition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_opreation_type_definition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv905 * _menhir_state * 'tv_opreation_type_definition) * _menhir_state * 'tv_nonempty_list_opreation_type_definition_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv903 * _menhir_state * 'tv_opreation_type_definition) * _menhir_state * 'tv_nonempty_list_opreation_type_definition_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_opreation_type_definition)), _, (xs : 'tv_nonempty_list_opreation_type_definition_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_opreation_type_definition_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 4168 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_opreation_type_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv904)) : 'freshtv906)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv919 * _menhir_state) * _menhir_state * 'tv_option_directives_)) * _menhir_state * 'tv_nonempty_list_opreation_type_definition_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv915 * _menhir_state) * _menhir_state * 'tv_option_directives_)) * _menhir_state * 'tv_nonempty_list_opreation_type_definition_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv913 * _menhir_state) * _menhir_state * 'tv_option_directives_)) * _menhir_state * 'tv_nonempty_list_opreation_type_definition_) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (ds : 'tv_option_directives_)), _, (rotds : 'tv_nonempty_list_opreation_type_definition_)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_schema_definition = 
# 322 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    (let t: schema_definition = { directives = flat ds; operations = rotds } in t)
# 4190 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv911) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_schema_definition) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv909) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_schema_definition) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv907) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((d : 'tv_schema_definition) : 'tv_schema_definition) = _v in
            ((let _v : 'tv_type_system_definition = 
# 312 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                              ( SchemaDefinition d )
# 4207 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_type_system_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv908)) : 'freshtv910)) : 'freshtv912)) : 'freshtv914)) : 'freshtv916)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv917 * _menhir_state) * _menhir_state * 'tv_option_directives_)) * _menhir_state * 'tv_nonempty_list_opreation_type_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv918)) : 'freshtv920)
    | MenhirState303 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv937 * _menhir_state) * _menhir_state * 'tv_nonempty_list_opreation_type_definition_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv933 * _menhir_state) * _menhir_state * 'tv_nonempty_list_opreation_type_definition_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv931 * _menhir_state) * _menhir_state * 'tv_nonempty_list_opreation_type_definition_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (ops : 'tv_nonempty_list_opreation_type_definition_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_schema_extension_rest = 
# 184 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( ops )
# 4235 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv929) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_schema_extension_rest) = _v in
            ((match _menhir_s with
            | MenhirState302 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv923 * _menhir_state)) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_schema_extension_rest) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv921 * _menhir_state)) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((ops : 'tv_schema_extension_rest) : 'tv_schema_extension_rest) = _v in
                ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                let _2 = () in
                let _1 = () in
                let _v : 'tv_schema_extension = 
# 195 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    (let t: schema_extension = {directives = []; operations = ops} in t)
# 4257 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_schema_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv922)) : 'freshtv924)
            | MenhirState307 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv927) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_schema_extension_rest) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv925) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((x : 'tv_schema_extension_rest) : 'tv_schema_extension_rest) = _v in
                ((let _v : 'tv_option_schema_extension_rest_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 4272 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_option_schema_extension_rest_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv926)) : 'freshtv928)
            | _ ->
                _menhir_fail ()) : 'freshtv930)) : 'freshtv932)) : 'freshtv934)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv935 * _menhir_state) * _menhir_state * 'tv_nonempty_list_opreation_type_definition_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv936)) : 'freshtv938)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_arguments_ : _menhir_env -> 'ttv_tail -> 'tv_option_arguments_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv901 * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
    let (_v : 'tv_option_arguments_) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv899 * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
    let ((args : 'tv_option_arguments_) : 'tv_option_arguments_) = _v in
    ((let ((_menhir_stack, _menhir_s), _, (n : 'tv_name)) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_directive = 
# 364 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  (let r: vc directive = {name= n; arguments = flat args; } in r)
# 4300 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv897) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_directive) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv895 * _menhir_state * 'tv_directive) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState124
    | BLOCK_STRING _ | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EOF | EQUAL | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | L_BRACKET | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | R_PAREN | SCALAR | SCHEMA | STRING _ | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv893 * _menhir_state * 'tv_directive) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_directive)) = _menhir_stack in
        let _v : 'tv_nonempty_list_directive_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 4321 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_directive_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv894)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124) : 'freshtv896)) : 'freshtv898)) : 'freshtv900)) : 'freshtv902)

and _menhir_goto_nonempty_list_argument_nc_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_argument_nc_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv887 * _menhir_state) * _menhir_state * 'tv_nonempty_list_argument_nc_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv883 * _menhir_state) * _menhir_state * 'tv_nonempty_list_argument_nc_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv881 * _menhir_state) * _menhir_state * 'tv_nonempty_list_argument_nc_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (args : 'tv_nonempty_list_argument_nc_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_arguments_nc = 
# 378 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( args )
# 4351 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv879) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_arguments_nc) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv877) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_arguments_nc) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv875) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let ((x : 'tv_arguments_nc) : 'tv_arguments_nc) = _v in
            ((let _v : 'tv_option_arguments_nc_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 4368 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_option_arguments_nc_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv876)) : 'freshtv878)) : 'freshtv880)) : 'freshtv882)) : 'freshtv884)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv885 * _menhir_state) * _menhir_state * 'tv_nonempty_list_argument_nc_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv886)) : 'freshtv888)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv891 * _menhir_state * 'tv_argument_nc) * _menhir_state * 'tv_nonempty_list_argument_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv889 * _menhir_state * 'tv_argument_nc) * _menhir_state * 'tv_nonempty_list_argument_nc_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_argument_nc)), _, (xs : 'tv_nonempty_list_argument_nc_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_argument_nc_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 4387 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_argument_nc_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv890)) : 'freshtv892)
    | _ ->
        _menhir_fail ()

and _menhir_reduce126 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_value_nc_ = 
# 185 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [] )
# 4398 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_list_value_nc_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run175 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv873) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_value_nc = 
# 414 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          (BooleanValue true)
# 4412 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_value_nc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv874)

and _menhir_run176 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv871) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_value_nc = 
# 416 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          (NullValue)
# 4426 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_value_nc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv872)

and _menhir_run177 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
    | DIRECTIVE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | DOLLAR ->
        _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | EDIR_FIELD ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | EDIR_MUTATION ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | EDIR_QUERY ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | EDIR_SUBSCRIPTION ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | ENUM ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | EXTEND ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | FALSE ->
        _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | FLOAT _v ->
        _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
    | FRAGMENT ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | IMPLEMENTS ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | INPUT ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | INT _v ->
        _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
    | INTERFACE ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | L_BRACKET ->
        _menhir_run178 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | L_SQ_BRACKET ->
        _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | NAME _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
    | NULL ->
        _menhir_run176 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | ON ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | OP_MUTATION ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | OP_QUERY ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | OP_SUBSCRIPTION ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | SCALAR ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | SCHEMA ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState177 _v
    | TRUE ->
        _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TSDIR_ENUM ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TSDIR_ENUM_VALUE ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TSDIR_INPUT_OBJECT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TSDIR_INTERFACE ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TSDIR_OBJECT ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TSDIR_SCALAR ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TSDIR_SCHEMA ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TSDIR_UNION ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | TYPE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | UNION ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | R_SQ_BRACKET ->
        _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState177
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState177

and _menhir_run178 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | EDIR_FIELD ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | EDIR_MUTATION ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | EDIR_QUERY ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | EDIR_SUBSCRIPTION ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | ENUM ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | EXTEND ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | FALSE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | FRAGMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | IMPLEMENTS ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | INPUT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | INTERFACE ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | NAME _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState178 _v
    | NULL ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | ON ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | OP_MUTATION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | OP_QUERY ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | OP_SUBSCRIPTION ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | SCALAR ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | SCHEMA ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TRUE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TSDIR_ENUM ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TSDIR_ENUM_VALUE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TSDIR_INPUT_OBJECT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TSDIR_INTERFACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TSDIR_OBJECT ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TSDIR_SCALAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TSDIR_SCHEMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TSDIR_UNION ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | TYPE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | UNION ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | R_BRACKET ->
        _menhir_reduce122 _menhir_env (Obj.magic _menhir_stack) MenhirState178
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState178

and _menhir_run182 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 59 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 4621 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv869) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 59 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 4631 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) : (
# 59 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 4635 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) = _v in
    ((let _v : 'tv_value_nc = 
# 411 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          (IntValue (Int32.of_string i))
# 4640 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_value_nc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv870)

and _menhir_run183 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 60 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 4647 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv867) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((f : (
# 60 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 4657 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) : (
# 60 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 4661 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) = _v in
    ((let _v : 'tv_value_nc = 
# 412 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          (FloatValue f)
# 4666 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_value_nc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv868)

and _menhir_run184 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv865) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_value_nc = 
# 415 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          (BooleanValue false)
# 4680 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_value_nc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv866)

and _menhir_run185 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | EDIR_FIELD ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | EDIR_MUTATION ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | EDIR_QUERY ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | EDIR_SUBSCRIPTION ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | ENUM ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | EXTEND ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | FALSE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | FRAGMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | IMPLEMENTS ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | INPUT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | INTERFACE ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | NAME _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState185 _v
    | NULL ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | ON ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | OP_MUTATION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | OP_QUERY ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | OP_SUBSCRIPTION ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | SCALAR ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | SCHEMA ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TRUE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TSDIR_ENUM ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TSDIR_ENUM_VALUE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TSDIR_INPUT_OBJECT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TSDIR_INTERFACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TSDIR_OBJECT ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TSDIR_SCALAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TSDIR_SCHEMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TSDIR_UNION ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | TYPE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | UNION ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState185
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState185

and _menhir_reduce122 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_object_field_nc_ = 
# 185 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [] )
# 4774 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_list_object_field_nc_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_option_default_value_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_default_value_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv853 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name)) * _menhir_state * 'tv_tpe) * _menhir_state * 'tv_option_default_value_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState269
        | BLOCK_STRING _ | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | R_PAREN | SCALAR | SCHEMA | STRING _ | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState269
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState269) : 'freshtv854)
    | MenhirState416 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv863 * _menhir_state * 'tv_variable) * _menhir_state * 'tv_tpe) * _menhir_state * 'tv_option_default_value_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv861 * _menhir_state * 'tv_variable) * _menhir_state * 'tv_tpe) * _menhir_state * 'tv_option_default_value_) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (v : 'tv_variable)), _, (t : 'tv_tpe)), _, (df : 'tv_option_default_value_)) = _menhir_stack in
        let _v : 'tv_variable_definition = 
# 113 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({
    variable = v;
    tpe = t;
    defaultValue = df;
  })
# 4809 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv859) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_variable_definition) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv857 * _menhir_state * 'tv_variable_definition) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOLLAR ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState414
        | R_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv855 * _menhir_state * 'tv_variable_definition) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_variable_definition)) = _menhir_stack in
            let _v : 'tv_nonempty_list_variable_definition_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 4830 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_nonempty_list_variable_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv856)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState414) : 'freshtv858)) : 'freshtv860)) : 'freshtv862)) : 'freshtv864)
    | _ ->
        _menhir_fail ()

and _menhir_goto_nonempty_list_argument_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_nonempty_list_argument_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv847) * _menhir_state * 'tv_nonempty_list_argument_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | R_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv843) * _menhir_state * 'tv_nonempty_list_argument_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv841) * _menhir_state * 'tv_nonempty_list_argument_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _, (args : 'tv_nonempty_list_argument_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_arguments = 
# 372 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( args )
# 4862 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv839) = _menhir_stack in
            let (_v : 'tv_arguments) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv837) = Obj.magic _menhir_stack in
            let (_v : 'tv_arguments) = _v in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv835) = Obj.magic _menhir_stack in
            let ((x : 'tv_arguments) : 'tv_arguments) = _v in
            ((let _v : 'tv_option_arguments_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 4876 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_option_arguments_ _menhir_env _menhir_stack _v) : 'freshtv836)) : 'freshtv838)) : 'freshtv840)) : 'freshtv842)) : 'freshtv844)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv845) * _menhir_state * 'tv_nonempty_list_argument_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv846)) : 'freshtv848)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv851 * _menhir_state * 'tv_argument) * _menhir_state * 'tv_nonempty_list_argument_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv849 * _menhir_state * 'tv_argument) * _menhir_state * 'tv_nonempty_list_argument_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_argument)), _, (xs : 'tv_nonempty_list_argument_)) = _menhir_stack in
        let _v : 'tv_nonempty_list_argument_ = 
# 197 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( x :: xs )
# 4895 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_nonempty_list_argument_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv850)) : 'freshtv852)
    | _ ->
        _menhir_fail ()

and _menhir_reduce124 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_value_ = 
# 185 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [] )
# 4906 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_list_value_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run60 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv833) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_value = 
# 403 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        (let v: vc = BooleanValue true in v)
# 4920 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv834)

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv831) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_value = 
# 405 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        (let v: vc = NullValue in v)
# 4934 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv832)

and _menhir_run69 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BLOCK_STRING _v ->
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | DIRECTIVE ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | EDIR_FIELD ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | EDIR_MUTATION ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | EDIR_QUERY ->
        _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | EDIR_SUBSCRIPTION ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | ENUM ->
        _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | EXTEND ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | FALSE ->
        _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | FLOAT _v ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | FRAGMENT ->
        _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | IMPLEMENTS ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | INPUT ->
        _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | INT _v ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | INTERFACE ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | L_BRACKET ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | L_SQ_BRACKET ->
        _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | NAME _v ->
        _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | NULL ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | ON ->
        _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | OP_MUTATION ->
        _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | OP_QUERY ->
        _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | OP_SUBSCRIPTION ->
        _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | SCALAR ->
        _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | SCHEMA ->
        _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
    | TRUE ->
        _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TSDIR_ENUM ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TSDIR_ENUM_VALUE ->
        _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TSDIR_INPUT_OBJECT ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TSDIR_INTERFACE ->
        _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TSDIR_OBJECT ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TSDIR_SCALAR ->
        _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TSDIR_SCHEMA ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TSDIR_UNION ->
        _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | TYPE ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | UNION ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | R_SQ_BRACKET ->
        _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState69
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69

and _menhir_run70 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EDIR_FIELD ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EDIR_MUTATION ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EDIR_QUERY ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EDIR_SUBSCRIPTION ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | ENUM ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | EXTEND ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | FALSE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | FRAGMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | IMPLEMENTS ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | INPUT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | INTERFACE ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | NAME _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
    | NULL ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | ON ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OP_MUTATION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OP_QUERY ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | OP_SUBSCRIPTION ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | SCALAR ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | SCHEMA ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TRUE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TSDIR_ENUM ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TSDIR_ENUM_VALUE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TSDIR_INPUT_OBJECT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TSDIR_INTERFACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TSDIR_OBJECT ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TSDIR_SCALAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TSDIR_SCHEMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TSDIR_UNION ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | TYPE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | UNION ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | R_BRACKET ->
        _menhir_reduce120 _menhir_env (Obj.magic _menhir_stack) MenhirState70
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70

and _menhir_run75 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 59 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 5127 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv829) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((i : (
# 59 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 5137 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) : (
# 59 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 5141 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) = _v in
    ((let _v : 'tv_value = 
# 400 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        (let v: vc = IntValue (Int32.of_string i) in v )
# 5146 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv830)

and _menhir_run79 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 60 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 5153 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv827) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((f : (
# 60 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 5163 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) : (
# 60 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 5167 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) = _v in
    ((let _v : 'tv_value = 
# 401 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        (let v: vc = FloatValue f in v)
# 5172 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv828)

and _menhir_run80 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv825) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_value = 
# 404 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        (let v: vc = BooleanValue false in v)
# 5186 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv826)

and _menhir_reduce120 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_object_field_ = 
# 185 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [] )
# 5195 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_list_object_field_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv823) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 513 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "union" )
# 5209 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv824)

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv821) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 506 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "type" )
# 5223 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv822)

and _menhir_run49 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv819) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 530 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                 ("UNION" )
# 5237 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv820)

and _menhir_run50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv817) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 524 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ("SCHEMA" )
# 5251 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv818)

and _menhir_run51 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv815) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 525 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ("SCALAR" )
# 5265 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv816)

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv813) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 526 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ("OBJECT" )
# 5279 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv814)

and _menhir_run53 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv811) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 529 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                     ("INTERFACE" )
# 5293 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv812)

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv809) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 533 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        ("INPUT_OBJECT" )
# 5307 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv810)

and _menhir_run55 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv807) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 534 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                  ("INPUT_FIELD_DEFINITION" )
# 5321 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv808)

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv805) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 527 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                            ("FIELD_DEFINITION" )
# 5335 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv806)

and _menhir_run57 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv803) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 532 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ("ENUM_VALUE" )
# 5349 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv804)

and _menhir_run58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv801) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 531 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ("ENUM" )
# 5363 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv802)

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv799) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 528 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                               ("ARGUMENT_DEFINITION" )
# 5377 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv800)

and _menhir_run61 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv797) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 505 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "schema" )
# 5391 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv798)

and _menhir_run62 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv795) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 511 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "scalar" )
# 5405 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv796)

and _menhir_run63 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv793) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 516 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "subscription" )
# 5419 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv794)

and _menhir_run64 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv791) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 515 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "query" )
# 5433 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv792)

and _menhir_run65 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv789) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 514 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "mutation" )
# 5447 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv790)

and _menhir_run66 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv787) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 502 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "on" )
# 5461 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv788)

and _menhir_run68 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 56 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 5468 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv785) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((n : (
# 56 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 5478 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) : (
# 56 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 5482 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) = _v in
    ((let _v : 'tv_enum_value = 
# 501 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( n )
# 5487 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv786)

and _menhir_run74 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv783) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 508 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "interface" )
# 5501 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv784)

and _menhir_run76 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv781) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 512 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "input" )
# 5515 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv782)

and _menhir_run77 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv779) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 509 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "implements" )
# 5529 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv780)

and _menhir_run78 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv777) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 504 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "fragment" )
# 5543 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv778)

and _menhir_run81 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv775) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 503 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "extend" )
# 5557 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv776)

and _menhir_run82 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv773) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 507 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "enum" )
# 5571 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv774)

and _menhir_run83 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv771) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 519 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                       ("SUBSCRIPTION" )
# 5585 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv772)

and _menhir_run84 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv769) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 517 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ("QUERY" )
# 5599 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv770)

and _menhir_run85 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv767) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 518 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                   ("MUTATION" )
# 5613 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv768)

and _menhir_run86 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv765) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 523 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          ("INLINE_FRAGMENT" )
# 5627 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv766)

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv763) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 522 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          ("FRAGMENT_SPREAD" )
# 5641 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv764)

and _menhir_run88 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv761) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 521 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                              ("FRAGMENT_DEFINITION" )
# 5655 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv762)

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv759) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 520 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ("FIELD" )
# 5669 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv760)

and _menhir_run90 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv757) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_enum_value = 
# 510 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "directive" )
# 5683 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_enum_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv758)

and _menhir_goto_option_directives_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_directives_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv691 * _menhir_state) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv687 * _menhir_state) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | OP_MUTATION ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState110
            | OP_QUERY ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState110
            | OP_SUBSCRIPTION ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState110
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110) : 'freshtv688)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv689 * _menhir_state) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv690)) : 'freshtv692)
    | MenhirState237 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv693 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUAL ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState238
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState238) : 'freshtv694)
    | MenhirState269 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv703 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name)) * _menhir_state * 'tv_tpe) * _menhir_state * 'tv_option_default_value_) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv701 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name)) * _menhir_state * 'tv_tpe) * _menhir_state * 'tv_option_default_value_) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s, (ds : 'tv_option_description_)), _, (n : 'tv_name)), _, (t : 'tv_tpe)), _, (dv : 'tv_option_default_value_)), _, (dirs : 'tv_option_directives_)) = _menhir_stack in
        let _3 = () in
        let _v : 'tv_input_value_definition = 
# 706 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({ description = ds; name = n; tpe = t; defaultValue = dv; directives = flat dirs })
# 5742 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv699) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_input_value_definition) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv697 * _menhir_state * 'tv_input_value_definition) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BLOCK_STRING _v ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState274 _v
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState274 _v
        | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce223 _menhir_env (Obj.magic _menhir_stack) MenhirState274
        | R_BRACKET | R_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv695 * _menhir_state * 'tv_input_value_definition) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_input_value_definition)) = _menhir_stack in
            let _v : 'tv_nonempty_list_input_value_definition_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 5767 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_nonempty_list_input_value_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv696)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState274) : 'freshtv698)) : 'freshtv700)) : 'freshtv702)) : 'freshtv704)
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv713 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_)) * _menhir_state * 'tv_tpe) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv711 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_)) * _menhir_state * 'tv_tpe) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (((((_menhir_stack, _menhir_s, (ds : 'tv_option_description_)), _, (n : 'tv_name)), _, (args : 'tv_option_arguments_definition_)), _, (t : 'tv_tpe)), _, (dirs : 'tv_option_directives_)) = _menhir_stack in
        let _4 = () in
        let _v : 'tv_field_definition = 
# 656 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({ 
    description = ds; 
    name = n; 
    arguments = flat args; 
    tpe = t;
    directives = flat dirs; 
    })
# 5790 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv709) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_field_definition) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv707 * _menhir_state * 'tv_field_definition) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BLOCK_STRING _v ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState284 _v
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState284 _v
        | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce223 _menhir_env (Obj.magic _menhir_stack) MenhirState284
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv705 * _menhir_state * 'tv_field_definition) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_field_definition)) = _menhir_stack in
            let _v : 'tv_nonempty_list_field_definition_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 5815 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_nonempty_list_field_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv706)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState284) : 'freshtv708)) : 'freshtv710)) : 'freshtv712)) : 'freshtv714)
    | MenhirState311 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv723 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv721 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (n : 'tv_name)), _, (ds : 'tv_option_directives_)) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_scalar_type_extension = 
# 216 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({ name = n; directives = flat ds })
# 5833 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv719) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_scalar_type_extension) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv717) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_scalar_type_extension) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv715) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((s : 'tv_scalar_type_extension) : 'tv_scalar_type_extension) = _v in
        ((let _v : 'tv_type_extension = 
# 199 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( ScalarTypeExtension s )
# 5850 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_type_extension _menhir_env _menhir_stack _menhir_s _v) : 'freshtv716)) : 'freshtv718)) : 'freshtv720)) : 'freshtv722)) : 'freshtv724)
    | MenhirState332 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv733 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_enum_value) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv731 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_enum_value) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (ds : 'tv_option_description_)), _, (v : 'tv_enum_value)), _, (dirs : 'tv_option_directives_)) = _menhir_stack in
        let _v : 'tv_enum_value_definition = 
# 626 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({description = ds; value = v; directives = flat dirs})
# 5862 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv729) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_enum_value_definition) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv727 * _menhir_state * 'tv_enum_value_definition) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BLOCK_STRING _v ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState336 _v
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState336 _v
        | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce223 _menhir_env (Obj.magic _menhir_stack) MenhirState336
        | R_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv725 * _menhir_state * 'tv_enum_value_definition) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_enum_value_definition)) = _menhir_stack in
            let _v : 'tv_nonempty_list_enum_value_definition_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 5887 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_nonempty_list_enum_value_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv726)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState336) : 'freshtv728)) : 'freshtv730)) : 'freshtv732)) : 'freshtv734)
    | MenhirState355 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv737 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | EQUAL ->
            _menhir_run239 _menhir_env (Obj.magic _menhir_stack) MenhirState356
        | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | L_BRACKET | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv735) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState356 in
            ((let _v : 'tv_option_union_member_types_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 5909 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_option_union_member_types_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv736)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState356) : 'freshtv738)
    | MenhirState361 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv739 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_implements_interfaces_) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run250 _menhir_env (Obj.magic _menhir_stack) MenhirState362
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState362) : 'freshtv740)
    | MenhirState366 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv749 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv747 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s, (ds : 'tv_option_description_)), _, (n : 'tv_name)), _, (dirs : 'tv_option_directives_)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_scalar_type_definition = 
# 602 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({ description = ds; name = n; directives = flat dirs})
# 5938 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv745) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_scalar_type_definition) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv743) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_scalar_type_definition) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv741) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((d : 'tv_scalar_type_definition) : 'tv_scalar_type_definition) = _v in
        ((let _v : 'tv_type_definition = 
# 574 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                      ( ScalarTypeDefinition d )
# 5955 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_type_definition _menhir_env _menhir_stack _menhir_s _v) : 'freshtv742)) : 'freshtv744)) : 'freshtv746)) : 'freshtv748)) : 'freshtv750)
    | MenhirState369 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv751 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run250 _menhir_env (Obj.magic _menhir_stack) MenhirState370
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState370) : 'freshtv752)
    | MenhirState373 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv753 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run321 _menhir_env (Obj.magic _menhir_stack) MenhirState374
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState374) : 'freshtv754)
    | MenhirState377 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv755 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_BRACKET ->
            _menhir_run330 _menhir_env (Obj.magic _menhir_stack) MenhirState378
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState378) : 'freshtv756)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_name_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_name_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv685 * _menhir_state * 'tv_operation_type) * _menhir_state * 'tv_option_name_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | L_PAREN ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv679) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DOLLAR ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState413
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState413) : 'freshtv680)
    | AT | L_BRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv681) = Obj.magic _menhir_stack in
        ((let _v : 'tv_option_variable_definitions_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 6023 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_option_variable_definitions_ _menhir_env _menhir_stack _v) : 'freshtv682)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv683 * _menhir_state * 'tv_operation_type) * _menhir_state * 'tv_option_name_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv684)) : 'freshtv686)

and _menhir_goto_option_type_condition_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_type_condition_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv677 * _menhir_state) * _menhir_state * 'tv_option_type_condition_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AT ->
        _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState167
    | L_BRACKET ->
        _menhir_reduce227 _menhir_env (Obj.magic _menhir_stack) MenhirState167
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState167) : 'freshtv678)

and _menhir_run147 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | EDIR_FIELD ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | EDIR_MUTATION ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | EDIR_QUERY ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | EDIR_SUBSCRIPTION ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | ENUM ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | EXTEND ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | FALSE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | FRAGMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | IMPLEMENTS ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | INPUT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | INTERFACE ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | NAME _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState147 _v
    | NULL ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | ON ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | OP_MUTATION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | OP_QUERY ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | OP_SUBSCRIPTION ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | SCALAR ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | SCHEMA ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TRUE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TSDIR_ENUM ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TSDIR_ENUM_VALUE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TSDIR_INPUT_OBJECT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TSDIR_INTERFACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TSDIR_OBJECT ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TSDIR_SCALAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TSDIR_SCHEMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TSDIR_UNION ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | TYPE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | UNION ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState147
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147

and _menhir_goto_fragment_name : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_fragment_name -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv673 * _menhir_state) * _menhir_state * 'tv_fragment_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState211
        | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | SCALAR | SCHEMA | SPREAD | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce227 _menhir_env (Obj.magic _menhir_stack) MenhirState211
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState211) : 'freshtv674)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv675 * _menhir_state) * _menhir_state * 'tv_fragment_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ON ->
            _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState231
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState231) : 'freshtv676)
    | _ ->
        _menhir_fail ()

and _menhir_goto_name : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_name -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv533 * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv527) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState42
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42) : 'freshtv528)
        | AT | BLOCK_STRING _ | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EOF | EQUAL | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | L_BRACKET | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | R_PAREN | SCALAR | SCHEMA | STRING _ | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv529) = Obj.magic _menhir_stack in
            ((let _v : 'tv_option_arguments_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 6269 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_option_arguments_ _menhir_env _menhir_stack _v) : 'freshtv530)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv531 * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv532)) : 'freshtv534)
    | MenhirState105 | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv539 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv535 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BLOCK_STRING _v ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | DIRECTIVE ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | EDIR_FIELD ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | EDIR_MUTATION ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | EDIR_QUERY ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | EDIR_SUBSCRIPTION ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | ENUM ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | EXTEND ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | FALSE ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | FLOAT _v ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | FRAGMENT ->
                _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | IMPLEMENTS ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | INPUT ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | INT _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | INTERFACE ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | L_BRACKET ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | L_SQ_BRACKET ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | NAME _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | NULL ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | ON ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | OP_MUTATION ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | OP_QUERY ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | OP_SUBSCRIPTION ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | SCALAR ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | SCHEMA ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | STRING _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | TRUE ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TSDIR_ENUM ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TSDIR_ENUM_VALUE ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TSDIR_INPUT_OBJECT ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TSDIR_INTERFACE ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TSDIR_OBJECT ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TSDIR_SCALAR ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TSDIR_SCHEMA ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TSDIR_UNION ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TYPE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | UNION ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46) : 'freshtv536)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv537 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv538)) : 'freshtv540)
    | MenhirState70 | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv545 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv541 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BLOCK_STRING _v ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
            | DIRECTIVE ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | EDIR_FIELD ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | EDIR_MUTATION ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | EDIR_QUERY ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | EDIR_SUBSCRIPTION ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | ENUM ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | EXTEND ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | FALSE ->
                _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | FLOAT _v ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
            | FRAGMENT ->
                _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | IMPLEMENTS ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | INPUT ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | INT _v ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
            | INTERFACE ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | L_BRACKET ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | L_SQ_BRACKET ->
                _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | NAME _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
            | NULL ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | ON ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | OP_MUTATION ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | OP_QUERY ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | OP_SUBSCRIPTION ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | SCALAR ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | SCHEMA ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | STRING _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
            | TRUE ->
                _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TSDIR_ENUM ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TSDIR_ENUM_VALUE ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TSDIR_INPUT_OBJECT ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TSDIR_INTERFACE ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TSDIR_OBJECT ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TSDIR_SCALAR ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TSDIR_SCHEMA ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TSDIR_UNION ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | TYPE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | UNION ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState73
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73) : 'freshtv542)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv543 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv544)) : 'freshtv546)
    | MenhirState415 | MenhirState291 | MenhirState288 | MenhirState278 | MenhirState257 | MenhirState258 | MenhirState245 | MenhirState241 | MenhirState147 | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv599 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv597 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (n : 'tv_name)) = _menhir_stack in
        let _v : 'tv_named_type = 
# 338 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( n )
# 6506 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv595) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_named_type) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState116 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv555 * _menhir_state * 'tv_operation_type)) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv553 * _menhir_state * 'tv_operation_type)) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (op : 'tv_operation_type)), _, (n : 'tv_named_type)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_opreation_type_definition = 
# 328 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({ operation = op; tpe = n })
# 6524 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv551) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_opreation_type_definition) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv549 * _menhir_state * 'tv_opreation_type_definition) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | OP_MUTATION ->
                _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | OP_QUERY ->
                _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | OP_SUBSCRIPTION ->
                _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState114
            | R_BRACKET ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv547 * _menhir_state * 'tv_opreation_type_definition) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (x : 'tv_opreation_type_definition)) = _menhir_stack in
                let _v : 'tv_nonempty_list_opreation_type_definition_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 6549 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_nonempty_list_opreation_type_definition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv548)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114) : 'freshtv550)) : 'freshtv552)) : 'freshtv554)) : 'freshtv556)
        | MenhirState147 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv567 * _menhir_state) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv565 * _menhir_state) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (nt : 'tv_named_type)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_type_condition = 
# 178 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( nt )
# 6566 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv563) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_type_condition) = _v in
            ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            match _menhir_s with
            | MenhirState127 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv559 * _menhir_state * 'tv_type_condition) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv557 * _menhir_state * 'tv_type_condition) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (x : 'tv_type_condition)) = _menhir_stack in
                let _v : 'tv_option_type_condition_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 6583 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_option_type_condition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv558)) : 'freshtv560)
            | MenhirState231 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv561 * _menhir_state) * _menhir_state * 'tv_fragment_name) * _menhir_state * 'tv_type_condition) = Obj.magic _menhir_stack in
                ((assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | AT ->
                    _menhir_run168 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | L_BRACKET ->
                    _menhir_reduce227 _menhir_env (Obj.magic _menhir_stack) MenhirState232
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState232) : 'freshtv562)
            | _ ->
                _menhir_fail ()) : 'freshtv564)) : 'freshtv566)) : 'freshtv568)
        | MenhirState241 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv571 * _menhir_state) * _menhir_state * 'tv_option_PIPE_) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv569 * _menhir_state) * _menhir_state * 'tv_option_PIPE_) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_2 : 'tv_option_PIPE_)), _, (nt : 'tv_named_type)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_rev_union_member_types = 
# 724 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( nt::[] )
# 6612 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_rev_union_member_types _menhir_env _menhir_stack _menhir_s _v) : 'freshtv570)) : 'freshtv572)
        | MenhirState245 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv575 * _menhir_state * 'tv_rev_union_member_types)) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv573 * _menhir_state * 'tv_rev_union_member_types)) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (nts : 'tv_rev_union_member_types)), _, (nt : 'tv_named_type)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_rev_union_member_types = 
# 728 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( nt::nts )
# 6625 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_rev_union_member_types _menhir_env _menhir_stack _menhir_s _v) : 'freshtv574)) : 'freshtv576)
        | MenhirState415 | MenhirState278 | MenhirState257 | MenhirState258 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv585 * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | EXCLAMATION ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv579 * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv577 * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (n : 'tv_named_type)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_non_null_type = 
# 679 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( NamedType n )
# 6645 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_non_null_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv578)) : 'freshtv580)
            | AT | BLOCK_STRING _ | DIRECTIVE | DOLLAR | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EQUAL | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | R_PAREN | R_SQ_BRACKET | SCALAR | SCHEMA | STRING _ | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv581 * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (nt : 'tv_named_type)) = _menhir_stack in
                let _v : 'tv_tpe = 
# 666 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                            ( NamedType nt )
# 6655 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
                 in
                _menhir_goto_tpe _menhir_env _menhir_stack _menhir_s _v) : 'freshtv582)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv583 * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv584)) : 'freshtv586)
        | MenhirState288 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv589 * _menhir_state) * 'tv_option_AMPERSAND_) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv587 * _menhir_state) * 'tv_option_AMPERSAND_) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), (_2 : 'tv_option_AMPERSAND_)), _, (nt : 'tv_named_type)) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_rev_implements_interfaces = 
# 799 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( nt::[] )
# 6675 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_rev_implements_interfaces _menhir_env _menhir_stack _menhir_s _v) : 'freshtv588)) : 'freshtv590)
        | MenhirState291 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv593 * _menhir_state * 'tv_rev_implements_interfaces)) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv591 * _menhir_state * 'tv_rev_implements_interfaces)) * _menhir_state * 'tv_named_type) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (nts : 'tv_rev_implements_interfaces)), _, (nt : 'tv_named_type)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_rev_implements_interfaces = 
# 803 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( nt::nts )
# 6688 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_rev_implements_interfaces _menhir_env _menhir_stack _menhir_s _v) : 'freshtv592)) : 'freshtv594)
        | _ ->
            _menhir_fail ()) : 'freshtv596)) : 'freshtv598)) : 'freshtv600)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv601 * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PAREN ->
            _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | AT | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | L_BRACKET | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | SCALAR | SCHEMA | SPREAD | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce219 _menhir_env (Obj.magic _menhir_stack) MenhirState169
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState169) : 'freshtv602)
    | MenhirState201 | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv607 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv603 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BLOCK_STRING _v ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _v
            | DIRECTIVE ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | DOLLAR ->
                _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | EDIR_FIELD ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | EDIR_MUTATION ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | EDIR_QUERY ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | EDIR_SUBSCRIPTION ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | ENUM ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | EXTEND ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | FALSE ->
                _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | FLOAT _v ->
                _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _v
            | FRAGMENT ->
                _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | IMPLEMENTS ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | INPUT ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | INT _v ->
                _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _v
            | INTERFACE ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | L_BRACKET ->
                _menhir_run178 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | L_SQ_BRACKET ->
                _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | NAME _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _v
            | NULL ->
                _menhir_run176 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | ON ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | OP_MUTATION ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | OP_QUERY ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | OP_SUBSCRIPTION ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | SCALAR ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | SCHEMA ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | STRING _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState174 _v
            | TRUE ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TSDIR_ENUM ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TSDIR_ENUM_VALUE ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TSDIR_INPUT_OBJECT ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TSDIR_INTERFACE ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TSDIR_OBJECT ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TSDIR_SCALAR ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TSDIR_SCHEMA ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TSDIR_UNION ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | TYPE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | UNION ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState174
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState174) : 'freshtv604)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv605 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv606)) : 'freshtv608)
    | MenhirState178 | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv613 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv609 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | BLOCK_STRING _v ->
                _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
            | DIRECTIVE ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | DOLLAR ->
                _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | EDIR_FIELD ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | EDIR_MUTATION ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | EDIR_QUERY ->
                _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | EDIR_SUBSCRIPTION ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | ENUM ->
                _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | EXTEND ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | FALSE ->
                _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | FLOAT _v ->
                _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
            | FRAGMENT ->
                _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | IMPLEMENTS ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | INPUT ->
                _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | INT _v ->
                _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
            | INTERFACE ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | L_BRACKET ->
                _menhir_run178 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | L_SQ_BRACKET ->
                _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | NAME _v ->
                _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
            | NULL ->
                _menhir_run176 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | ON ->
                _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | OP_MUTATION ->
                _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | OP_QUERY ->
                _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | OP_SUBSCRIPTION ->
                _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | SCALAR ->
                _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | SCHEMA ->
                _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | STRING _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState181 _v
            | TRUE ->
                _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TSDIR_ENUM ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TSDIR_ENUM_VALUE ->
                _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TSDIR_INPUT_OBJECT ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TSDIR_INTERFACE ->
                _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TSDIR_OBJECT ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TSDIR_SCALAR ->
                _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TSDIR_SCHEMA ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TSDIR_UNION ->
                _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | TYPE ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | UNION ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState181
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState181) : 'freshtv610)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv611 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv612)) : 'freshtv614)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv625 * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv623 * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (n : 'tv_name)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_variable = 
# 344 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( n )
# 6939 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv621) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_variable) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState174 | MenhirState196 | MenhirState177 | MenhirState181 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv617 * _menhir_state * 'tv_variable) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv615 * _menhir_state * 'tv_variable) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (v : 'tv_variable)) = _menhir_stack in
            let _v : 'tv_value_nc = 
# 417 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          ( Variable v )
# 6956 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_value_nc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv616)) : 'freshtv618)
        | MenhirState413 | MenhirState414 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv619 * _menhir_state * 'tv_variable) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | L_SQ_BRACKET ->
                _menhir_run258 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState415 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState415
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState415) : 'freshtv620)
        | _ ->
            _menhir_fail ()) : 'freshtv622)) : 'freshtv624)) : 'freshtv626)
    | MenhirState126 | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv629 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv627 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState215 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState216 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState216
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState216) : 'freshtv628)
        | L_PAREN ->
            _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState215
        | AT | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | L_BRACKET | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | SCALAR | SCHEMA | SPREAD | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce219 _menhir_env (Obj.magic _menhir_stack) MenhirState215
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState215) : 'freshtv630)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv631 * _menhir_state * 'tv_name) * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PAREN ->
            _menhir_run170 _menhir_env (Obj.magic _menhir_stack) MenhirState217
        | AT | DIRECTIVE | EDIR_FIELD | EDIR_FRAGMENT_DEFINITION | EDIR_FRAGMENT_SPREAD | EDIR_INLINE_FRAGMENT | EDIR_MUTATION | EDIR_QUERY | EDIR_SUBSCRIPTION | ENUM | EXTEND | FALSE | FRAGMENT | IMPLEMENTS | INPUT | INTERFACE | L_BRACKET | NAME _ | NULL | ON | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | R_BRACKET | SCALAR | SCHEMA | SPREAD | TRUE | TSDIR_ARGUMENT_DEFINITION | TSDIR_ENUM | TSDIR_ENUM_VALUE | TSDIR_FIELD_DEFINITION | TSDIR_INPUT_FIELD_DEFINITION | TSDIR_INPUT_OBJECT | TSDIR_INTERFACE | TSDIR_OBJECT | TSDIR_SCALAR | TSDIR_SCHEMA | TSDIR_UNION | TYPE | UNION ->
            _menhir_reduce219 _menhir_env (Obj.magic _menhir_stack) MenhirState217
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState217) : 'freshtv632)
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv633 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState237
        | EQUAL ->
            _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState237
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState237) : 'freshtv634)
    | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv635 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState249
        | IMPLEMENTS ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState249
        | L_BRACKET ->
            _menhir_run250 _menhir_env (Obj.magic _menhir_stack) MenhirState249
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState249) : 'freshtv636)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv637 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PAREN ->
            _menhir_run254 _menhir_env (Obj.magic _menhir_stack) MenhirState253
        | COLON ->
            _menhir_reduce217 _menhir_env (Obj.magic _menhir_stack) MenhirState253
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState253) : 'freshtv638)
    | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv643 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv639 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | L_SQ_BRACKET ->
                _menhir_run258 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState257 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState257
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState257) : 'freshtv640)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv641 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv642)) : 'freshtv644)
    | MenhirState310 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv645 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState311
        | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | L_BRACKET | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
            _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState311
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState311) : 'freshtv646)
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv647 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState314
        | L_BRACKET ->
            _menhir_run250 _menhir_env (Obj.magic _menhir_stack) MenhirState314
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState314) : 'freshtv648)
    | MenhirState319 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv649 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState320
        | L_BRACKET ->
            _menhir_run321 _menhir_env (Obj.magic _menhir_stack) MenhirState320
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState320) : 'freshtv650)
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv651 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState329
        | L_BRACKET ->
            _menhir_run330 _menhir_env (Obj.magic _menhir_stack) MenhirState329
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState329) : 'freshtv652)
    | MenhirState354 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv653 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState355
        | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EQUAL | EXTEND | FRAGMENT | INPUT | INTERFACE | L_BRACKET | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
            _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState355
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState355) : 'freshtv654)
    | MenhirState359 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv657 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IMPLEMENTS ->
            _menhir_run286 _menhir_env (Obj.magic _menhir_stack) MenhirState360
        | AT | L_BRACKET ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv655) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState360 in
            ((let _v : 'tv_option_implements_interfaces_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 7389 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_option_implements_interfaces_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv656)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState360) : 'freshtv658)
    | MenhirState365 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv659 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState366
        | BLOCK_STRING _ | DIRECTIVE | ENUM | EOF | EXTEND | FRAGMENT | INPUT | INTERFACE | L_BRACKET | OP_MUTATION | OP_QUERY | OP_SUBSCRIPTION | SCALAR | SCHEMA | STRING _ | TYPE | UNION ->
            _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState366
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState366) : 'freshtv660)
    | MenhirState368 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv661 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState369
        | L_BRACKET ->
            _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState369
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState369) : 'freshtv662)
    | MenhirState372 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv663 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState373
        | L_BRACKET ->
            _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState373
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState373) : 'freshtv664)
    | MenhirState376 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv665 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState377
        | L_BRACKET ->
            _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState377
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState377) : 'freshtv666)
    | MenhirState381 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv667 * _menhir_state * 'tv_option_description_))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | L_PAREN ->
            _menhir_run254 _menhir_env (Obj.magic _menhir_stack) MenhirState382
        | ON ->
            _menhir_reduce217 _menhir_env (Obj.magic _menhir_stack) MenhirState382
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState382) : 'freshtv668)
    | MenhirState411 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv671 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv669 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_name)) = _menhir_stack in
        let _v : 'tv_option_name_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 7475 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_option_name_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv670)) : 'freshtv672)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_value_nc : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_value_nc -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv513 * _menhir_state * 'tv_name)) * _menhir_state * 'tv_value_nc) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv511 * _menhir_state * 'tv_name)) * _menhir_state * 'tv_value_nc) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (n : 'tv_name)), _, (v : 'tv_value_nc)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_object_field_nc = 
# 571 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({name = n; value = v})
# 7500 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv509) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_object_field_nc) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv507 * _menhir_state * 'tv_object_field_nc) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState179 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | R_BRACKET ->
            _menhir_reduce122 _menhir_env (Obj.magic _menhir_stack) MenhirState179
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState179) : 'freshtv508)) : 'freshtv510)) : 'freshtv512)) : 'freshtv514)
    | MenhirState196 | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv515 * _menhir_state * 'tv_value_nc) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BLOCK_STRING _v ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
        | DIRECTIVE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | DOLLAR ->
            _menhir_run185 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | EDIR_FIELD ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | EDIR_MUTATION ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | EDIR_QUERY ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | EDIR_SUBSCRIPTION ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | ENUM ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | EXTEND ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | FALSE ->
            _menhir_run184 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | FLOAT _v ->
            _menhir_run183 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
        | FRAGMENT ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | IMPLEMENTS ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | INPUT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | INT _v ->
            _menhir_run182 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
        | INTERFACE ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | L_BRACKET ->
            _menhir_run178 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | L_SQ_BRACKET ->
            _menhir_run177 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | NAME _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
        | NULL ->
            _menhir_run176 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | ON ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | OP_MUTATION ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | OP_QUERY ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | OP_SUBSCRIPTION ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | SCALAR ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | SCHEMA ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState196 _v
        | TRUE ->
            _menhir_run175 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TSDIR_ENUM ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TSDIR_ENUM_VALUE ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TSDIR_INPUT_OBJECT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TSDIR_INTERFACE ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TSDIR_OBJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TSDIR_SCALAR ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TSDIR_SCHEMA ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TSDIR_UNION ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | TYPE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | UNION ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | R_SQ_BRACKET ->
            _menhir_reduce126 _menhir_env (Obj.magic _menhir_stack) MenhirState196
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState196) : 'freshtv516)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv525 * _menhir_state * 'tv_name)) * _menhir_state * 'tv_value_nc) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv523 * _menhir_state * 'tv_name)) * _menhir_state * 'tv_value_nc) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (n : 'tv_name)), _, (v : 'tv_value_nc)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_argument_nc = 
# 390 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({ name=n; value =v})
# 7702 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv521) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_argument_nc) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv519 * _menhir_state * 'tv_argument_nc) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState201 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState201
        | R_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv517 * _menhir_state * 'tv_argument_nc) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_argument_nc)) = _menhir_stack in
            let _v : 'tv_nonempty_list_argument_nc_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 7795 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_nonempty_list_argument_nc_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv518)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState201) : 'freshtv520)) : 'freshtv522)) : 'freshtv524)) : 'freshtv526)
    | _ ->
        _menhir_fail ()

and _menhir_goto_value : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_value -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv483 * _menhir_state * 'tv_name)) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv481 * _menhir_state * 'tv_name)) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (n : 'tv_name)), _, (v : 'tv_value)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_object_field = 
# 559 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({name = n; value = v})
# 7819 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv479) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_object_field) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv477 * _menhir_state * 'tv_object_field) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | R_BRACKET ->
            _menhir_reduce120 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv478)) : 'freshtv480)) : 'freshtv482)) : 'freshtv484)
    | MenhirState100 | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv485 * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | BLOCK_STRING _v ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | DIRECTIVE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | EDIR_FIELD ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | EDIR_MUTATION ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | EDIR_QUERY ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | EDIR_SUBSCRIPTION ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | ENUM ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | EXTEND ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | FALSE ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | FLOAT _v ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | FRAGMENT ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | IMPLEMENTS ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | INPUT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | INT _v ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | INTERFACE ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | L_BRACKET ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | L_SQ_BRACKET ->
            _menhir_run69 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | NAME _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | NULL ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | ON ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | OP_MUTATION ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | OP_QUERY ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | OP_SUBSCRIPTION ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | SCALAR ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | SCHEMA ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | STRING _v ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
        | TRUE ->
            _menhir_run60 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TSDIR_ENUM ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TSDIR_ENUM_VALUE ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TSDIR_INPUT_OBJECT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TSDIR_INTERFACE ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TSDIR_OBJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TSDIR_SCALAR ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TSDIR_SCHEMA ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TSDIR_UNION ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TYPE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | UNION ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | R_SQ_BRACKET ->
            _menhir_reduce124 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100) : 'freshtv486)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv495 * _menhir_state * 'tv_name)) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv493 * _menhir_state * 'tv_name)) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (n : 'tv_name)), _, (v : 'tv_value)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_argument = 
# 384 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ({ name=n; value =v})
# 8019 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv491) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_argument) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv489 * _menhir_state * 'tv_argument) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState105
        | R_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv487 * _menhir_state * 'tv_argument) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_argument)) = _menhir_stack in
            let _v : 'tv_nonempty_list_argument_ = 
# 195 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( [ x ] )
# 8112 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_nonempty_list_argument_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv488)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105) : 'freshtv490)) : 'freshtv492)) : 'freshtv494)) : 'freshtv496)
    | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv505 * _menhir_state) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv503 * _menhir_state) * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (v : 'tv_value)) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_default_value = 
# 733 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( v )
# 8129 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv501) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_default_value) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv499) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_default_value) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv497) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((x : 'tv_default_value) : 'tv_default_value) = _v in
        ((let _v : 'tv_option_default_value_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 8146 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_option_default_value_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv498)) : 'freshtv500)) : 'freshtv502)) : 'freshtv504)) : 'freshtv506)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_description_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_description_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState284 | MenhirState250 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv449 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState252 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState252
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState252) : 'freshtv450)
    | MenhirState321 | MenhirState274 | MenhirState254 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv451 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState255 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState255
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState255) : 'freshtv452)
    | MenhirState336 | MenhirState330 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv453 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | EDIR_FIELD ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run88 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run86 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | EDIR_MUTATION ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | EDIR_QUERY ->
            _menhir_run84 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | EDIR_SUBSCRIPTION ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | ENUM ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | EXTEND ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | FRAGMENT ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | IMPLEMENTS ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | INPUT ->
            _menhir_run76 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | INTERFACE ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | NAME _v ->
            _menhir_run68 _menhir_env (Obj.magic _menhir_stack) MenhirState331 _v
        | ON ->
            _menhir_run66 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | OP_MUTATION ->
            _menhir_run65 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | OP_QUERY ->
            _menhir_run64 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | OP_SUBSCRIPTION ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | SCALAR ->
            _menhir_run62 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | SCHEMA ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TSDIR_ENUM ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TSDIR_ENUM_VALUE ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TSDIR_INPUT_OBJECT ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TSDIR_INTERFACE ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TSDIR_OBJECT ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TSDIR_SCALAR ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TSDIR_SCHEMA ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TSDIR_UNION ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | TYPE ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | UNION ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState331
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState331) : 'freshtv454)
    | MenhirState441 | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv475 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv459 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | AT ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv455 * _menhir_state * 'tv_option_description_)) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | DIRECTIVE ->
                    _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | EDIR_FIELD ->
                    _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | EDIR_FRAGMENT_DEFINITION ->
                    _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | EDIR_FRAGMENT_SPREAD ->
                    _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | EDIR_INLINE_FRAGMENT ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | EDIR_MUTATION ->
                    _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | EDIR_QUERY ->
                    _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | EDIR_SUBSCRIPTION ->
                    _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | ENUM ->
                    _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | EXTEND ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | FALSE ->
                    _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | FRAGMENT ->
                    _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | IMPLEMENTS ->
                    _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | INPUT ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | INTERFACE ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | NAME _v ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState381 _v
                | NULL ->
                    _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | ON ->
                    _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | OP_MUTATION ->
                    _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | OP_QUERY ->
                    _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | OP_SUBSCRIPTION ->
                    _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | SCALAR ->
                    _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | SCHEMA ->
                    _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TRUE ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TSDIR_ARGUMENT_DEFINITION ->
                    _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TSDIR_ENUM ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TSDIR_ENUM_VALUE ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TSDIR_FIELD_DEFINITION ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TSDIR_INPUT_FIELD_DEFINITION ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TSDIR_INPUT_OBJECT ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TSDIR_INTERFACE ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TSDIR_OBJECT ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TSDIR_SCALAR ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TSDIR_SCHEMA ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TSDIR_UNION ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | TYPE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | UNION ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState381
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState381) : 'freshtv456)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv457 * _menhir_state * 'tv_option_description_)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv458)) : 'freshtv460)
        | ENUM ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv461 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState376 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState376
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState376) : 'freshtv462)
        | INPUT ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv463 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState372 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState372
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState372) : 'freshtv464)
        | INTERFACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv465 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState368 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState368
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState368) : 'freshtv466)
        | SCALAR ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv467 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState365 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState365
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState365) : 'freshtv468)
        | TYPE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv469 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState359 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState359
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState359) : 'freshtv470)
        | UNION ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv471 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState354 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState354
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState354) : 'freshtv472)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv473 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv474)) : 'freshtv476)
    | _ ->
        _menhir_fail ()

and _menhir_reduce225 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_directives_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 9024 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_option_directives_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_operation_type : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_operation_type -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState303 | MenhirState110 | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv443 * _menhir_state * 'tv_operation_type) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | COLON ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv439 * _menhir_state * 'tv_operation_type) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | DIRECTIVE ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | EDIR_FIELD ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | EDIR_FRAGMENT_DEFINITION ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | EDIR_FRAGMENT_SPREAD ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | EDIR_INLINE_FRAGMENT ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | EDIR_MUTATION ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | EDIR_QUERY ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | EDIR_SUBSCRIPTION ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | ENUM ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | EXTEND ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | FALSE ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | FRAGMENT ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | IMPLEMENTS ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | INPUT ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | INTERFACE ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | NAME _v ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState116 _v
            | NULL ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | ON ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | OP_MUTATION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | OP_QUERY ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | OP_SUBSCRIPTION ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | SCALAR ->
                _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | SCHEMA ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TRUE ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TSDIR_ARGUMENT_DEFINITION ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TSDIR_ENUM ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TSDIR_ENUM_VALUE ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TSDIR_FIELD_DEFINITION ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TSDIR_INPUT_FIELD_DEFINITION ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TSDIR_INPUT_OBJECT ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TSDIR_INTERFACE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TSDIR_OBJECT ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TSDIR_SCALAR ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TSDIR_SCHEMA ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TSDIR_UNION ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | TYPE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | UNION ->
                _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState116
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116) : 'freshtv440)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv441 * _menhir_state * 'tv_operation_type) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv442)) : 'freshtv444)
    | MenhirState441 | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv447 * _menhir_state * 'tv_operation_type) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState411 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState411
        | AT | L_BRACKET | L_PAREN ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv445) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState411 in
            ((let _v : 'tv_option_name_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 9216 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
             in
            _menhir_goto_option_name_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv446)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState411) : 'freshtv448)
    | _ ->
        _menhir_fail ()

and _menhir_run127 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | EDIR_FIELD ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | EDIR_MUTATION ->
        _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | EDIR_QUERY ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | EDIR_SUBSCRIPTION ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | ENUM ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | EXTEND ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | FALSE ->
        _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | FRAGMENT ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | IMPLEMENTS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | INPUT ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | INTERFACE ->
        _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | NAME _v ->
        _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState127 _v
    | NULL ->
        _menhir_run149 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | ON ->
        _menhir_run147 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | OP_MUTATION ->
        _menhir_run146 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | OP_QUERY ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | OP_SUBSCRIPTION ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | SCALAR ->
        _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | SCHEMA ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TRUE ->
        _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TSDIR_ENUM ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TSDIR_ENUM_VALUE ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TSDIR_INPUT_OBJECT ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TSDIR_INTERFACE ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TSDIR_OBJECT ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TSDIR_SCALAR ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TSDIR_SCHEMA ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TSDIR_UNION ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | TYPE ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | UNION ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState127
    | AT | L_BRACKET ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv437) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState127 in
        ((let _v : 'tv_option_type_condition_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 9313 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_option_type_condition_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv438)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127

and _menhir_run128 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv435) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 476 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "union" )
# 9331 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv436)

and _menhir_run129 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv433) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 469 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "type" )
# 9345 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv434)

and _menhir_run130 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv431) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 493 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                 ("UNION" )
# 9359 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv432)

and _menhir_run131 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv429) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 487 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ("SCHEMA" )
# 9373 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv430)

and _menhir_run132 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv427) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 488 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ("SCALAR" )
# 9387 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv428)

and _menhir_run133 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv425) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 489 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ("OBJECT" )
# 9401 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv426)

and _menhir_run134 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv423) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 492 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                     ("INTERFACE" )
# 9415 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv424)

and _menhir_run135 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv421) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 496 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        ("INPUT_OBJECT" )
# 9429 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv422)

and _menhir_run136 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv419) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 497 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                  ("INPUT_FIELD_DEFINITION" )
# 9443 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv420)

and _menhir_run137 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv417) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 490 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                            ("FIELD_DEFINITION" )
# 9457 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv418)

and _menhir_run138 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv415) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 495 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ("ENUM_VALUE" )
# 9471 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv416)

and _menhir_run139 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv413) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 494 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ("ENUM" )
# 9485 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)

and _menhir_run140 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv411) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 491 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                               ("ARGUMENT_DEFINITION" )
# 9499 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv412)

and _menhir_run141 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv409) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 465 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "true" )
# 9513 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv410)

and _menhir_run142 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv407) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 468 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "schema" )
# 9527 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv408)

and _menhir_run143 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv405) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 474 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "scalar" )
# 9541 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv406)

and _menhir_run144 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv403) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 479 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "subscription" )
# 9555 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv404)

and _menhir_run145 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv401) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 478 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "query" )
# 9569 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv402)

and _menhir_run146 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv399) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 477 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "mutation" )
# 9583 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv400)

and _menhir_run149 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv397) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 467 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "null" )
# 9597 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv398)

and _menhir_run150 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 56 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 9604 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv395) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((n : (
# 56 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 9614 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) : (
# 56 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 9618 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) = _v in
    ((let _v : 'tv_fragment_name = 
# 462 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( n )
# 9623 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv396)

and _menhir_run151 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv393) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 471 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "interface" )
# 9637 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv394)

and _menhir_run152 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv391) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 475 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "input" )
# 9651 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv392)

and _menhir_run153 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv389) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 472 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "implements" )
# 9665 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv390)

and _menhir_run154 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv387) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 464 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "fragment" )
# 9679 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv388)

and _menhir_run155 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv385) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 466 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "false" )
# 9693 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv386)

and _menhir_run156 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv383) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 463 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "extend" )
# 9707 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv384)

and _menhir_run157 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv381) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 470 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "enum" )
# 9721 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv382)

and _menhir_run158 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv379) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 482 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                       ("SUBSCRIPTION" )
# 9735 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)

and _menhir_run159 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv377) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 480 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ("QUERY" )
# 9749 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv378)

and _menhir_run160 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv375) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 481 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                   ("MUTATION" )
# 9763 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv376)

and _menhir_run161 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv373) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 486 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          ("INLINE_FRAGMENT" )
# 9777 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)

and _menhir_run162 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv371) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 485 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          ("FRAGMENT_SPREAD" )
# 9791 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv372)

and _menhir_run163 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv369) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 484 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                              ("FRAGMENT_DEFINITION" )
# 9805 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv370)

and _menhir_run164 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv367) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 483 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ("FIELD" )
# 9819 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv368)

and _menhir_run165 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv365) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_fragment_name = 
# 473 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "directive" )
# 9833 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_fragment_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv366)

and _menhir_run303 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | OP_MUTATION ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState303
    | OP_QUERY ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState303
    | OP_SUBSCRIPTION ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState303
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState303

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EDIR_FIELD ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EDIR_MUTATION ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EDIR_QUERY ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EDIR_SUBSCRIPTION ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | ENUM ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | EXTEND ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | FALSE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | FRAGMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | IMPLEMENTS ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | INPUT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | INTERFACE ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | NAME _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState3 _v
    | NULL ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | ON ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | OP_MUTATION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | OP_QUERY ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | OP_SUBSCRIPTION ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | SCALAR ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | SCHEMA ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TRUE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TSDIR_ENUM ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TSDIR_ENUM_VALUE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TSDIR_INPUT_OBJECT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TSDIR_INTERFACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TSDIR_OBJECT ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TSDIR_SCALAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TSDIR_SCHEMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TSDIR_UNION ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | TYPE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | UNION ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv363) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 438 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "union" )
# 9949 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv364)

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv361) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 431 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "type" )
# 9963 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv362)

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv359) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 455 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                 ("UNION" )
# 9977 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv360)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv357) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 449 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ("SCHEMA" )
# 9991 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv358)

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv355) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 450 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ("SCALAR" )
# 10005 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv356)

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv353) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 451 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                  ("OBJECT" )
# 10019 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv354)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv351) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 454 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                     ("INTERFACE" )
# 10033 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv352)

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv349) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 458 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        ("INPUT_OBJECT" )
# 10047 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv350)

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv347) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 459 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                                  ("INPUT_FIELD_DEFINITION" )
# 10061 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv348)

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv345) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 452 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                            ("FIELD_DEFINITION" )
# 10075 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv346)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv343) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 457 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ("ENUM_VALUE" )
# 10089 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv344)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv341) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 456 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ("ENUM" )
# 10103 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv342)

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv339) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 453 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                               ("ARGUMENT_DEFINITION" )
# 10117 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv340)

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv337) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 427 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "true" )
# 10131 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv338)

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv335) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 430 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "schema" )
# 10145 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv336)

and _menhir_run19 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv333) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 436 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "scalar" )
# 10159 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv334)

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv331) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 441 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "subscription" )
# 10173 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv332)

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv329) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 440 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "query" )
# 10187 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv330)

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv327) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 439 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "mutation" )
# 10201 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv328)

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv325) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 424 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "on" )
# 10215 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv326)

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv323) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 429 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "null" )
# 10229 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv324)

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 56 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 10236 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv321) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((n : (
# 56 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 10246 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) : (
# 56 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 10250 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) = _v in
    ((let _v : 'tv_name = 
# 423 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( n )
# 10255 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv322)

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv319) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 433 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "interface" )
# 10269 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv320)

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv317) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 437 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "input" )
# 10283 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv318)

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv315) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 434 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "implements" )
# 10297 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv316)

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv313) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 426 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "fragment" )
# 10311 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv314)

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv311) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 428 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "false" )
# 10325 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv312)

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv309) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 425 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "extend" )
# 10339 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv310)

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv307) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 432 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "enum" )
# 10353 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv308)

and _menhir_run33 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv305) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 444 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                       ("SUBSCRIPTION" )
# 10367 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv306)

and _menhir_run34 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv303) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 442 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ("QUERY" )
# 10381 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv304)

and _menhir_run35 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv301) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 443 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                   ("MUTATION" )
# 10395 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv302)

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv299) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 448 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          ("INLINE_FRAGMENT" )
# 10409 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv300)

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv297) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 447 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          ("FRAGMENT_SPREAD" )
# 10423 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv298)

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv295) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 446 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                              ("FRAGMENT_DEFINITION" )
# 10437 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv296)

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv293) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 445 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                ("FIELD" )
# 10451 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv294)

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv291) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_name = 
# 435 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                      ( "directive" )
# 10465 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_name _menhir_env _menhir_stack _menhir_s _v) : 'freshtv292)

and _menhir_goto_string_value : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_string_value -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState267 | MenhirState46 | MenhirState69 | MenhirState100 | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv275) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_string_value) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv273) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((s : 'tv_string_value) : 'tv_string_value) = _v in
        ((let _v : 'tv_value = 
# 402 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                        (let v: vc = StringValue s in v)
# 10484 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv274)) : 'freshtv276)
    | MenhirState174 | MenhirState177 | MenhirState196 | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv279) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_string_value) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv277) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((s : 'tv_string_value) : 'tv_string_value) = _v in
        ((let _v : 'tv_value_nc = 
# 413 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                          (StringValue s)
# 10499 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_value_nc _menhir_env _menhir_stack _menhir_s _v) : 'freshtv278)) : 'freshtv280)
    | MenhirState441 | MenhirState0 | MenhirState336 | MenhirState330 | MenhirState321 | MenhirState284 | MenhirState274 | MenhirState254 | MenhirState250 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv289) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_string_value) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv287) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((s : 'tv_string_value) : 'tv_string_value) = _v in
        ((let _v : 'tv_description = 
# 606 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
  ( s )
# 10514 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv285) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_description) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv283) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_description) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv281) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((x : 'tv_description) : 'tv_description) = _v in
        ((let _v : 'tv_option_description_ = 
# 102 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( Some x )
# 10531 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
         in
        _menhir_goto_option_description_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv282)) : 'freshtv284)) : 'freshtv286)) : 'freshtv288)) : 'freshtv290)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState441 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv29 * _menhir_state * 'tv_definition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState423 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv31 * _menhir_state * 'tv_operation_type) * _menhir_state * 'tv_option_name_) * 'tv_option_variable_definitions_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState422 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv33 * _menhir_state * 'tv_operation_type) * _menhir_state * 'tv_option_name_) * 'tv_option_variable_definitions_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState416 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv35 * _menhir_state * 'tv_variable) * _menhir_state * 'tv_tpe) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState415 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state * 'tv_variable) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState414 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv39 * _menhir_state * 'tv_variable_definition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState413 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv41) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv42)
    | MenhirState411 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv43 * _menhir_state * 'tv_operation_type) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState408 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv45 * _menhir_state * 'tv_option_PIPE_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState386 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv47 * _menhir_state * 'tv_rev_directive_locations)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState384 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv49 * _menhir_state * 'tv_option_description_))) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState382 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv51 * _menhir_state * 'tv_option_description_))) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState381 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv53 * _menhir_state * 'tv_option_description_))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState378 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv55 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState377 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv57 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState376 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv59 * _menhir_state * 'tv_option_description_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState374 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv61 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState373 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv63 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState372 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state * 'tv_option_description_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState370 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv67 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState369 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv69 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState368 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv71 * _menhir_state * 'tv_option_description_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState366 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv73 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState365 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv75 * _menhir_state * 'tv_option_description_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv76)
    | MenhirState362 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv77 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_implements_interfaces_) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)
    | MenhirState361 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv79 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_implements_interfaces_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv80)
    | MenhirState360 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv81 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)
    | MenhirState359 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv83 * _menhir_state * 'tv_option_description_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv84)
    | MenhirState356 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv85 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)
    | MenhirState355 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv87 * _menhir_state * 'tv_option_description_)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv88)
    | MenhirState354 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv89 * _menhir_state * 'tv_option_description_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv90)
    | MenhirState339 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv91 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv92)
    | MenhirState336 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93 * _menhir_state * 'tv_enum_value_definition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)
    | MenhirState332 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv95 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_enum_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv96)
    | MenhirState331 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)
    | MenhirState330 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv100)
    | MenhirState329 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv101 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv102)
    | MenhirState328 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv104)
    | MenhirState325 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv105 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)
    | MenhirState321 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv107 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv108)
    | MenhirState320 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv109 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv110)
    | MenhirState319 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv111 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv112)
    | MenhirState316 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv113 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)
    | MenhirState314 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv116)
    | MenhirState313 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv117 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)
    | MenhirState311 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv119 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv120)
    | MenhirState310 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv121 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv122)
    | MenhirState307 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv123 * _menhir_state)) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv124)
    | MenhirState303 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv125 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv126)
    | MenhirState302 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv127 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv128)
    | MenhirState300 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv129 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv130)
    | MenhirState297 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131 * _menhir_state * 'tv_directives) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv132)
    | MenhirState293 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv133 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_implements_interfaces) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv134)
    | MenhirState291 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv135 * _menhir_state * 'tv_rev_implements_interfaces)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv136)
    | MenhirState288 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv137 * _menhir_state) * 'tv_option_AMPERSAND_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv138)
    | MenhirState284 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv139 * _menhir_state * 'tv_field_definition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv140)
    | MenhirState279 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv141 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_)) * _menhir_state * 'tv_tpe) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv142)
    | MenhirState278 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv143 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_definition_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv144)
    | MenhirState274 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv145 * _menhir_state * 'tv_input_value_definition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv146)
    | MenhirState269 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv147 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name)) * _menhir_state * 'tv_tpe) * _menhir_state * 'tv_option_default_value_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)
    | MenhirState267 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv149 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv150)
    | MenhirState266 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv151 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name)) * _menhir_state * 'tv_tpe) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)
    | MenhirState258 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv153 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv154)
    | MenhirState257 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv155 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)
    | MenhirState255 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv157 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv158)
    | MenhirState254 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv159 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv160)
    | MenhirState253 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv161 * _menhir_state * 'tv_option_description_) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv162)
    | MenhirState252 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv163 * _menhir_state * 'tv_option_description_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)
    | MenhirState250 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv165 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv166)
    | MenhirState249 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv167 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv168)
    | MenhirState248 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv169 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv170)
    | MenhirState245 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv171 * _menhir_state * 'tv_rev_union_member_types)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv172)
    | MenhirState241 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv173 * _menhir_state) * _menhir_state * 'tv_option_PIPE_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)
    | MenhirState239 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv175 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv176)
    | MenhirState238 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv177 * _menhir_state)) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_directives_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv178)
    | MenhirState237 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv179 * _menhir_state)) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)
    | MenhirState236 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv181 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv182)
    | MenhirState233 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv183 * _menhir_state) * _menhir_state * 'tv_fragment_name) * _menhir_state * 'tv_type_condition) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv184)
    | MenhirState232 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv185 * _menhir_state) * _menhir_state * 'tv_fragment_name) * _menhir_state * 'tv_type_condition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv186)
    | MenhirState231 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state) * _menhir_state * 'tv_fragment_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv188)
    | MenhirState230 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv189 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv190)
    | MenhirState223 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv191 * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv192)
    | MenhirState222 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv193 * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv194)
    | MenhirState219 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv195 * _menhir_state * 'tv_name) * _menhir_state) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv196)
    | MenhirState218 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv197 * _menhir_state * 'tv_name) * _menhir_state) * _menhir_state * 'tv_name) * _menhir_state * 'tv_option_arguments_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv198)
    | MenhirState217 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv199 * _menhir_state * 'tv_name) * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv200)
    | MenhirState216 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv201 * _menhir_state * 'tv_name) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv202)
    | MenhirState215 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)
    | MenhirState213 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state * 'tv_selection) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv206)
    | MenhirState211 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv207 * _menhir_state) * _menhir_state * 'tv_fragment_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)
    | MenhirState209 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209 * _menhir_state * 'tv_directive_nc) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv210)
    | MenhirState205 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv211 * _menhir_state) * _menhir_state * 'tv_option_type_condition_) * _menhir_state * 'tv_option_directives_nc_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv212)
    | MenhirState201 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv213 * _menhir_state * 'tv_argument_nc) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv214)
    | MenhirState196 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state * 'tv_value_nc) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv216)
    | MenhirState185 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)
    | MenhirState181 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv219 * _menhir_state * 'tv_name)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv220)
    | MenhirState179 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv221 * _menhir_state * 'tv_object_field_nc) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv222)
    | MenhirState178 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv223 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv224)
    | MenhirState177 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv225 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv226)
    | MenhirState174 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv227 * _menhir_state * 'tv_name)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv228)
    | MenhirState170 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv229 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv230)
    | MenhirState169 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv231 * _menhir_state) * _menhir_state * 'tv_name) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv232)
    | MenhirState168 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv233 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv234)
    | MenhirState167 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv235 * _menhir_state) * _menhir_state * 'tv_option_type_condition_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)
    | MenhirState147 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv237 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv238)
    | MenhirState127 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv239 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv240)
    | MenhirState126 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv241 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv242)
    | MenhirState124 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv243 * _menhir_state * 'tv_directive) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv244)
    | MenhirState116 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv245 * _menhir_state * 'tv_operation_type)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)
    | MenhirState114 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv247 * _menhir_state * 'tv_opreation_type_definition) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv248)
    | MenhirState110 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv249 * _menhir_state) * _menhir_state * 'tv_option_directives_)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv250)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv251 * _menhir_state * 'tv_argument) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv252)
    | MenhirState100 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv253 * _menhir_state * 'tv_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv254)
    | MenhirState73 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv255 * _menhir_state * 'tv_name)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state * 'tv_object_field) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv258)
    | MenhirState70 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv259 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv260)
    | MenhirState69 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv261 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv262)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv263 * _menhir_state * 'tv_name)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv264)
    | MenhirState42 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv265) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv266)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv267 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv268)
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv269 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv270)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv271) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv272)

and _menhir_reduce223 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_option_description_ = 
# 100 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
    ( None )
# 11153 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_option_description_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 57 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 11160 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((s : (
# 57 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 11170 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) : (
# 57 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 11174 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) = _v in
    ((let _v : 'tv_string_value = 
# 394 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( StringValue s )
# 11179 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_string_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AT ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | L_BRACKET ->
        _menhir_reduce225 _menhir_env (Obj.magic _menhir_stack) MenhirState2
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_run111 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv25) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_operation_type = 
# 333 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                    ( Subscription )
# 11208 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_operation_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv26)

and _menhir_run112 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv23) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_operation_type = 
# 331 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                    ( Query )
# 11222 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_operation_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv24)

and _menhir_run113 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv21) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_operation_type = 
# 332 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
                    ( Mutation )
# 11236 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
     in
    _menhir_goto_operation_type _menhir_env _menhir_stack _menhir_s _v) : 'freshtv22)

and _menhir_run126 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | EDIR_FIELD ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | EDIR_MUTATION ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | EDIR_QUERY ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | EDIR_SUBSCRIPTION ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | ENUM ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | EXTEND ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | FALSE ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | FRAGMENT ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | IMPLEMENTS ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | INPUT ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | INTERFACE ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | NAME _v ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState126 _v
    | NULL ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | ON ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | OP_MUTATION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | OP_QUERY ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | OP_SUBSCRIPTION ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | SCALAR ->
        _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | SCHEMA ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | SPREAD ->
        _menhir_run127 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TRUE ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TSDIR_ENUM ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TSDIR_ENUM_VALUE ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TSDIR_INPUT_OBJECT ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TSDIR_INTERFACE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TSDIR_OBJECT ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TSDIR_SCALAR ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TSDIR_SCHEMA ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TSDIR_UNION ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | TYPE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | UNION ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState126
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126

and _menhir_run230 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | DIRECTIVE ->
        _menhir_run165 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | EDIR_FIELD ->
        _menhir_run164 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | EDIR_FRAGMENT_DEFINITION ->
        _menhir_run163 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | EDIR_FRAGMENT_SPREAD ->
        _menhir_run162 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | EDIR_INLINE_FRAGMENT ->
        _menhir_run161 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | EDIR_MUTATION ->
        _menhir_run160 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | EDIR_QUERY ->
        _menhir_run159 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | EDIR_SUBSCRIPTION ->
        _menhir_run158 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | ENUM ->
        _menhir_run157 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | EXTEND ->
        _menhir_run156 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | FALSE ->
        _menhir_run155 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | FRAGMENT ->
        _menhir_run154 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | IMPLEMENTS ->
        _menhir_run153 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | INPUT ->
        _menhir_run152 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | INTERFACE ->
        _menhir_run151 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | NAME _v ->
        _menhir_run150 _menhir_env (Obj.magic _menhir_stack) MenhirState230 _v
    | NULL ->
        _menhir_run149 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | OP_MUTATION ->
        _menhir_run146 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | OP_QUERY ->
        _menhir_run145 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | OP_SUBSCRIPTION ->
        _menhir_run144 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | SCALAR ->
        _menhir_run143 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | SCHEMA ->
        _menhir_run142 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TRUE ->
        _menhir_run141 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TSDIR_ARGUMENT_DEFINITION ->
        _menhir_run140 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TSDIR_ENUM ->
        _menhir_run139 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TSDIR_ENUM_VALUE ->
        _menhir_run138 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TSDIR_FIELD_DEFINITION ->
        _menhir_run137 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TSDIR_INPUT_FIELD_DEFINITION ->
        _menhir_run136 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TSDIR_INPUT_OBJECT ->
        _menhir_run135 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TSDIR_INTERFACE ->
        _menhir_run134 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TSDIR_OBJECT ->
        _menhir_run133 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TSDIR_SCALAR ->
        _menhir_run132 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TSDIR_SCHEMA ->
        _menhir_run131 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TSDIR_UNION ->
        _menhir_run130 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | TYPE ->
        _menhir_run129 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | UNION ->
        _menhir_run128 _menhir_env (Obj.magic _menhir_stack) MenhirState230
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState230

and _menhir_run235 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ENUM ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv5 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState328 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState328
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState328) : 'freshtv6)
    | INPUT ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState319 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState319
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState319) : 'freshtv8)
    | INTERFACE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState313 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState313
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState313) : 'freshtv10)
    | SCALAR ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState310 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState310
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState310) : 'freshtv12)
    | SCHEMA ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv13 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | AT ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState302
        | L_BRACKET ->
            _menhir_run303 _menhir_env (Obj.magic _menhir_stack) MenhirState302
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState302) : 'freshtv14)
    | TYPE ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState248 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState248
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState248) : 'freshtv16)
    | UNION ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIRECTIVE ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | EDIR_FIELD ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | EDIR_FRAGMENT_DEFINITION ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | EDIR_FRAGMENT_SPREAD ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | EDIR_INLINE_FRAGMENT ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | EDIR_MUTATION ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | EDIR_QUERY ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | EDIR_SUBSCRIPTION ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | ENUM ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | EXTEND ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | FALSE ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | FRAGMENT ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | IMPLEMENTS ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | INPUT ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | INTERFACE ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | NAME _v ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState236 _v
        | NULL ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | ON ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | OP_MUTATION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | OP_QUERY ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | OP_SUBSCRIPTION ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | SCALAR ->
            _menhir_run19 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | SCHEMA ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TRUE ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TSDIR_ARGUMENT_DEFINITION ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TSDIR_ENUM ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TSDIR_ENUM_VALUE ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TSDIR_FIELD_DEFINITION ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TSDIR_INPUT_FIELD_DEFINITION ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TSDIR_INPUT_OBJECT ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TSDIR_INTERFACE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TSDIR_OBJECT ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TSDIR_SCALAR ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TSDIR_SCHEMA ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TSDIR_UNION ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | TYPE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | UNION ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState236
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState236) : 'freshtv18)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)

and _menhir_run91 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 58 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 11945 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((b : (
# 58 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 11955 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) : (
# 58 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (string)
# 11959 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
    )) = _v in
    ((let _v : 'tv_string_value = 
# 396 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
    ( BlockStringValue b )
# 11964 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
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
# 74 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.mly"
       (Gql_ast.document)
# 11983 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
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
        _menhir_run91 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | EXTEND ->
        _menhir_run235 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | FRAGMENT ->
        _menhir_run230 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | L_BRACKET ->
        _menhir_run126 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | OP_MUTATION ->
        _menhir_run113 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | OP_QUERY ->
        _menhir_run112 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | OP_SUBSCRIPTION ->
        _menhir_run111 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SCHEMA ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | STRING _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | DIRECTIVE | ENUM | INPUT | INTERFACE | SCALAR | TYPE | UNION ->
        _menhir_reduce223 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv2))

# 219 "/Users/budde/.opam/4.02.3/lib/menhir/standard.mly"
  


# 12031 "/Users/budde/git/mitoai/graphql-transformer/packages/gqltrans/src/gql_parser.ml"
