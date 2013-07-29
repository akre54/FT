Chaplin = require 'chaplin'
mediator = require 'mediator'
Farm = require 'models/farm'
CustomersCollection = require 'models/customers_collection'

# The application object
module.exports = class Application extends Chaplin.Application
  # Set your application name here so the document title is set to
  # “Controller title – Site title” (see Layout#adjustTitle)
  title: 'Farm Tab'

  # Create additional mediator properties
  # -------------------------------------
  initMediator: ->
    # Create a user property
    # TODO: this should be null until logged in. rest will get set on init
    mediator.user = new Farm
    mediator.user.customers = new CustomersCollection
    # Set up any semi-globals
    mediator.accessToken = 'somerandomcraptobesetlater'
    # Seal the mediator
    super
