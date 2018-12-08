const fs = require('fs').promises
const Koa = require('koa')
const Router = require('koa-router');
const app = new Koa()
const mw = require('./mw')
const cors = require('@koa/cors');

app.use(cors());


async function setup() {
    const schema = (await fs.readFile('./schema.graphql')).toString("utf-8")
    const transformation = (await fs.readFile('./transformation.graphqlt')).toString("utf-8")

    const router = new Router();

    router.all('/graphql', mw({ schema, transformation }))
    app.use(router.routes()).use(router.allowedMethods())
    console.log('Listening on port 3456')
    app.listen(3456);
}

setup().catch(err => console.error(err))
