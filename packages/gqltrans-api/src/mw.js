
const { getGraphQLParams } = require('express-graphql')
const { Source, execute, parse, validate, validateSchema } = require('graphql')
const { print } = require('graphql/language')
const { transformQuery, transformSchema, buildSchema, originalSchema } = require('@mitoai/gqltrans')
const fetch = require('node-fetch')
const httpError = require('http-errors')

const token = "INSERT SUPER SECRET TOKEN HERE"

module.exports = function gqlmiddleware({ schema, transformation }) {
    const t = transformSchema(schema, transformation)
    const s = buildSchema(t)
    const os = originalSchema(t)
    console.log("VALIDATE SCHEMA", validateSchema(s))
    return async ctx => {
        const params = await getGraphQLParams(ctx.req);

        // Get GraphQL params from the request and POST body data.
        const query = params.query;
        const variables = params.variables;
        const operationName = params.operationName;
        if (!query) {
            throw httpError(400, 'Must provide query string.');
        }
        const source = new Source(query)
        const documentAST = parse(source);
        // TODO handle parse errors
        console.log("VALIDATE DOCUMENT 1", validate(s, documentAST))
        // TODO validate
        // TODO check mutation vs method
        let ress
        try {
            const rq = transformQuery(t, documentAST)
            console.log("VALIDATE DOCUMENT 2", validate(s, rq))
            const res = await fetch('https://graphql.mito.ai/internal/graphql', {
                method: 'POST',
                body: JSON.stringify(
                    {
                        query: print(rq),
                        variables,
                        operationName
                    }
                ),
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${token}`
                }
            })
            ress = await res.json()
        } catch (err) {
            console.error(err)
        }

        const result = await execute(
            s,
            documentAST,
            ress.data,
            null,
            variables,
            operationName,
            null
        )
        ctx.response.type = 'application/json';
        ctx.response.body = JSON.stringify(result, null, 2);
    }
}
