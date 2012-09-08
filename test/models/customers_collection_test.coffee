Customer = require 'models/customer'
CustomersCollection = require 'models/customers_collection'

describe 'Customer', ->
  beforeEach ->
    @model = new Customer()
    @collection = new CustomersCollection({model: @model})

  afterEach ->
    @model.dispose()
    @collection.dispose()

  it 'should fetch users', ->
    @collection.fetch()
    @collection.length.should.be 35

