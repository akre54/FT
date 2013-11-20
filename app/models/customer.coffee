Model = require 'models/base/model'

module.exports = class Customer extends Model
  urlPath: '/customers/'

  defaults:
    name: ''
    balance: 0.00

  # Rails' BigDecimal.to_json returns the balance as a String. We need it as a float
  parse: (response) ->
    response.balance = parseFloat response.balance
    response
