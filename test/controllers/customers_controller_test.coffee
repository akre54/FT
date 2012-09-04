Customer = require 'models/customer'
CustomersCollection = require 'models/customers_collection'

describe 'Customers', ->
  beforeEach ->
    @model      = new Customer()
    @collection = new CustomersCollection()

  afterEach ->
    @model.dispose()
    @collection.dispose()

