open Jest
open Expect
open Trans_lexer
open Trans_parser

let rec lex (buffer: Lexing.lexbuf): token list = 
  let t = read buffer in
  match t with
  | EOF -> t::[]
  | _ -> t::(lex buffer)



let testLexToEqual (program: string)(result: token list): unit -> assertion = 
  fun () -> expect (lex (Lexing.from_string program)) |> toEqual result

let testName(program): string = "program: \"" ^ (String.escaped program) ^ "\""

let testProgram (program: string)(result: token list): unit = 
  test (testName program) (testLexToEqual program result)

let testSingleToken (program: string)(token: token): unit = 
  testProgram program (token::EOF::[])

let testEmptyProgram (program: string): unit =
  testProgram program (EOF::[])

let testLexError (program: string)(e: 'a): unit =
  test (testName program) (fun () -> 
      expect (fun () -> lex (Lexing.from_string program)) |> (toThrowException e)
    )

let () =
  describe "Trans_lexer" (fun () -> 
      testEmptyProgram " ";
      testEmptyProgram "\n";
      testEmptyProgram "\t";
      testSingleToken ":" COLON;
      testEmptyProgram ",";
      testSingleToken "{" L_BRACKET;
      testSingleToken "}" R_BRACKET;
      testSingleToken "(" L_PAREN;
      testSingleToken ")" R_PAREN;
      testSingleToken "[" L_SQ_BRACKET;
      testSingleToken "]" R_SQ_BRACKET;
      testEmptyProgram "#asdasd";
      testEmptyProgram "#asdasd";
      testSingleToken "#asdasd
      null" NULL;
      testSingleToken "true" TRUE;
      testSingleToken "false" FALSE;
      testSingleToken "null" NULL;
      testSingleToken "1234" (INT "1234");
      testSingleToken "-1234" (INT "-1234");
      testSingleToken "1234.0" (FLOAT "1234.0");
      testSingleToken "-1234.0" (FLOAT "-1234.0");
      testSingleToken "1234e12" (FLOAT "1234e12");
      testSingleToken "-1234e12" (FLOAT "-1234e12");
      testSingleToken "\"foobar\"" (STRING "foobar");
      testSingleToken "\"fo\\\"obar\"" (STRING "fo\\\"obar");
      testSingleToken "\"fo\\nobar\"" (STRING "fo\\nobar");
      testSingleToken "\"fo\\bobar\"" (STRING "fo\\bobar");
      testSingleToken "\"fo\\tobar\"" (STRING "fo\\tobar");
      testSingleToken "\"fo\\robar\"" (STRING "fo\\robar");
      testSingleToken "\"fo\\fobar\"" (STRING "fo\\fobar");
      testSingleToken "\"\"\"foobar\"baz\"\"\"" (BLOCK_STRING "foobar\"baz");
      testSingleToken "\"\"\"
      foobar
      baz\"\"\"" (BLOCK_STRING "
      foobar
      baz");
      testLexError "\"" (LexError ("String not terminated", {pos_fname = ""; pos_lnum = 1; pos_bol = 0; pos_cnum = 1}));
      testLexError "\"\\q" (LexError ("Illegal character escape", {pos_fname = ""; pos_lnum = 1; pos_bol = 0; pos_cnum = 1}));
      testSingleToken "foobar" (NAME "foobar");
      testSingleToken "truename" (NAME "truename");
      testSingleToken "foobar1234" (NAME "foobar1234");
      testSingleToken "a123" (NAME "a123");
      testProgram 
        "
        Company: Entity {
            test(lol:123, laz: \"123\"), foo, bar, baz,,
        }
        " 
        (
          (NAME "Company")
          ::COLON
          ::(NAME "Entity")
          ::L_BRACKET
          ::(NAME "test")
          ::L_PAREN
          ::(NAME "lol")
          ::COLON
          ::(INT "123")
          ::(NAME "laz")
          ::COLON
          ::(STRING "123")
          ::R_PAREN
          ::(NAME "foo")
          ::(NAME "bar")
          ::(NAME "baz")
          ::R_BRACKET
          ::EOF
          ::[])
    )
