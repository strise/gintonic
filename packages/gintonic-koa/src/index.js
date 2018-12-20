const { transformQuery, transformSchemaWithVariables, buildSchema } = require('@mitoai/gintonic')
const { print, Source, execute, parse, validate, printSchema, buildClientSchema, introspectionQuery } = require('graphql')
const { getGraphQLParams } = require('express-graphql')
const fetch = require('node-fetch')
const httpError = require('http-errors')

async function fetchFromUpstream({ transformation, query, variables, fetcher, operationName }) {
  try {
    const newQueryAst = transformQuery(transformation, query)
    return await fetcher({ query: print(newQueryAst), variables, operationName })
  } catch (err) {
    return { errors: [err] }
  }
}

function pathBuilder({ prev, key }) {
  return `${prev ? pathBuilder(prev) : ''}.${key}`
}

async function exec({ transformation, schema, query, variables, operationName, fetcher }) {
  if (!query) {
    throw httpError(400, 'Must provide query string.')
  }
  const source = new Source(query)
  let documentAst
  try {
    documentAst = parse(source)
  } catch (err) {
    return { errors: [err] }
  }
  const ves = validate(schema, documentAst)
  if (ves.length) {
    return { errors: ves }
  }
  const upstreamResult = await fetchFromUpstream({
    transformation,
    fetcher,
    query: documentAst,
    variables,
    operationName,
  })
  const [locatedErrors, unlocatedErrors] = (upstreamResult.errors || [])
    .reduce(([accL, accUnL], { message, path }) => {
      if (!path) {
        return [accL, [...accUnL, { message }]]
      }
      const p = path.reduce((acc, p) => `${acc}.${p}`, '')
      return [{ ...accL, [p]: message }, accUnL]
    }, [{}, []])
  const result = await execute(
    schema,
    documentAst,
    upstreamResult.data,
    null,
    variables,
    operationName,
    (value, x1, x2, { path }) => {
      const err = locatedErrors[pathBuilder(path)]
      if (err) {
        throw new Error(err)
      }
      return value && value[path.key]
    }
  )

  const errors = [...(result.errors || []), ...unlocatedErrors]
  return {
    data: result.data,
    errors: errors.length ? errors : undefined
  }

}

async function fetchSchema(fetcher) {
  const { data, errors } = await fetcher({ query: introspectionQuery })
  if (errors) {
    throw new Error(`Failed to fetch schema: ${errors.map(({ message }) => message).join(', ')}`)
  }
  return printSchema(buildClientSchema(data))
}

function defaultFetcher(url) {
  return async ({ query, operationName, variables }) =>
    await (
      await fetch(
        url,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            query, operationName, variables
          })
        }
      )
    ).json()
}

module.exports = function ({ schema: ss, transformation: ts, fetcher: f, upstreamUrl: u, variables: vars }) {
  if (!ss && !u && !f) {
    throw new Error('Failed to find schema, either provide schema as a string, an url for the upstream server, or a custom fetcher.')
  }
  if (!ts) {
    throw new Error('Not transformation provided. I don\'t know what to do!')
  }
  if (!f && !u) {
    throw new Error('No fetcher or upstream url provided. I don\'t know how to fetch upstream data')
  }
  const fetcher = f || defaultFetcher(u)
  const schemaP = ss ? Promise.resolve(ss) : fetchSchema(fetcher, u)
  const transformationP = schemaP.then(schema => transformSchemaWithVariables(schema, ts, vars || {}))
  const targetSchemaP = transformationP.then(t => buildSchema(t))
  return async ctx => {
    const transformation = await transformationP
    const targetSchema = await targetSchemaP
    const params = await getGraphQLParams(ctx.req)
    const query = params.query
    const variables = params.variables
    const operationName = params.operationName
    if (!query) {
      throw httpError(400, 'Must provide query string.')
    }

    const result = await exec({
      fetcher: (args) => fetcher({ ...args, ctx }),
      transformation,
      schema: targetSchema,
      query,
      variables,
      operationName
    })
    ctx.response.type = 'application/json'
    ctx.response.body = JSON.stringify(result)
  }
}
