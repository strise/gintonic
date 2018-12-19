# The Gintonic language

This project implements a tool for transforming GraphQL schemas with GraphQL transformer language.
These are exposed from the package as the following methods:

```javascript

function transformSchema(schema: string, transformation: string): Transform { ... }

function buildSchema(t: Transform): GraphQLSchema { ... }

function originalSchema(t: Transform): GraphQLSchema { ... }

function transformQuery(t: Transform, ast: GraphQLAst): GraphQLAst { ... } 

```

These can be used as follows 
```javascript
const {transformSchema, buildSchema, originalSchema, transformQuery} = require('@mitoai/gintonic')

const schema = "..."
const transformation = "..."

const t = transformSchema(schema, transformation)

const targetSchema = buildSchema(t)

const targetQueryAst = {...}

const sourceQueryAst = transformQuery(t, targetQueryAst)

```

The language is specified below.


## Transformation language

Specifying transformations is done with a transformation document. This document is validated against a schema, 
the source schema, and can then be used to produce a target schema and source queries.

### Document

```
document : transformation+
```

A document consists of a non-empty list of `transformation`s


### Transformation

```
transformation : type_transformation
               | schema_transformation
```


### Schema transformation

```
schema_transformation : "transform" "schema" variable_definitions schema_transformation_operations?
                      | "transform" "schema" schema_transformation_operations
```

```
schema_transformation_operations : "{" operation_type+ "}"
```

```
variable_definitions : "(" variable_definitions+ ")"
```

```
variable_definition : variable ":" type default_value_const?
```

```
variable : "$" name
```

### Operation type definition

```
operation_type :: /(query|mutation|subscription)/
```

### Type transformation

```
type_transformation : scalar_type_transformation
                    | object_type_transformation
                    | interface_type_transformation
                    | union_type_transformation
                    | enum_type_transformation
                    | input_object_type_transformation
```


### Scalar type transformation

```
scalar_type_transformation : description? "transform" "scalar" type_selector
```

Scalar transformation only supports type-aliasing and documentation. The type referenced in the
type selector must be defined and a scalar.

### Object type transformation

```
object_type_transformation : description? "transform" "type" type_selector fields_transformation?
```

Object type transformations support documenting the object, aliasing the type and selecting/aliasing the fields.
Notice that the object referenced in the type selector must exist and be of type object.


### Interface type transformation

```
interface_type_transformation : description? "transform" "interface" type_selector fields_transformation?
```
interface type transformations support documenting the object, aliasing the type and selecting/aliasing the fields.
Notice that the object referenced in the type selector must exist and be of type object.

All transformations performed on interfaces are not automatically propagated to the types implementing the interfaces. 
You need to make sure that the schema generated is a valid schema.

### Union type transformation

```
union_type_transformation : description? "transform" "union" type_selector
```

Union type transformation only supports type aliasing and documenting.

### Enum type transformation

```
enum_type_transformation : description? "transform" "enum" type_selector enum_values_transformation?
```

When transforming an enum, only aliasing and documentation is available. The number of enum values
in the source and target schema must be the same, therefore all enum values not provided will be transferred from the source schema as is. Enum aliasing is not supported.

#### Enum values transformation


```
enum_values_transformation : "{" enum_value_transformation+ "}"
```
```
enum_value_transformation : description? enum_value
```

### Input object type transformation

```
input_object_type_transformation description? "transform" "input" type_selector input_fields_transformation?
```

```
input_fields_transformation : "{" input_value+ "}"
```

Transforming input objects supports type-aliasing, documentation, and field aliasing. Just as with enum values; the
input objects must be equal in the source and target schemas, to the degree of aliasing and description. Therefore all fields not provided will automatically be included in the target schema.


### Type selector


```
type_selector : name
              | alias ":" name
```

### Fields transformation


```
fields_transformation : "{" field_transformation+ "}"
```


### Field transformation


```
field_transformation : description? field_selector arguments?
```


### Field selector


```
field_selector : name
               | alias ":" name
```


### Arguments

```
"(" input_value+ ")"
```

### Input value

```
input_value : description? name default_value?
```

```
default_value : "=" value
```
```
default_value_const : "=" value_const
```


### Description

```
description : string_value
```

### Name

```
name :: /[a-zA-Z][a-zA-Z0-9]*/
```

### Alias

```
alias : name
```

### Value

```
value : int_value
      | float_value
      | string_value
      | boolean_value
      | null_value
      | enum_value
      | list_value
      | object_value
      | variable
```
### Value const

```
value_const
      : int_value
      | float_value
      | string_value
      | boolean_value
      | null_value
      | enum_value
      | list_value_const
      | object_value_const
```

#### Int value

```
int_value : integer_part
```

```
integer_part : negative_sign? "0"
             | negative_sign? non_zero_digit digit*
```

```
negative_sign :: "-"
```


```
digit :: /[0-9]/
```

```
non_zero_digit :: /[1-9]/
```

#### Float value

```
float_value : integer_part fractional_part
            | integer_part exponent_part
            | integer_part fractional_part exponent_part
```

```
fractional_part : "." digit+
```

```
exponent_part : exponent_indicator sign? digit+
```

```
exponent_indicator :: /[eE]/
```

```
sign :: /[+\-]/
```

#### Boolean value

```
boolean_value :: /(true|false)/
```

#### String value

```
string_value : '"' string_character* '"'
             | '"""' block_string_character* '"""'
```

```
string_character : source_character \ ( '"' | "\" | line_terminator )
                 | "\u" escaped_unicode
                 | "\" escaped_character
```

```
escaped_unicode :: /[0-9][A-Fa-f]{4}/
```

```
escaped_character :: /["\\\/bfnrt]/
```

```
block_string_character : source_character \ ( '"""' | '\"""' )
                       | '\"""'
```

```
source_character :: /[\u0009\u000A\u000D\u0020-\uFFFF]/
```


```
line_terminator :: "\n"
                 | "\r\n"
                 | "\r"
```

#### Null value

```
null_value :: "null"
```

#### Enum value

```
enum_value : name \ ("true" | "false" | "null")
```

#### List value

```
list_value : "[" value* "]"
```


```
list_value_const : "[" value_const* "]"
```



#### Object values


```
object_value : "{" object_field* "}"
```

```
object_field : name ":" value
```

```
object_value_const : "{" object_field_const* "}"
```

```
object_field_const : name ":" value_const
```
