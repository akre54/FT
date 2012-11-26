Controller = require 'controllers/base/controller'
mediator = require 'mediator'
FarmView = require 'views/farm_view'
Farm = require 'models/farm'

module.exports = class FarmsController extends Controller
  title: 'My Farm'
  historyURL: ''

  index: (params = {}) ->
    @model = mediator.user

    if @model.isNew()
      @model.fetch
        success: =>
          @_render()
    else
      @_render()


  _render: =>
    @view or= new FarmView {@model}
