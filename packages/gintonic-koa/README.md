# GraphQL Transformer Koa-middleware

Start using GraphQL Transformer with the koa middleware. 

## Getting started
Install the koa middleware
```bash
npm i @mitoai/gintonic-koa
```

By providing
a schema and transformation (as a string), and a fetcher for executing
source queries, this middleware will expose a GraphQL target
Api returing data from the source API.

```javascript
const Koa = require('koa')
const Router = require('koa-router')
const gt = require('@mitoai/gintonic-koa')
const fetch = require('node-fetch')

const upstreamUrl = "https://example.com/graphql"
const transformationString = "transform schema { query }"

const app = new Koa()

// Execute source query against source API
async function fetcher ({query, variables, operationName, ctx}) {
  const res = await fetch(upstreamUrl, {
    method: "POST",
    body: JSON.stringify({query, variables, operationName}),
    headers: {
      'Content-Type': 'application/json'
    }
  })
  return res.json()
}

const router = new Router()
router.all('/graphql', gt({
  upstreamUrl,
  transformation: transformationString,
  fetcher
}))

app.use(router.routes()).use(router.allowedMethods())

app.listen(1337)

```
