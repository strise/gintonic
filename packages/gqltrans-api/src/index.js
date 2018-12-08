const fs = require('fs').promises
const Koa = require('koa')
const Router = require('koa-router');
const app = new Koa()
const mw = require('./mw')
const cors = require('@koa/cors');
const config = require('config')
const fetch = require('node-fetch')
const { introspectionQuery, buildClientSchema, printSchema } = require('graphql')

app.use(cors());

async function fetchSchema() {
  const res = await fetch(config.get('upstream.api'), {
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
  const router = new Router();
  router.all('/graphql', mw({ schema, transformation }))
  app.use(router.routes()).use(router.allowedMethods())
  console.log('Listening on port 3456')
  app.listen(3456);
}

setup().catch(err => console.error(err))
