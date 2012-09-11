Controller = require 'controllers/base/controller'

module.exports = class FarmsController extends Controller
  historyUrl: ''

  index: ->
    @model = new Farm()
    @view = new FarmView model: @model
