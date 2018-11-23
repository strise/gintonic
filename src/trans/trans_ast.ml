
type tpe_selector = { 
  name: string;
  alias: string option;
}

type value = 
  | Bool of bool
  | String of string
  | Float of string
  | Int of int32
  | Null
  | List of value list

type arg = {
  name: string;
  value: value;
  doc: string option;
}

type field_selector = {
  name: string;
  alias: string option;
}


type field = {
  field: field_selector;
  args: arg list;
  doc: string option;
}

type transformation = {
  tpe: tpe_selector;
  fields: field list;
  doc: string option;
}

type program = {
  transformations : transformation list;
}

