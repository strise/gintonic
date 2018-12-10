const { transformQuery, transformSchema, buildSchema } = require('@mitoai/gqltrans')
const { print, Source, execute, parse, validate } = require('graphql')
const { getGraphQLParams } = require('express-graphql')

async function fetchFromUpstream({transformation, query, variables, fetcher, operationName}) {
  try {
    const newQueryAst = transformQuery(transformation, query)
    return await fetcher({query: print(newQueryAst), variables, operationName})
  } catch (err) {
    return { errors: [err] }
  }
}

function pathBuilder({prev, key}) {
  return `${prev ? pathBuilder(prev) : ''}.${key}`
}

async function exec({transformation, schema, query, variables, operationName, fetcher}) {
  if (!query) {
    throw httpError(400, 'Must provide query string.');
  }
  const source = new Source(query)
  let documentAst
  try {
    documentAst = parse(source);
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
    .reduce(([accL, accUnL], {message, path}) => {
      if (!path) {
        return [accL, [...accUnL, {message}]]
      }
      const p = path.reduce((acc, p) => `${acc}.${p}`, '')
      return [{...accL, [p]: message}, accUnL]
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
      return value[path.key]
    }
  )

  const errors = [...(result.errors || []), ...unlocatedErrors ]
  return {
    data: result.data,
    errors: errors.length ? errors : undefined
  }

}

module.exports = function ({ schema, transformation, fetcher}) {
  const t = transformSchema(schema, transformation)
  const s = buildSchema(t)
  return async ctx => {
    const params = await getGraphQLParams(ctx.req);

    const query = params.query;
    const variables = params.variables;
    const operationName = params.operationName;

    if (!query) {
      throw httpError(400, 'Must provide query string.');
    }

    const result = await exec({
      fetcher: (args) => fetcher({...args, ctx}),
      transformation: t,
      schema: s,
      query,
      variables,
      operationName
    })
    ctx.response.type = 'application/json';
    ctx.response.body = JSON.stringify(result);
  }
}
