# GraphQL Transformer Koa-middleware

Integrate with *gqltrans* with this koa middleware. By providing
a schema and transformation (as a string), and a fetcher for executing
source queries, this middleware will expose a GraphQL target
Api returing data from the source API.

```javascript
const Koa = require('koa')
const Router = require('koa-router')
const gqlt = require('@mitoai/gqltrans-koa')
const fetch = require('node-fetch')

const sourceApiUrl = "..."

const schemaString = "..."
const transformationString = "..."

const app = new Koa()

// Execute source query against source API
async function fetcher ({query, variables, operationName, ctx}) {
  const res = await fetch(sourceApiUrl, {
    method: "POST",
    body: JSON.stringify({query, variables, operationName}),
    headers: {
      'Content-Type': 'application/json'
    }
  })
  return res.json()
}

app.use(gqlt({
  schema: schemaString,
  transformation: transformationString,
  fetcher
}))

app.listen(1337)

```
