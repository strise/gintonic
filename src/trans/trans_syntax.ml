
let n = Trans_ast.Null

let i(i: int) = (Trans_ast.Int (Int32.of_int i)) 

let b(b: bool) = (Trans_ast.Bool b) 

let l(vs: Trans_ast.value list): Trans_ast.value = Trans_ast.List vs

let a_doc (name: string)(value: Trans_ast.value)(doc: string): Trans_ast.arg = {name = name; value = value; doc = (Some doc) }
let a (name: string)(value: Trans_ast.value): Trans_ast.arg = {name = name; value = value; doc = None }

let (%+): (Trans_ast.field) -> (Trans_ast.arg) -> Trans_ast.field =
  fun s -> fun f -> {s with args = List.rev (f::(List.rev s.args))}


let fs(n: string): Trans_ast.field_selector = {name = n; alias = None}

let f_doc(s: Trans_ast.field_selector)(doc: string): Trans_ast.field = { field = s; args = []; doc = (Some doc)}  

let f(s: Trans_ast.field_selector): Trans_ast.field = { field = s; args = []; doc = None }  

let ($>): (Trans_ast.field_selector) -> (string) -> (Trans_ast.field_selector) =
  fun t -> fun a -> { name = a; alias = (Some t.name) }

let ($+): (Trans_ast.transformation) -> (Trans_ast.field) -> Trans_ast.transformation =
  fun s -> fun f -> {s with fields = List.rev (f::(List.rev s.fields))}

let (#>): (Trans_ast.tpe_selector) -> (string) -> (Trans_ast.tpe_selector) =
  fun t -> fun a -> { name = a; alias = (Some t.name) }

let ts(name: string): Trans_ast.tpe_selector = { name= name; alias = None}

let t_doc(s: Trans_ast.tpe_selector)(doc: string): Trans_ast.transformation = {doc= Some doc; fields= []; tpe= s}

let t(s: Trans_ast.tpe_selector): Trans_ast.transformation = { doc= None; fields= []; tpe= s}

let (#+): (Trans_ast.program) -> (Trans_ast.transformation) -> Trans_ast.program = 
  fun p -> fun t -> {transformations = List.rev (t::(List.rev p.transformations))}

let p: Trans_ast.program  = {transformations = [];}
