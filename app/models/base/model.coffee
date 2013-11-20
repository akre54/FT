_ = require 'underscore'
mediator = require 'mediator'
Chaplin = require 'chaplin'
config = require 'config'

module.exports = class Model extends Chaplin.Model
  apiRoot: config.api.versionRoot
  urlKey: 'id'

  _(@prototype).extend Chaplin.SyncMachine

  initialze: ->
    super
    @on 'request', @beginSync
    @on 'sync', @finishSync

  urlPath: ->
    ''

  urlParams: ->
    access_token: mediator.accessToken

  urlRoot: ->
    urlPath = _.result this, 'urlPath'
    if urlPath
      @apiRoot + urlPath

  url: (data = '') ->
    base = @urlRoot()
    full = if @get(@urlKey)?
      base + encodeURIComponent(@get(@urlKey)) + data
    else
      base + data
    sep = if full.indexOf('?') >= 0 then '&' else '?'
    params = @urlParams()
    payload = _(params).keys()
      .map (key) ->
        [key, params[key]]
      .filter (pair) ->
        pair[1]?
      .map (pair) ->
        pair.join('=')
      .join('&')
    url = if payload
      full + sep + payload
    else
      full
    url
