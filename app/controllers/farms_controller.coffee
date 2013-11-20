AuthController = require 'controllers/base/auth_controller'
mediator = require 'mediator'
FarmView = require 'views/farm_view'
Farm = require 'models/farm'

module.exports = class FarmsController extends AuthController
  title: 'My Farm'

  index: ->
    user = mediator.user
    @view = new FarmView { model: user, region: 'page' }
    user.fetch().then @view.render
