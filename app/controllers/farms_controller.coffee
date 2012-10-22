Controller = require 'controllers/base/controller'
mediator = require 'mediator'
FarmView = require 'views/farm_view'

module.exports = class FarmsController extends Controller
  title: 'My Farm'
  historyUrl: ''

  index: (params = {}) ->

    farm = mediator.user

    if farm.isNew()
      farm.fetch
        success: =>
          @render farm
    else
      @render farm


  render: (farm) =>
    @view or= new FarmView
      model: farm
