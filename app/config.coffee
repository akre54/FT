config = {api: {}}

production = yes

config.api.root = if production
  'http://api.farmtab.com'
else
  'http://dev.farmtab.com:3000'

config.api.versionRoot = config.api.root

module.exports = config
