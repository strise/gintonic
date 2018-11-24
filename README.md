# GraphQL transformation

This projects implements a tool for transforming GraphQL schemas with GraphQL transformation langauge.

The language is specified below.


## Transfomration language

Specifying transformations is done with a transformation document.

### Document

```
document : transformation+
```

A document consists of a non-empty list of `transformation`s


### Transformation

```
transformation : description? "transform" type_selector fields_transformation?
```

### Type selector


```
type_selector : name
              | alias ":" name
```

### Fields transformation


```
fields_transformation : "{" spread? field_transformation+ "}"
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
"(" described_argument+ ")"
```

### Argument

```
described_argument : description? argument
```

```
argument : name ":" value
         | name
```

### Description

```
description : string_value
```

### Spread

```
spread : "..."
```


### Name

```
name : /[a-zA-Z][a-zA-Z0-9]*/
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
negative_sign : "-"
```


```
digit : /[0-9]/
```

```
non_zero_digit : /[1-9]/
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
exponent_indicator : /[eE]/
```

```
sign : /[+\-]/
```

#### Boolean value

```
boolean_value : /(true|false)/
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
escaped_unicode : /[0-9][A-Fa-f]{4}/
```

```
escaped_character : /["\\\/bfnrt]/
```

```
block_string_character : source_character \ ( '"""' | '\"""' )
                       | '\"""'
```

```
source_character : /[\u0009\u000A\u000D\u0020-\uFFFF]/
```


```
line_terminator : "\n"
                | "\r\n"
                | "\r"
```

#### Null value

```
null_value : "null"
```

#### Enum value

```
enum_value : name \ ("true" | "false" | "null")
```

#### List value

```
list_value : "[" value* "]"
```



#### Object values


```
object_value : "{" object_field* "}"
```

```
object_field : name ":" value
```
