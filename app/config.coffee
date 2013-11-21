config = api: {}

production = no

config.api.root = if production
  'http://api.farmtab.com'
else
  'http://dev.farmtab.com:3000'

config.api.versionRoot = "#{config.api.root}/v1"

config.accessToken = '6099440a19fcd878'

module.exports = config
