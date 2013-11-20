{mediator} = require('chaplin')
config = require('config')

mediator.accessToken = config.accessToken

module.exports = mediator
