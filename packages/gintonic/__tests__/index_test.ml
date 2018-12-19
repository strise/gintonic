open Jest
open Expect

let testErrorMessage (name) (message) (s) (t) = 
  test name (fun () -> 
      expect
        (fun () -> 
           Index.transformSchema
             s
             t
        )
      |> toThrowMessage message)

let () =
  describe "index" (fun () -> 
      describe "transformSchema" (fun () -> 
          testErrorMessage 
            "Lex error"
            "line 1: char 1..2: GraphQL syntax error: Illegal character: ~" 
            "~~"
            "";
          testErrorMessage 
            "Lex error"
            "line 1: char 1..2: GraphQL transformation syntax error: Illegal character: ~" 
            "type Query { field: String } "
            "~";
          testErrorMessage 
            "Parse error"
            "line 1: char 6..7: GraphQL syntax error: Unexpected token { expected name" 
            "type { field: String } "
            "";
          testErrorMessage 
            "Parse error"
            "line 1: char 11..12: GraphQL transformation syntax error: Unexpected token X"
            "type Query { field: String } "
            "transform X";
          testErrorMessage 
            "Transform type error"
            "Transformation error: Field with name \"nonExistingField\" not found on type \"Query\"."
            "type Query { field: String } "
            "transform type Query { nonExistingField }";
          testErrorMessage 
            "Transform schema error"
            "Transformation error: Operation \"mutation\" not found on schema."
            "type Query { field: String } "
            "transform schema { mutation }";
          testErrorMessage 
            "Correction directive error"
            "Correction error: Failed to find argument \"i\" on directive \"@foobar\"."
            "
            input I { f1: String f2: String }
            input I { f1: String f2: String }
            type Query @foobar(i: true) { field: String } "
            "
            transform input I {
              f1 = \"locked\"
            }
            ";
          testErrorMessage 
            "Transform schema error"
            "Type error: An object type may declare that it implements one or more unique interfaces."
            "
            type Query implements I { field: String } "
            "
            transform type Query
            ";
          testErrorMessage 
            "Transform enum value error, non-null"
            "Check value error: Expected locked value of type non-null, got null."
            "
            type Query { field(arg: String! ): String } "
            "
            transform type Query { field (arg = null ) }
            ";
          testErrorMessage 
            "Transform enum value error, list string"
            "Check value error: Expected locked value of type list, got string."
            "
            type Query { field(arg: [String]! ): String } "
            "
            transform type Query { field (arg = \"foobar\" ) }
            ";
          testErrorMessage 
            "Transform enum value error, list int"
            "Check value error: Expected locked value of type list, got int."
            "
            type Query { field(arg: [String]! ): String } "
            "
            transform type Query { field (arg = 123 ) }
            ";
          testErrorMessage 
            "Transform enum value error, list float"
            "Check value error: Expected locked value of type list, got float."
            "
            type Query { field(arg: [String]! ): String } "
            "
            transform type Query { field (arg = 123.1 ) }
            ";
          testErrorMessage 
            "Transform enum value error, list bool"
            "Check value error: Expected locked value of type list, got boolean."
            "
            type Query { field(arg: [String]! ): String } "
            "
            transform type Query { field (arg = true ) }
            ";
          testErrorMessage 
            "Transform enum value error, list enum"
            "Check value error: Expected locked value of type list, got enum-value."
            "
            type Query { field(arg: [String]! ): String } "
            "
            transform type Query { field (arg = EV ) }
            ";
          testErrorMessage 
            "Transform enum value error, string enum"
            "Check value error: Expected locked value of type string, got enum-value."
            "
            type Query { field(arg: [String]! ): String } "
            "
            transform type Query { field (arg = [EV] ) }
            ";
          testErrorMessage 
            "Transform enum value error, list object"
            "Check value error: Expected locked value of type list, got object."
            "
            type Query { field(arg: [String]! ): String } "
            "
            transform type Query { field (arg = {foo: true} ) }
            ";
          testErrorMessage 
            "Transform enum value error"
            "Check value error: The enum value Ev1 is not found in the type E."
            "
            enum E { EV1 EV2 }
            type Query { field(arg: E ): String } "
            "
            transform type Query { field (arg = Ev1 ) }
            ";
          testErrorMessage 
            "Transform enum value error"
            "Check value error: Expected locked value of type object, got enum-value."
            "
            input I { f1: String!, f2: String }
            type Query { field(arg: I ): String } "
            "
            transform type Query { field (arg = Ev1 ) }
            ";
          testErrorMessage 
            "Transform enum value error"
            "Check value error: Failed to find field f3 on I."
            "
            input I { f1: String, f2: String }
            type Query { field(arg:I): String } "
            "
            transform type Query { field (arg = { f3 : true }) }
            ";
          testErrorMessage 
            "Transform enum value error"
            "Check value error: Expected locked value of type string, got boolean."
            "
            input I { f1: String, f2: String }
            type Query { field(arg:I): String } "
            "
            transform type Query { field (arg = { f2 : true }) }
            ";
          testErrorMessage 
            "Transform enum value error"
            "Check value error: Required field f1 missing from object."
            "
            input I { f1: String!, f2: Boolean }
            type Query { field(arg:I): String } "
            "
            transform type Query { field (arg = { f2 : true }) }
            "


        )
    )