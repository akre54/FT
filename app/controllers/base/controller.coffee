Chaplin = require 'chaplin'
Site = require 'views/site_view'
Header = require 'views/header_view'

module.exports = class Controller extends Chaplin.Controller

  beforeAction: (params, route) ->
    @compose 'site', Site
    @compose 'header', Header, region: 'header'
