Model = require 'models/base/model'
mediator = require 'mediator'

module.exports = class Transaction extends Model
    urlPath: ->
      '/transactions/'

    initialize: =>
      @set 'farm_id', mediator.user.id