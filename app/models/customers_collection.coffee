Collection = require 'models/base/collection'
CustomersCollection = require 'models/customers_collection'

module.exports = class CustomersCollections extends Collection
  model: CustomersCollection
