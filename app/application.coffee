Chaplin = require 'chaplin'
mediator = require 'mediator'
Farm = require 'models/farm'
SessionController = require 'controllers/persistent/session_controller'

# The application object
module.exports = class Application extends Chaplin.Application
  # Set your application name here so the document title is set to
  # “Controller title – Site title” (see Layout#adjustTitle)
  title: 'Farm Tab'

  initControllers: ->
    @sessionController = new SessionController

  # Create additional mediator properties
  # -------------------------------------
  initMediator: ->
    # Create a user property
    # TODO: this should be null until logged in. rest will get set on init
    mediator.user = new Farm
    # Set up any semi-globals
    mediator.accessToken = '6099440a19fcd878'
    # Seal the mediator
    @initControllers()
    super
