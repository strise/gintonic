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
            "line 1: char 1..2: GraphQL transformer syntax error: Illegal character: ~" 
            "type Query { field: String } "
            "~";
          testErrorMessage 
            "Parse error"
            "line 1: char 6..7: GraphQL syntax error: Unexpected token {" 
            "type { field: String } "
            "";
          testErrorMessage 
            "Parse error"
            "line 1: char 11..12: GraphQL transformer syntax error: Unexpected token X"
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
            "


        )
    )