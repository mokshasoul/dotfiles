// .commitlintrc.js
const fs = require('node:fs')
const path = require('node:path')

const packages = fs.readdirSync(path.resolve(__dirname, 'private_dot_config'))
module.exports = {
  prompt: {
    scopes: [...packages]
  }
}
