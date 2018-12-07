open Jest
open Expect
open Gql_ast

let parse = Gql_parser.document Gql_lexer.read

let parseString(s: string ): document = parse (Lexing.from_string s )

let testName(program: string): string = "program: \"" ^ (String.trim (String.escaped program)) ^ "\""

let testProgram(program: string)(result: document) =
  test (testName program) (
    fun () -> expect (parseString program) |> toEqual result
  )

let td t = {definitions = (TypeSystemDefinition (TypeDefinition t))::[]}

let sd t = {definitions = (TypeSystemDefinition (SchemaDefinition t))::[]}

let od t = {definitions = (ExecutableDefinition (OperationDefinition t))::[]}

let fd t = {definitions = (ExecutableDefinition (FragmentDefinition t))::[]}

let () = 
  describe "Schema_parser" (fun () ->  
      describe "ExecutableDefinition" (fun () -> 
          describe "OperationDefinition" (fun () -> 
              testProgram
                "{ foo: bar }"
                (od {tpe = Query; name = None; variables = []; directives = []; selectionSet = Field {alias = Some "foo"; name = "bar"; arguments = []; selectionSet = [];directives = [] }::[] });
              testProgram
                "{ ...on Lol { foo } }"
                (od {
                    tpe = Query;
                    name = None;
                    variables = []; 
                    directives = []; 
                    selectionSet = (InlineFragment {
                        condition= Some "Lol";
                        directives = [];
                        selectionSet = Field {alias = None; name = "foo"; directives = []; arguments = []; selectionSet = []}::[];
                      })::[] }
                );
            );
          describe "FragmentDefinition" (fun () -> 
              testProgram
                "
                fragment f on A { foo }
                "
                (fd {
                    name = "f";
                    directives = []; 
                    condition = "A";
                    selectionSet = (Field {alias = None; name = "foo"; directives = []; arguments = []; selectionSet = []}::[]);
                  }
                );
            );
        );
      describe "TypeSystemDefinition" (fun () ->  
          describe "TypeDefinition" (fun () ->  
              describe "ScalarTypeDefinition" (fun () ->  
                  testProgram "scalar Int" (td (ScalarTypeDefinition {description = None; directives = []; name = "Int"}));
                  testProgram 
                    "
            \"Foobar\"
            scalar Int
            " 
                    (td (ScalarTypeDefinition {description = Some (StringValue "Foobar"); directives = []; name = "Int"})
                    );
                );
              describe "ScalarTypeDefinition" (fun () ->  
                  testProgram 
                    "scalar Int" 
                    (td (ScalarTypeDefinition {description = None; directives = []; name = "Int"}));

                  testProgram 
                    "
                    \"Foobar\"
                    scalar Int @test
                    " 
                    (td (ScalarTypeDefinition {description = Some (StringValue "Foobar"); directives = {name = "test"; arguments = []}::[]; name = "Int"});
                    );
                );
              describe "EnumTypeDefinition" (fun () ->  
                  testProgram 
                    "
                        \"Foobar\"
                        enum _Lol_ { VALUE }
                        " 
                    (td (EnumTypeDefinition {description = Some (StringValue "Foobar"); directives = []; name = "_Lol_"; values= {value= "VALUE"; description=None; directives=[]}::[]}));
                  testProgram 
                    "
                        \"Foobar\"
                        enum Lol  { VALUE }
                        " 
                    (td (EnumTypeDefinition {description = Some (StringValue "Foobar"); directives = []; name = "Lol"; values={value= "VALUE"; description=None; directives=[]}::[]}));
                  testProgram 
                    "
            \"Foobar\"
            # With comment
            enum Lol {
              VALUE
            }
            " 
                    (td (EnumTypeDefinition {description = Some (StringValue "Foobar"); directives = []; name = "Lol"; values= {value= "VALUE"; description=None; directives=[]}::[]}));
                  testProgram 
                    "
            \"Foobar\"
            # With comment
            enum Lol @foobar  {
              VALUE
            }
            " 
                    (td (EnumTypeDefinition {description = Some (StringValue "Foobar"); directives = {name="foobar";arguments = []}::[]; name = "Lol"; values= {value= "VALUE"; description=None; directives=[]}::[]}));
                  testProgram 
                    "
            \"Foobar\"
            enum Lol {
              HERRO
                      \"Awesome\"
              FOO BAR
            }
            " 
                    (td (EnumTypeDefinition {
                         description = Some (StringValue "Foobar"); 
                         directives = []; name = "Lol"; 
                         values= 
                           { description = None; value = "HERRO"; directives = []}
                           ::{ description = Some (StringValue "Awesome"); value = "FOO"; directives = []}
                           ::{ description = None; value = "BAR"; directives = []}
                           ::[]}));
                  testProgram 
                    "
            \"Foobar\"
            enum Lol {
              HERRO @dir(asd: [true, false null FOOBAR])
                      \"Awesome\"
              FOO BAR
            }
            " 
                    (td (EnumTypeDefinition {
                         description = Some (StringValue "Foobar"); 
                         directives = []; name = "Lol"; 
                         values= 
                           { description = None; value = "HERRO"; directives = {name = "dir"; arguments = {name = "asd"; value = ListValue ((BooleanValue true)::(BooleanValue false)::(NullValue)::(EnumValue "FOOBAR")::[]) }::[]}::[]}
                           ::{ description = Some (StringValue "Awesome"); value = "FOO"; directives = []}
                           ::{ description = None; value = "BAR"; directives = []}
                           ::[]}));
                );
              describe "UnionTypeDefinition" (fun () ->  
                  testProgram 
                    "
            \"Foobar\"
            union Foo
            " 
                    (td (UnionTypeDefinition {description = Some (StringValue "Foobar"); directives = []; name = "Foo"; types= []}));
                  testProgram 
                    "
            union Foo = Bar
            " 
                    (td (UnionTypeDefinition {description = None; directives = []; name = "Foo"; types= "Bar"::[]}));
                  testProgram 
                    "
            union Foo = Baz | Bar
            " 
                    (td (UnionTypeDefinition  {description = None; directives = []; name = "Foo"; types= "Baz"::"Bar"::[]}));
                  testProgram 
                    "
            union Foo = | Baz | Bar
            " 
                    (td (UnionTypeDefinition  {description = None; directives = []; name = "Foo"; types= "Baz"::"Bar"::[]}));
                  testProgram 
                    "
            union Foo @test = | Baz | Bar
            " 
                    (td (UnionTypeDefinition {description = None; directives = {name = "test"; arguments = []}::[]; name = "Foo"; types= "Baz"::"Bar"::[]}));
                );
              describe "ObjectTypeDefinition" (fun () -> 
                  testProgram 
                    "
                type T {
                  field:  T
                }
                "
                    (td (ObjectTypeDefinition {
                         description = None; 
                         directives = []; 
                         name = "T"; 
                         fields = {
                           description = None; 
                           name = "field"; 
                           arguments = []; 
                           tpe = NamedType "T"; 
                           directives = []}::[]; 
                         implements = []}));
                  testProgram 
                    "
                type T {
                  field:  T!
                }
                "
                    (td (ObjectTypeDefinition {
                         description = None; 
                         directives = []; 
                         name = "T"; 
                         fields = {
                           description = None; 
                           name = "field"; 
                           arguments = []; 
                           tpe = NonNullType (NamedType "T");
                           directives = []}::[]; 
                         implements = []}));
                  testProgram 
                    "
                type T {
                  field:  [T]!
                }
                "
                    (td (ObjectTypeDefinition {
                         description = None; 
                         directives = []; 
                         name = "T"; 
                         fields = {
                           description = None;
                           name = "field"; 
                           arguments = []; 
                           tpe = NonNullType (ListType (NamedType "T")); 
                           directives = []}::[]; 
                         implements = []}));
                  testProgram 
                    "
                type T {
                  field(arg: X = []):  T
                }
                "
                    (td (ObjectTypeDefinition {
                         description = None; 
                         directives = []; 
                         name = "T";
                         fields = {
                           description = None;
                           name = "field";
                           arguments = ({
                               description = None;
                               name = "arg";
                               tpe = NamedType "X"; 
                               defaultValue = Some (ListValue []); 
                               directives = []})::[]; 
                           tpe = NamedType "T";
                           directives = []}::[]; 
                         implements = []}));
                  testProgram 
                    "
                type T {
                  field(arg: X = [123]):  T
                }
                "
                    (td (
                        ObjectTypeDefinition {
                          description = None; 
                          directives = []; 
                          name = "T"; 
                          fields = {
                            description = None; 
                            name = "field"; 
                            arguments = ({
                                description = None;
                                name = "arg"; 
                                tpe = NamedType "X";
                                defaultValue = Some (ListValue ((IntValue (Int32.of_int 123))::[])); 
                                directives = []})::[]; 
                            tpe = NamedType "T"; 
                            directives = []}::[]; 
                          implements = []}));
                  testProgram 
                    "
                type T {
                  field(arg: X = [123, true, null, 1.23, 1.0E10]):  T
                }
                "
                    (td (
                        ObjectTypeDefinition {
                          description = None; 
                          directives = []; 
                          name = "T"; 
                          fields = {
                            description = None; 
                            name = "field"; 
                            arguments = ({
                                description = None;
                                name = "arg"; 
                                tpe = NamedType "X";
                                defaultValue = Some (ListValue (
                                    (IntValue (Int32.of_int 123))::
                                    (BooleanValue true)::
                                    NullValue::
                                    (FloatValue "1.23")::
                                    (FloatValue "1.0E10")::
                                    [])); 
                                directives = []})::[]; 
                            tpe = NamedType "T"; 
                            directives = []}::[]; 
                          implements = []}));

                  testProgram 
                    "
                type T {
                  field(arg: X = {}): T
                }
                "
                    (td
                       (ObjectTypeDefinition {description = None; directives = []; name = "T"; fields = {description = None; name = "field"; arguments = ({description = None; name = "arg"; tpe = NamedType "X"; defaultValue = Some (ObjectValue []); directives = []})::[]; tpe = NamedType "T"; directives = []}::[]; implements = []}));

                );
            );

          describe "SchemaDefinition" (fun () ->  
              testProgram 
                "

            schema @test {
              query: Test
            }
            " 
                (sd {
                    directives = {name = "test"; arguments = []}::[];
                    operations = {operation = Query; tpe = "Test"}::[];
                  });
              testProgram 
                "

            schema @test {
              query: true subscription: Foo mutation: Bar
            }
            " 
                (sd {
                    directives = {name = "test"; arguments = []}::[];
                    operations = {operation = Query; tpe = "true"}::{operation = Subscription; tpe = "Foo"}::{operation = Mutation; tpe = "Bar"}::[];
                  });
            )
        )
    )