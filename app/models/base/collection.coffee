Chaplin = require 'chaplin'
Model = require 'models/base/model'

module.exports = class Collection extends Chaplin.Collection
  model: Model

  initialize: (models, options) ->
    @url = options.url if options?.url?
    super

  url: ->
    urlPath = @urlPath()
    if urlPath
      @apiRoot + urlPath
    else
      throw new Error('Collection must redefine urlPath')
