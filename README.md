# GraphQL transformer

This projects contains our efforts to build scalable and maintainable GraphQL transformation tool. This is done by 
defining a new DSL, which is described and implemented at the 
[gqltrans](https://github.com/mitoai/graphql-transformer/tree/master/packages/gqltrans) sub-project.

Given a transformation, this implementation allows you to do two things:

1. Apply the transformation to a source schema thus generating a new target schema.
2. Apply the transformation to a query on the target schema thus generating a new query against the source schema.

**Example:** Given the schema

```graphql
type Query {
    field: String
    secretField: String
}
```

we may apply the transformation

```graphql
transform type Query {
  # Filter fields and alias 'field' to 'f'
  f: field
}

```

this transformation filters all fields on type `Query` that are not `field`, and aliases that field to `f`. 
This will generate the target schema

```graphql
type Query {
    f: String
}

```

Now given a query on the target schema:

```graphql
query {
    f
}
```

this can be transformed into a valid query on the source schema:

```graphql
query  {
    f: field
}
```
Notice that the result of the generated query is valid output for the previous query.

## Transformations

The language currently supports five transformation features, which can be applied to the different types and schema when
appropriate:

1. **Field and type aliasing**: Rename a filed or a type 
2. **Field filtering**: Filter fields from objects or interfaces
3. **Input locking**: Supply values to input, thus removing them from the target API
4. **Documenting**: Supply or overwrite documentation on fields, arguments, etc.
5. **Schema operation filtering**: Filter root-operations.

For each GraphQL type definition (object, union, interface, enum, and input object) and schema definition, there
exists a corresponding transformation:

### Schema transformation

The schema transformation supports schema operation filtering. This effectively allows you to exclude root operations
(query, mutation, or subscription) from your target API.

```graphql
# Source schema
schema {
    query: Query
    mutation: Mutation
    subscription: Subscription
}

# Transformation
transform schema {
    # Exclude any non-query operations
    query
}

# Target schema
schema {
    query: Query
}
```

This is a crude but effective way to disallow users from making any mutation calls on your API.

### Object type transformation

Object type transformations support field-filtering, field-aliasing, documenting, and input locking on arguments.

```graphql
# Source type
type Type {
    stringField: String
    fieldWithArguments(arg1: String arg2: String): String
    superSecretField: String
}

# Transformation

"New docs"                                              # Update type docs
transform type T: Type {                                # Type aliasing Type -> T
    stringField                                         # Include string-field
    field: stringField                                  # Field aliasing
    "New docs"                                          # Update field docs
    fieldWithArgument: fieldWithArguments(
        "New docs"
        arg1                                            # Update argument docs
        arg2: "Locked value"                            # Input locking
    )     
    # superSecretField is not specified, so it's filtered.    
}

# Target type

"New docs"
type T {
    stringField: String
    field: String
    "New docs"
    fieldWithArgument(
        "New docs"
        arg1: String
    ): String
}
```

notice that a field can be transformed arbitrary number of times. The only limitation being that the target schema 
must be valid.


### Interface type transformation

The interface type transformation supports the same features as the object type transformation. 


```graphql
# Source type
interface Type {
    stringField: String
    fieldWithArguments(arg1: String arg2: String): String
    superSecretField: String
}

# Transformation

"New docs"                                              # Update type docs
transform interface T: Type {                           # Type aliasing Type -> T
    stringField                                         # Include string-field
    field: stringField                                  # Field aliasing
    "New docs"                                          # Update field docs
    fieldWithArgument: fieldWithArguments(
        "New docs"
        arg1                                            # Update argument docs
        arg2: "Locked value"                            # Input locking
    )     
    # superSecretField is not specified, so it's filtered.    
}

# Target type

"New docs"
interface T {
    stringField: String
    field: String
    "New docs"
    fieldWithArgument(
        "New docs"
        arg1: String
    ): String
}
```

Notice that the validity of a transformation heavily relies in the validity of the target schema.
It is up to the implementer to ensure that all transformations are generating a valid target schema and that 
all implementing types have the appropriate fields.

### Scalar and Union transformations

The scalar and union transformations all support documenting and type-aliasing.

```graphql
# Source schema
union Union = T1 | T2 | T3

scalar Scalar

# Transformation
"New docs"                      # Type documentation
transform unon U: Union         # Type aliasing

"New docs"                      # Type documentation
transform scalar S: Scalar      # Type alias

# Target schema

"New docs"
union U = T1 | T2 | T3

"New docs"
scalar S
``` 

### Enum transformation

Similarly to scalar and union transformations, the enum transformation supports documenting and type-aliasing. It
does however also support enum value documentation.


```graphql
# Source schema
enum Enum {
    V1
    V2
}

# Transformation
"New docs"                  # Type docuemntation
transform enum E: Enum {    # Type alias
    "New docs"              # Value documentation
    V1
}

# Target schema
"New docs"
enum E {
    "New docs"
    V1
    V2
}

``` 

### Input object transformation

The input object transformation supports type-aliasing, documenting, and input locking:

```graphql
# Source schema

input Input {
    f1: String
    f2: String
}

# Transformation

"new docs"
transform input I: Input {
    "new docs"
    f1
    f2 = "Lock value"
}

# Target schema

"new docs"
input I {
    "new docs"
    f1: String
}

```

While we could consider doing field aliasing, notice that the input object is fundamentally different from objects.
Furthermore, remember that the target schema should always be valid. Therefor locking all fields will yield
an input object with no fields in the target schema. This is not valid. 

## Query transformation

The schema transformations would mean little without the ability to link actually retrieve data from the target API.
Therefor graphql-transformer allows you to transform a query against the target api to a query against the source API, 
where the result can be returned directly to the original caller.

E.g. with the following schemas and transformation:

```graphql
# Source schema
type Query {
    field(arg: String): String
}

# Transformation
transform type Query {
    f: field(arg = "locked"): String    # Field aliasing and argument locking
}

# Target schema
type Query {
    f: String
}

```

an incoming query to the target schema would be transformed into
```graphql
# Query against the target schema
query {
    f
}

# Transformed query

query {
    f: field(arg: "locked")
}

```

preserving the output structure, thus making field resolution trivial.

Notice that the target schema should always be served from a GraphQL API resolving meta-fields and validating 
incoming queries against the target schema.

## Reference API implementation

The sub-project contains an API reference implementation that uses *gqltrans* and deploys an api based
on the transformed schema. Read more about the implementation in the 
[gqltrans-api](https://github.com/mitoai/graphql-transformer/tree/master/packages/gqltrans-api) sub-project.
