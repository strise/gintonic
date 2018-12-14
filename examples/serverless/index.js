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

exports.graphql = (req, res) => {
  res.set('Access-Control-Allow-Origin', '*');
  if (req.method === 'OPTIONS') {
    // Send response to OPTIONS requests
    res.set('Access-Control-Allow-Methods', 'GET');
    res.set('Access-Control-Allow-Headers', 'Content-Type');
    res.set('Access-Control-Max-Age', '3600');
    res.status(204).send('');
  } else {
    emw(req, res, function (err) {
      console.error(err)
      res.status(err.status || 500).send(err.message)
    })
  }
}
