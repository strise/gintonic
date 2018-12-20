const Koa = require('koa')
const Router = require('koa-router')
const gt = require('../src')
const fetch = require('node-fetch')

const upstreamUrl = "https://graphql.mito.ai/graphql"
const transformationString = `
transform type Query {
  companyById(id = $id)
}
transform schema ($id: ID!)
`

const app = new Koa()

// Execute source query against source API
async function fetcher({ query, variables, operationName, ctx }) {
  const res = await fetch(upstreamUrl, {
    method: "POST",
    body: JSON.stringify({ query, variables, operationName }),
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
  fetcher,
  variables: { id: 'Q95' }
}))

app.use(router.routes()).use(router.allowedMethods())

app.listen(1337)
