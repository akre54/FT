Collection = require 'models/base/collection'
Customer   = require 'models/customer'

module.exports = class CustomersCollections extends Collection
  model: Customer

  url: 'http://dev.farmtab.com:3000'

  urlPath: ->
    '/farm/'
