Controller = require 'controllers/base/controller'

module.exports = class AccountsController extends Controller
  login: (params) ->
    @publishEvent '!adjustHeaderTitle', 'Log in'
    @publishEvent '!showLogin'

  logout: (params) ->
    @publishEvent '!logout'