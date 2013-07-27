AuthController = require 'controllers/base/auth_controller'
mediator = require 'mediator'
FarmView = require 'views/farm_view'
Farm = require 'models/farm'

module.exports = class FarmsController extends AuthController
  title: 'My Farm'

  index: (params = {}) ->
    @user = mediator.user

    if @user.isNew()
      @user.fetch
        success: =>
          @view or= new FarmView {@user}
    else
      @view or= new FarmView {@user}
