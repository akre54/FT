_ = require 'underscore'
Chaplin = require 'chaplin'
Model = require 'models/base/model'
config = require 'config'

module.exports = class Collection extends Chaplin.Collection

  _(@prototype).extend Chaplin.SyncMachine

  initialze: ->
    super
    @on 'request', @beginSync
    @on 'sync', @finishSync

  apiRoot: config.api.versionRoot
  model: Model

  urlPath: ->
    ''

  url: ->
    @apiRoot + _.result this, 'urlPath'
