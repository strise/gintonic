'use strict';

const k2e = require('koa-to-express')
const mw = require('@mitoai/gintonic-koa')
const upstreamUrl = "https://graphql.mito.ai/graphql"

const transformation = `
transform type Query { companyById }
transform type Company { id name }
`
const emw = k2e(mw({
  upstreamUrl,
  transformation
}))

exports.graphql = (req, res) => emw(req, res, function (err){
  console.error(err)
  res.status(err.status || 500).send(err.message)
})
