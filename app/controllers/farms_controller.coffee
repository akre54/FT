Controller = require 'controllers/base/controller'
Farm = require 'models/farm'
FarmView = require 'views/farm_view'

module.exports = class FarmsController extends Controller
  historyUrl: ''

  index: ->
    @model = new Farm()
    @view = new FarmView model: @model
    @model.fetch()
