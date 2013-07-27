Chaplin = require 'chaplin'
SiteView = require 'views/site_view'

module.exports = class Controller extends Chaplin.Controller

  beforeAction: (params, route) ->
    @compose 'site', SiteView
