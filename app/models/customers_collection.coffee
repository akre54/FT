Collection = require 'models/base/collection'
Customer   = require 'models/customer'

module.exports = class CustomersCollections extends Collection
  model: Customer
