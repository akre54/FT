Controller = require 'controllers/base/controller'
mediator = require 'mediator'

module.exports = class AuthenticatedController extends Controller
  beforeAction: ->
    super
    if mediator.user
      return true
    else
      @redirectToRoute('login')