Chaplin = require 'chaplin'
Site = require 'views/site_view'
Header = require 'views/header_view'
SessionController = require 'controllers/persistent/session_controller'

module.exports = class Controller extends Chaplin.Controller
  beforeAction: (params, route) ->
    @sessionController = new SessionController
    @compose 'site', Site
    @compose 'header', Header, region: 'header'
