mediator = require 'mediator'
Model = require 'models/base/model'
Customer = require 'models/customer'
CustomersCollection = require 'models/customers_collection'

module.exports = class Farm extends Model
  urlKey: ''

  urlPath: ->
    '/farms'

  initialize: (options) ->
    @customers = new CustomersCollection

  # context-less because service_provider.coffee needs to call using prototype
  parse: (response) ->
    if response.customers?
      mediator.user.customers.reset response.customers, parse: yes
      delete response.customers
    response
