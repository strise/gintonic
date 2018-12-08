const fetch = require('node-fetch')
const config = require('config')

const apiUrl = config.get('auth.api')
const clientId = config.get('auth.clientId')
const clientSecret = config.get('auth.clientSecret')
const apiId = config.get('auth.apiId')

let cache = null


module.exports = async function () {
    if (cache && cache.expires > (Date.now() + 10 * 1000)) {
        return cache.token
    }
    const res = await fetch(apiUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            variables: { clientId, clientSecret, apiId },
            query: `
            mutation ($apiId: ID! $clientId: ID! $clientSecret: String!){
                token: generateClientAccessToken(api: $apiId clientId: $clientId clientSecret: $clientSecret) {
                  expires token
                }
              }
              `
        })
    })
    const result = await res.json()

    if (result.errors && result.errors.length) {
        const [e] = result.errors
        throw new Error(e.message)
    }
    const { token, expires } = result.data.token
    cache = { token, expires: expires * 1000 }
    return token
}