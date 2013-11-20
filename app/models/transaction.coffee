Model = require 'models/base/model'
mediator = require 'mediator'

module.exports = class Transaction extends Model
  urlPath: '/transactions/'

  defaults: ->
    farm_id: mediator.user.id
