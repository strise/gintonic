let opt_map (m: 'a -> 'b) (o: 'a option): 'b option = match o with
  | Some a -> Some (m a)
  | None -> None

let o_to_list(o: 'a option): 'a list =   
  match o with
  | Some e -> e::[]
  | _ -> []

let o_fold_right: ('a -> 'b -> 'b) -> 'a option -> 'b -> 'b = fun f -> fun o -> List.fold_right f (o_to_list o)

let rec assoc_filter: 'a -> ('a * 'b) list -> 'b list =
  fun (a1: 'a) ->
  fun (l: ('a * 'b) list) -> 
    let 
      folder (e: 'a * 'b) (acc: 'b list) : 'b list = 
      match e with
      | (a2, b) -> if a2 == a1 then b::acc else acc
    in
    List.fold_right
      folder
      l
      []

let  assoc_opt: 'a -> ('a * 'b) list -> 'b option = 
  fun a ->
  fun l -> 
    try Some (List.assoc a l)
    with Not_found -> None

let find_opt: ('a -> bool) -> 'a list -> 'a option = 
  fun a ->
  fun l ->
    try Some (List.find a l)
    with Not_found -> None

let get_opt: 'a -> 'a list -> 'a option = 
  fun a -> find_opt (fun m -> m == a)

let rec flatten(l: 'a option list): 'a list = match l with 
  | [] -> []
  | (Some f)::fs -> f::(flatten fs)
  | None::fs -> flatten fs

let identity(a: 'a) : 'a = a
