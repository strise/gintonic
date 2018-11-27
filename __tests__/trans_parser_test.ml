open Jest
open Expect
open Trans_parser
open Trans_lexer

let parse = document read

let parseString(s: string) = parse (Lexing.from_string s)

let testName(program: string): string = "program: \"" ^ (String.escaped program) ^ "\""

let testProgram(program: string)(result: Trans_ast.document) =
  test (testName program) (
    fun () -> expect (parseString program) |> toEqual result
  )

let mapper(t: Trans_ast.object_type_transformation): Trans_ast.transformation = TypeTransformation (ObjectTypeTransformation t)

let tts (ts): Trans_ast.document = {transformations = List.map mapper ts}

let tt (t): Trans_ast.document = tts (t::[])

let ts (t: Trans_ast.schema_transformation): Trans_ast.document = {transformations = (SchemaTransformation t)::[]}

let stt (t: Trans_ast.scalar_type_transformation): Trans_ast.document = {transformations = TypeTransformation (ScalarTypeTransformation t)::[]}

let utt (t: Trans_ast.union_type_transformation): Trans_ast.document = {transformations = TypeTransformation (UnionTypeTransformation t)::[]}

let itt (t: Trans_ast.interface_type_transformation): Trans_ast.document = {transformations = TypeTransformation (InterfaceTypeTransformation t)::[]}

let iott (t: Trans_ast.input_object_type_transformation): Trans_ast.document = {transformations = TypeTransformation (InputObjectTypeTransformation t)::[]}

let ett (t: Trans_ast.enum_type_transformation): Trans_ast.document = {transformations = TypeTransformation (EnumTypeTransformation t)::[]}

let () = 
  describe "Trans_parser" (fun () -> 
      describe "SchemaTransform" (fun () -> 
          testProgram 
            "transform schema { query }"
            (ts (Query::[]));
          testProgram 
            "transform schema { query mutation }"
            (ts (Query::Mutation::[]));
          testProgram 
            "transform schema { query mutation subscription}"
            (ts (Query::Mutation::Subscription::[]));
        );
      describe "TypeTransformation" (fun () -> 
          describe "ScalarTypeTransformation" (fun () -> 
              testProgram 
                "transform scalar Foo"
                (stt ({description = None; selector = {name = "Foo"; alias = None}}));

              testProgram 
                "
                \"test\"
                transform scalar Foo
                "
                (stt ({description = Some (StringValue "test"); selector = {name = "Foo"; alias = None}}));
              testProgram 
                "
                \"test\"
                transform scalar Bar: Foo
                "
                (stt ({description = Some (StringValue "test"); selector = {name = "Foo"; alias = Some "Bar"}}))
            );
          describe "UnionTypeTransformation" (fun () -> 
              testProgram 
                "transform union Foo"
                (utt ({description = None; selector = {name = "Foo"; alias = None}}));

              testProgram 
                "
                \"test\"
                transform union Foo
                "
                (utt ({description = Some (StringValue "test"); selector = {name = "Foo"; alias = None}}));
              testProgram 
                "
                \"test\"
                transform union Bar: Foo
                "
                (utt ({description = Some (StringValue "test"); selector = {name = "Foo"; alias = Some "Bar"}}))
            );

          describe "ObjectTypeTransformation" (fun () -> 
              testProgram 
                "transform type Foobar"
                (tt ({description = None; selector = {name = "Foobar"; alias = None}; fields = []}));
              testProgram 
                "transform type Foobar transform type Baz"
                (tts (
                    {description = None; selector = {name = "Foobar"; alias = None}; fields = []}::
                    {description = None; selector = {name = "Baz"; alias = None}; fields = []}::
                    []
                  ));
              testProgram 
                "transform type Foobar: Baz"
                (tt {description = None; selector = {name = "Baz"; alias = Some "Foobar"}; fields = []});
              testProgram 
                "
                transform type Foobar: Baz {
                    field1
                    alias2: field2
                }"
                (tt (
                    {
                      description = None;
                      selector = {name = "Baz"; alias = Some "Foobar"}; 
                      fields = 
                        {selector = {name = "field1"; alias = None}; arguments = []; description = None}::
                        {selector = {name = "field2"; alias = Some "alias2"}; arguments = []; description = None}::
                        []
                    }
                  ))
              ;
              testProgram 
                "
                \"\"\"desc\"\"\"
                transform type Lol
                "
                (tt (
                    {
                      description = Some (BlockStringValue "desc");
                      selector = {name = "Lol"; alias = None}; 
                      fields = []} 
                  ));
              testProgram 
                "
                transform type Lol {
                    \"desc\"
                    true
                }
                "
                (tt 
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None}; 
                     fields = 
                       {
                         selector = {name = "true"; alias = None}; 
                         arguments = []; description = Some (StringValue "desc")}::
                       []
                   }
                );
              testProgram 
                "
                transform type Lol {
                    null(arg = 123)
                }
                "
                (tt
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     fields = {
                       selector = {name = "null"; alias = None}; 
                       arguments = 
                         {name = "arg"; value = (Some (IntValue (Int32.of_int 123))); description = None}
                         ::[]; description = None}::
                       []
                   });
              testProgram 
                "
                transform type Lol {

                    field(
                        \"\"\"desc\"\"\"
                        false = 123)
                }
                "
                (tt 
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     fields = {
                       selector = {name = "field"; alias = None}; 
                       arguments = 
                         {name = "false"; value = (Some (IntValue (Int32.of_int 123))); description = Some (BlockStringValue "desc")}
                         ::[]; description = None}::
                       []
                   });
              testProgram 
                "
                transform type Lol {

                    field(
                        \"\"\"desc\"\"\"
                        false)
                }
                "
                (tt
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     fields = {selector = {name = "field"; alias = None}; 
                               arguments = 
                                 {name = "false"; value = None; description = Some (BlockStringValue "desc")}
                                 ::[]; description = None}::
                              []
                   });

              testProgram 
                "
                transform type Lol {
                    field(arg = [123, 123, true, false, null])
                }
                "
                (tt
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     fields = {
                       selector = {name = "field"; alias = None}; 
                       arguments = 
                         {name = "arg"; 
                          value = Some (
                              ListValue
                                (
                                  (IntValue (Int32.of_int 123))
                                  ::(IntValue (Int32.of_int 123))
                                  ::(BooleanValue true)
                                  ::(BooleanValue false)
                                  ::(NullValue)
                                  ::[])); description = None}
                         ::[]; 
                       description = None}::
                       []
                   })
            );
          describe "InterfaceTypeTransformation" (fun () -> 
              testProgram 
                "transform interface Foobar"
                (itt ({description = None; selector = {name = "Foobar"; alias = None}; fields = []}));
              testProgram 
                "transform interface Foobar transform type Baz"
                ({transformations = (
                     (TypeTransformation (InterfaceTypeTransformation {description = None; selector = {name = "Foobar"; alias = None}; fields = []}))::
                     (TypeTransformation (ObjectTypeTransformation {description = None; selector = {name = "Baz"; alias = None}; fields = []}))::
                     []
                   )});
              testProgram 
                "transform interface Foobar: Baz"
                (itt {description = None; selector = {name = "Baz"; alias = Some "Foobar"}; fields = []});
              testProgram 
                "
                transform interface Foobar: Baz {
                    field1
                    alias2: field2
                }"
                (itt (
                    {
                      description = None;
                      selector = {name = "Baz"; alias = Some "Foobar"}; 
                      fields =   {selector = {name = "field1"; alias = None}; arguments = []; description = None}::
                                 {selector = {name = "field2"; alias = Some "alias2"}; arguments = []; description = None}::
                                 []
                    }
                  ))
              ;
              testProgram 
                "
                \"\"\"desc\"\"\"
                transform interface Lol
                "
                (itt (
                    {
                      description = Some (BlockStringValue "desc");
                      selector = {name = "Lol"; alias = None}; 
                      fields = []} 
                  ));
              testProgram 
                "
                transform interface Lol {
                    \"desc\"
                    true
                }
                "
                (itt 
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None}; 
                     fields =  {
                       selector = {name = "true"; alias = None}; 
                       arguments = []; description = Some (StringValue "desc")}::
                       []
                   }
                );
              testProgram 
                "
                transform interface Lol {
                    null(arg = 123)
                }
                "
                (itt
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     fields = {
                       selector = {name = "null"; alias = None}; 
                       arguments = 
                         {name = "arg"; value = (Some (IntValue (Int32.of_int 123))); description = None}
                         ::[]; description = None}::
                       []
                   });
              testProgram 
                "
                transform interface Lol {

                    field(
                        \"\"\"desc\"\"\"
                        false = 123)
                }
                "
                (itt 
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     fields = {selector = {name = "field"; alias = None}; 
                               arguments = 
                                 {name = "false"; value = (Some (IntValue (Int32.of_int 123))); description = Some (BlockStringValue "desc")}
                                 ::[]; description = None}::
                              []
                   });
              testProgram 
                "
                transform interface Lol {

                    field(
                        \"\"\"desc\"\"\"
                        false)
                }
                "
                (itt
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     fields = {selector = {name = "field"; alias = None}; 
                               arguments = 
                                 {name = "false"; value = None; description = Some (BlockStringValue "desc")}
                                 ::[]; description = None}::
                              []

                   });

              testProgram 
                "
                transform interface Lol {
                    field(arg = [123, 123, true, false, null])
                }
                "
                (itt
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     fields = {
                       selector = {name = "field"; alias = None}; 
                       arguments = 
                         {name = "arg";
                          value = Some (
                              ListValue
                                (
                                  (IntValue (Int32.of_int 123))
                                  ::(IntValue (Int32.of_int 123))
                                  ::(BooleanValue true)
                                  ::(BooleanValue false)
                                  ::(NullValue)
                                  ::[])); description = None}
                         ::[]; 
                       description = None}::
                       []
                   })
            );
          describe "InputObjectTypeTransformation" (fun () -> 

              testProgram 
                "
                transform input Lol {
                    arg = [123, 123, true, false, null]
                }
                "
                (iott
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     fields = 
                       {name = "arg"; 
                        value = Some (
                            ListValue
                              (
                                (IntValue (Int32.of_int 123))
                                ::(IntValue (Int32.of_int 123))
                                ::(BooleanValue true)
                                ::(BooleanValue false)
                                ::(NullValue)
                                ::[])); description = None}
                       ::[]; 
                   });
              testProgram 
                "
                transform input Lol {
                    arg = [123, 123, true, false, null]
                }
                "
                (iott
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     fields = 
                       {name = "arg";
                        value = Some (
                            ListValue
                              (
                                (IntValue (Int32.of_int 123))
                                ::(IntValue (Int32.of_int 123))
                                ::(BooleanValue true)
                                ::(BooleanValue false)
                                ::(NullValue)
                                ::[])); description = None}
                       ::[]; 
                   })
            );
          describe "EnumTypeTransformation" (fun () -> 

              testProgram 
                "
                transform enum Lol {
                  VALUE
                }
                "
                (ett
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     values = 
                       {
                         value = "VALUE"; 
                         description = None}
                       ::[]; 
                   });
              testProgram 
                "
                transform enum Lol {
                  VALUE _FOOBAR
                }
                "
                (ett
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     values = 
                       {
                         value = "VALUE"; 
                         description = None}
                       ::{
                         value = "_FOOBAR"; 
                         description = None}
                       ::[]; 
                   });
              testProgram 
                "
                transform enum Lol {
                  \"test\"
                  VALUE 
                }
                "
                (ett
                   {
                     description = None;
                     selector = {name = "Lol"; alias = None};
                     values = 
                       {
                         value = "VALUE"; 
                         description = Some (StringValue "test")}
                       ::[]; 
                   })
            )
        )
    )