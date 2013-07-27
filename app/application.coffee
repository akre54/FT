{Application} = require 'chaplin'
mediator = require 'mediator'
routes = require 'routes'
Layout = require 'views/layout'
Farm = require 'models/farm'
CustomersCollection = require 'models/customers_collection'

# The application object
module.exports = class Application extends Application
  # Set your application name here so the document title is set to
  # “Controller title – Site title” (see Layout#adjustTitle)
  title: 'Farm Tab'

  # Override standard layout initializer
  # ------------------------------------
  initLayout: (options = {}) ->
    options.title ?= @title
    @layout = new Layout options

  # Create additional mediator properties
  # -------------------------------------
  initMediator: ->
    # Create a user property
    mediator.user = new Farm()
    mediator.user.customers = new CustomersCollection()
    # Set up any semi-globals
    mediator.accessToken = 'somerandomcraptobesetlater'
    # Seal the mediator
    super
