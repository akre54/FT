Customer = require 'models/customer'

describe 'Customer', ->
  beforeEach ->
    @model = new Customer()

  afterEach ->
    @model.dispose()

  it 'should fetch customer info', ->
    @model.fetch()
    expect(@model.get 'balance').to.be
