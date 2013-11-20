Chaplin = require 'chaplin'
Site = require 'views/site_view'
Header = require 'views/header_view'

module.exports = class Controller extends Chaplin.Controller
  beforeAction: (params, route) ->
    # Avoid circular dep. Fixme.
    @sessionController = new require 'controllers/persistent/session_controller'

    @compose 'site', Site
    @compose 'header', Header, region: 'header'
