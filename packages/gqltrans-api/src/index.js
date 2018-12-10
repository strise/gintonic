const fs = require('fs').promises
const Koa = require('koa')
const Router = require('koa-router');
const app = new Koa()
const gqlt = require('@mitoai/gqltrans-koa')
const verify = require('./mw/verify')
const cors = require('@koa/cors');
const config = require('config')
const fetch = require('node-fetch')
const { introspectionQuery, buildClientSchema, printSchema } = require('graphql')
const auth = require('./auth')

const upstreamUrl = config.get('upstream.url')

app.use(cors());

async function fetchSchema() {
  const res = await fetch(upstreamUrl, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      query: introspectionQuery
    })
  })
  const { data, errors } = await res.json()
  if (errors) {
    return null
  }
  const r = printSchema(buildClientSchema(data))
  return r
}

async function cs() {
  const s = config.get('schema') || await (fs.readFile('./schema.graphql').then(b => b.toString('utf8'), () => null))
  if (s) {
    return s
  }
  console.log('Missing schema definition, trying to fetch from api...')
  return await fetchSchema()
}

async function c() {
  const schema = await cs()
  if (!schema) {
    throw new Error('Failed find schema')
  }
  const transformation = config.get('transformation') || (await fs.readFile('./transformation.graphqlt').then(b => b.toString('utf8'), () => null))
  if (!transformation) {
    throw new Error('Failed to find transformation')
  }
  return { schema, transformation }
}


async function setup() {
  const { schema, transformation } = await c()
  app.use(verify())
  const router = new Router();
  router.all('/graphql', gqlt({
    schema,
    transformation,
    fetcher: async ({ctx, query, variables, operationName}) => (
      await (await fetch(upstreamUrl, {
        method: 'POST',
        body: JSON.stringify({query, variables, operationName}),
        headers: {
          "Content-Type": "application/json",
          "Authorization": ctx.state.authorized ? `Bearer ${await auth()}` : undefined
        }
      })).json()
    )
  }))
  app.use(router.routes()).use(router.allowedMethods())
  console.log('Listening on port 3456')
  app.listen(3456);
}

setup().catch(err => console.error(err))
