Collection = require 'models/base/collection'
Customer   = require 'models/customer'

module.exports = class CustomersCollection extends Collection
  model: Customer

  urlPath: '/customers/'
