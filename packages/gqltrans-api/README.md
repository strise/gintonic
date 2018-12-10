# GraphQL Transformer reference API

This projects contains a reference API implementation, which using a 
koa server exposes the transformed API and subsequently routes requests to the
source API. We encourage that you develop your own API that fits your needs.! 

Notice that this API is accepting JWT tokens, which when verified will
be exchanged for an upstream token. Accepting tokens that will only work for 
this API enables strong access separation, and can potentially remove the need
for scopes or other authentication mechanisms.  Assuming that the target API
is only accepting tokens with audience claim `T`, the upstream api only tokens with audience 
claim `S`, and that `S =/= T` then there is no chance that the user of the target API
can access data on the upstream API. Pretty neato! 

This API is configurable by environment variables, which includes:


| Variable | Description |
|----------|-------------|
| `TRANSFORMATION` | The GraphQL Transformation. If omitted, the API will look for the file `transformation.grapqht` in the current working directory. |
| `SCHEMA` | The upstream schema. If omitted, the schema will first look for the file `schema.graphql` in the current working directory. If not found it will be fetched on start up. |
| `UPSTREAM_URL` | The url for the upstream server. |
| `AUTH_CLIENT_ID` | Client id used for generating upstream tokens.|
| `AUTH_CLIENT_SECRET` | Client secret used for generating upstream tokens. |
| `AUTH_AUDIENCE` | Audience claim for the target api server. |
| `AUTH_DOMAIN` | Domain at witch the jwks can be fetched for token verification. |
  
