open Jest
open Expect
open Schema_ast

let parse = Schema_parser.document Schema_lexer.read

let parseString(s: string ): document = parse (Lexing.from_string s )

let testName(program: string): string = "program: \"" ^ (String.escaped program) ^ "\""

let testProgram(program: string)(result: document) =
  test (testName program) (
    fun () -> expect (parseString program) |> toEqual result
  )

let () = 
  describe "Schema_parser" (fun () ->  
      testProgram "scalar Int" {definitions = TypeDefinition (ScalarTypeDefinition {description = None; directives = []; name = "Int"})::[]};
    )