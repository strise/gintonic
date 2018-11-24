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

let () = 
  describe "Trans_parser" (fun () -> 
      testProgram 
        "transform Foobar"
        {transformations =
           {description = None; selector = {name = "Foobar"; alias = None}; fields = None} 
           ::[]};
      testProgram 
        "transform Foobar transform Baz"
        {transformations = 
           {description = None; selector = {name = "Foobar"; alias = None}; fields = None}::
           {description = None; selector = {name = "Baz"; alias = None}; fields = None}::
           []};
      testProgram 
        "transform Foobar: Baz"
        {transformations =
           {description = None; selector = {name = "Baz"; alias = Some "Foobar"}; fields = None} 
           ::[]};
      testProgram 
        "
        transform Foobar: Baz {
            field1
            alias2: field2
        }"
        {transformations =
           {
             description = None;
             selector = {name = "Baz"; alias = Some "Foobar"}; 
             fields = Some {
                 spread = false;
                 fields = 
                   {selector = {name = "field1"; alias = None}; arguments = []; description = None}::
                   {selector = {name = "field2"; alias = Some "alias2"}; arguments = []; description = None}::
                   []
               }} 
           ::[]};
      testProgram 
        "
        \"\"\"desc\"\"\"
        transform Lol
        "
        {transformations =
           {
             description = Some (BlockStringValue "desc");
             selector = {name = "Lol"; alias = None}; 
             fields = None} 
           ::[]};
      testProgram 
        "
        transform Lol {
            \"desc\"
            true
        }
        "
        {transformations =
           {
             description = None;
             selector = {name = "Lol"; alias = None}; 
             fields = Some {
                 spread = false;
                 fields = 
                   {
                     selector = {name = "true"; alias = None}; 
                     arguments = []; description = Some (StringValue "desc")}::
                   []
               }
           } 
           ::[]};
      testProgram 
        "
        transform Lol {
            null(arg: 123)
        }
        "
        {transformations = 
           {
             description = None;
             selector = {name = "Lol"; alias = None};
             fields = Some {
                 spread = false;
                 fields = 
                   {
                     selector = {name = "null"; alias = None}; 
                     arguments = 
                       {name = "arg"; value = (Some (IntValue (Int32.of_int 123))); description = None}
                       ::[]; description = None}::
                   []
               };
           }::[]};
      testProgram 
        "
        transform Lol {

            field(
                \"\"\"desc\"\"\"
                false: 123)
        }
        "
        {transformations = 
           {
             description = None;
             selector = {name = "Lol"; alias = None};
             fields = Some {
                 spread = false;
                 fields = 
                   {selector = {name = "field"; alias = None}; 
                    arguments = 
                      {name = "false"; value = (Some (IntValue (Int32.of_int 123))); description = Some (BlockStringValue "desc")}
                      ::[]; description = None}::
                   []
               };
           }::[]};

      testProgram 
        "
        transform Lol {

            field(
                \"\"\"desc\"\"\"
                false)
        }
        "
        {transformations = 
           {
             description = None;
             selector = {name = "Lol"; alias = None};
             fields = Some {
                 spread = false;
                 fields = 
                   {selector = {name = "field"; alias = None}; 
                    arguments = 
                      {name = "false"; value = None; description = Some (BlockStringValue "desc")}
                      ::[]; description = None}::
                   []
               };
           }::[]};


      testProgram 
        "
        transform Lol {
            field(arg: [123, 123, true, false, null])
        }
        "
        {transformations = 
           {
             description = None;
             selector = {name = "Lol"; alias = None};
             fields = Some {
                 spread = false;
                 fields = 
                   {
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
               };
           }::[]};
    )