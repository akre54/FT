Chaplin = require 'chaplin'
Model = require 'models/base/model'
config = require 'config'

module.exports = class Collection extends Chaplin.Collection
  apiRoot: config.api.versionRoot
  model: Model

  urlPath: ->
    ''

  url: ->
    @apiRoot + @urlPath()
