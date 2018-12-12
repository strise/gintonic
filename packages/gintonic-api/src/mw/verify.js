const jwksClient = require('jwks-rsa')
const config = require('config')
const jwt = require('jsonwebtoken')

const client = jwksClient({
  jwksUri: `https://${config.get('auth.domain')}/.well-known/jwks.json`
})

function getKey (header, callback) {
  client.getSigningKey(header.kid, (err, key) => {
    if (err) {
      return callback(err)
    }
    const signingKey = key.publicKey || key.rsaPublicKey
    callback(null, signingKey)
  })
}

function verify (token) {
  return new Promise((resolve) => {
    jwt.verify(token, getKey, {
      audience: config.get('auth.audience'),
      issuer: `https://${config.get('auth.domain')}/`,
      algorithms: ['RS256']
    }, (err, decoded) => {
      if (err) {
        console.debug(err)
        return resolve(null)
      }
      resolve(decoded)
    })
  })
}

module.exports = function () {
  return async (ctx, next) => {
    ctx.state.authorized = false
    const token = ctx.headers.authorization
    if (!token) {
      return next()
    }
    if (!/^Bearer /.exec(token)) {
      return next()
    }
    ctx.state.authorized = await verify(token.substr(7))
    return next()
  }
}
