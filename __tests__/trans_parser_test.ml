open Jest
open Expect
open Trans_parser
open Trans_lexer
open Trans_syntax

let parse = prog read

let parseString(s: string) = parse (Lexing.from_string s)

let testName(program: string): string = "program: \"" ^ (String.escaped program) ^ "\""

let testProgram(program: string)(result: Trans_ast.program) =
  test (testName program) (
    fun () -> expect (parseString program) |> toEqual result
  )

let () = 
  describe "Trans_parser" (fun () -> 
      testProgram 
        "Foobar"
        (p #+ (t (ts "Foobar")));
      testProgram 
        "Foobar Baz"
        (p #+ 
         (t (ts "Foobar")) #+ 
         (t (ts "Baz")));
      testProgram 
        "Foobar: Baz"
        (p #+ (t ((ts "Foobar") #> "Baz")));
      testProgram 
        "
        Foobar: Baz {
            field1
            alias2: field2
        }"
        (p #+ 
         (t ((ts "Foobar") #> "Baz") $+ 
          f (fs "field1") $+ 
          f (fs "alias2" $> "field2")));
      testProgram 
        "
        \"\"\"desc\"\"\"
        Lol
        "
        (p #+ (t_doc (ts "Lol") "desc"));
      testProgram 
        "
        Lol {
            \"\"\"desc\"\"\"
            field
        }
        "
        (p #+ (t (ts "Lol") $+ f_doc (fs "field")  "desc"));
      testProgram 
        "
        Lol {
            field(arg: 123)
        }
        "
        (p #+ (t (ts "Lol") $+ (f (fs "field") %+ a "arg" (i 123)) ));
      testProgram 
        "
        Lol {

            field(
                \"\"\"desc\"\"\"
                arg: 123)
        }
        "
        (p #+ (t (ts "Lol") $+ (f (fs "field") %+ a_doc "arg" (i 123) "desc") ));

      testProgram 
        "
        Lol {
            field(arg: [123, 123, true, false, null])
        }
        "
        (p #+ 
         (t (ts "Lol") $+ 
          (f (fs "field") %+ 
           a "arg" (l ((i 123)::(i 123)::(b true)::(b false)::n::[])))));
    )