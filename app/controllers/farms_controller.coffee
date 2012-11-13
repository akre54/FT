Controller = require 'controllers/base/controller'
mediator = require 'mediator'
FarmView = require 'views/farm_view'
Farm = require 'models/farm'

module.exports = class FarmsController extends Controller
  title: 'My Farm'
  historyURL: ''

  index: (params = {}) ->
    farm = mediator.user

    if farm.isNew()
      farm.fetch
        success: =>
          @_render farm
    else
      @_render farm


  _render: (farm) =>
    @view or= new FarmView
      model: farm
