Model = require 'models/base/model'

module.exports = class Farm extends Model
  urlKey: ''

  urlPath: ->
    '/farms/'

  parse: (response) ->
    options = {model: Farm}
    if response.customers?
      customers = new CustomersCollection response.customers, options
      _extend response, {customers}
    response
