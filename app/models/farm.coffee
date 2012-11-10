Model = require 'models/base/model'
Customer = require 'models/customer'
CustomersCollection = require 'models/customers_collection'

module.exports = class Farm extends Model
  urlKey: ''

  urlPath: ->
   '/farms'

  parse: (response) ->
    if response.customers?
      customers = new CustomersCollection response.customers, parse: yes
      _.extend response, {customers}
    response
