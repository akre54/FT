AuthController = require 'controllers/base/auth_controller'
mediator = require 'mediator'
FarmView = require 'views/farm_view'
Farm = require 'models/farm'

module.exports = class FarmsController extends AuthController
  title: 'My Farm'

  index: (params = {}) ->
    @model = mediator.user

    if @model.isNew()
      @model.fetch
        success: =>
          @view or= new FarmView {@model}
    else
      @view or= new FarmView {@model}
