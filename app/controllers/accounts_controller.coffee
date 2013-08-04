Controller = require 'controllers/base/controller'

module.exports = class AccountsController extends Controller
  login: (params) ->
    @publishEvent '!adjustHeaderTitle', 'Log in'
    @publishEvent '!login'

  logout: (params) ->
    @publishEvent '!logout'