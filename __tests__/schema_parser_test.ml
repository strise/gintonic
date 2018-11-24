open Jest
open Expect
open Schema_ast

let parse = Schema_parser.document Schema_lexer.read

let parseString(s: string ): document = parse (Lexing.from_string s )

let testName(program: string): string = "program: \"" ^ (String.trim (String.escaped program)) ^ "\""

let testProgram(program: string)(result: document) =
  test (testName program) (
    fun () -> expect (parseString program) |> toEqual result
  )

let () = 
  describe "Schema_parser" (fun () ->  
      describe "TypeDefinition" (fun () ->  
          describe "ScalarTypeDefinition" (fun () ->  
              testProgram "scalar Int" {definitions = TypeDefinition (ScalarTypeDefinition {description = None; directives = []; name = "Int"})::[]};
              testProgram 
                "
            \"Foobar\"
            scalar Int
            " 
                {definitions = TypeDefinition (ScalarTypeDefinition {description = Some (StringValue "Foobar"); directives = []; name = "Int"})::[]};
            );
          describe "ScalarTypeDefinition" (fun () ->  
              testProgram "scalar Int" {definitions = TypeDefinition (ScalarTypeDefinition {description = None; directives = []; name = "Int"})::[]};
              testProgram 
                "
            \"Foobar\"
            scalar Int @test
            " 
                {definitions = TypeDefinition (ScalarTypeDefinition {description = Some (StringValue "Foobar"); directives = {name = "test"; arguments = []}::[]; name = "Int"})::[]};
            );
          describe "EnumTypeDefinition" (fun () ->  
              testProgram 
                "
            \"Foobar\"
            enum Lol
            " 
                {definitions = TypeDefinition (EnumTypeDefinition {description = Some (StringValue "Foobar"); directives = []; name = "Lol"; values= []})::[]};
              testProgram 
                "
            \"Foobar\"
            enum Lol 
            " 
                {definitions = TypeDefinition (EnumTypeDefinition {description = Some (StringValue "Foobar"); directives = []; name = "Lol"; values= []})::[]};
              testProgram 
                "
            \"Foobar\"
            # With comment
            enum Lol 
            " 
                {definitions = TypeDefinition (EnumTypeDefinition {description = Some (StringValue "Foobar"); directives = []; name = "Lol"; values= []})::[]};
              testProgram 
                "
            \"Foobar\"
            # With comment
            enum Lol @foobar 
            " 
                {definitions = TypeDefinition (EnumTypeDefinition {description = Some (StringValue "Foobar"); directives = {name="foobar";arguments = []}::[]; name = "Lol"; values= []})::[]};
              testProgram 
                "
            \"Foobar\"
            enum Lol {
              HERRO
                      \"Awesome\"
              FOO BAR
            }
            " 
                {definitions = TypeDefinition (EnumTypeDefinition {
                     description = Some (StringValue "Foobar"); 
                     directives = []; name = "Lol"; 
                     values= 
                       { description = None; value = "HERRO"; directives = []}
                       ::{ description = Some (StringValue "Awesome"); value = "FOO"; directives = []}
                       ::{ description = None; value = "BAR"; directives = []}
                       ::[]})::[]};
              testProgram 
                "
            \"Foobar\"
            enum Lol {
              HERRO @dir(asd: [true, false null FOOBAR])
                      \"Awesome\"
              FOO BAR
            }
            " 
                {definitions = TypeDefinition (EnumTypeDefinition {
                     description = Some (StringValue "Foobar"); 
                     directives = []; name = "Lol"; 
                     values= 
                       { description = None; value = "HERRO"; directives = {name = "dir"; arguments = {name = "asd"; value = ListValue ((BooleanValue true)::(BooleanValue false)::(NullValue)::(EnumValue "FOOBAR")::[]) }::[]}::[]}
                       ::{ description = Some (StringValue "Awesome"); value = "FOO"; directives = []}
                       ::{ description = None; value = "BAR"; directives = []}
                       ::[]})::[]};
            );
          describe "UnionTypeDefinition" (fun () ->  
              testProgram 
                "
            \"Foobar\"
            union Foo
            " 
                {definitions = TypeDefinition (UnionTypeDefinition {description = Some (StringValue "Foobar"); directives = []; name = "Foo"; types= []})::[]};
              testProgram 
                "
            union Foo = Bar
            " 
                {definitions = TypeDefinition (UnionTypeDefinition {description = None; directives = []; name = "Foo"; types= "Bar"::[]})::[]};
              testProgram 
                "
            union Foo = Baz | Bar
            " 
                {definitions = TypeDefinition (UnionTypeDefinition {description = None; directives = []; name = "Foo"; types= "Baz"::"Bar"::[]})::[]};
              testProgram 
                "
            union Foo = | Baz | Bar
            " 
                {definitions = TypeDefinition (UnionTypeDefinition {description = None; directives = []; name = "Foo"; types= "Baz"::"Bar"::[]})::[]};
              testProgram 
                "
            union Foo @test = | Baz | Bar
            " 
                {definitions = TypeDefinition (UnionTypeDefinition {description = None; directives = {name = "test"; arguments = []}::[]; name = "Foo"; types= "Baz"::"Bar"::[]})::[]};
            );
          describe "ObjectTypeDefinition" (fun () -> 
              testProgram 
                "
                type T {
                  field:  T
                }
                "
                {definitions = TypeDefinition (ObjectTypeDefinition {description = None; directives = []; name = "T"; fields = {description = None; name = "field"; arguments = []; tpe = NamedType "T"; directives = []}::[]; implements = []})::[]};
              testProgram 
                "
                type T {
                  field(arg: X = []):  T
                }
                "
                {definitions = TypeDefinition (ObjectTypeDefinition {description = None; directives = []; name = "T"; fields = {description = None; name = "field"; arguments = ({description = None; name = "arg"; tpe = NamedType "X"; defaultValue = Some (ListValue []); directives = []})::[]; tpe = NamedType "T"; directives = []}::[]; implements = []})::[]};
              testProgram 
                "
                type T {
                  field(arg: X = [123]):  T
                }
                "
                {definitions = TypeDefinition (
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
                       implements = []})::[]};
              testProgram 
                "
                type T {
                  field(arg: X = [123, true, null, 1.23, 1.0E10]):  T
                }
                "
                {definitions = TypeDefinition (
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
                       implements = []})::[]};
              testProgram 
                "
                type T {
                  field(arg: X = {}): T
                }
                "
                {definitions = TypeDefinition (ObjectTypeDefinition {description = None; directives = []; name = "T"; fields = {description = None; name = "field"; arguments = ({description = None; name = "arg"; tpe = NamedType "X"; defaultValue = Some (ObjectValue []); directives = []})::[]; tpe = NamedType "T"; directives = []}::[]; implements = []})::[]};

            );
        );

      describe "SchemaDefinition" (fun () ->  
          testProgram 
            "

            schema @test {
              query: Test
            }
            " 
            {definitions = SchemaDefinition {
                 directives = {name = "test"; arguments = []}::[];
                 operations = {operation = Query; tpe = "Test"}::[];
               }::[]};
          testProgram 
            "

            schema @test {
              query: true subscription: Foo mutation: Bar
            }
            " 
            {definitions = SchemaDefinition {
                 directives = {name = "test"; arguments = []}::[];
                 operations = {operation = Query; tpe = "true"}::{operation = Subscription; tpe = "Foo"}::{operation = Mutation; tpe = "Bar"}::[];
               }::[]};

        )
    )