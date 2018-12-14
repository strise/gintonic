'use strict';

const k2e = require('koa-to-express')
const mw = require('@mitoai/gintonic-koa')
const upstreamUrl = "https://graphql.mito.ai/graphql"

const transformation = `
transform type Query { findCompanies }
transform type Company { 
  id 
  name 
  website 
  twitterUsername 
  facebookProfileId 
  stories(selection = RECENT, language = ENGLISH, first = 10)
}
transform type StoryConnection {
  edges
}
transform type StoryConnectionEdgeObject {
  node abstract relevant
}
transform type Story {
  size
}
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
