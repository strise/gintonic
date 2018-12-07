const fs = require('fs').promises
const Koa = require('koa')
const gqlt = require('@mitoai/gqltrans')
const { graphql, printSchema } = require('graphql')

const app = new Koa()

async function setup() {
    const s = (await fs.readFile('./schema.graphql')).toString("utf-8")
    const t = (await fs.readFile('./transformation.graphqlt')).toString("utf-8")

    const transformation = gqlt.transformSchema(s, t)
    const schema = gqlt.buildSchema(transformation)
    printSchema(schema)
    // const res = await graphql(schema, "")


    app.listen(3456);
}

setup().catch(err => console.error(err))
