Controller = require 'controllers/base/controller'
Customer = require 'models/customer'
CustomersCollection = require 'models/customers_collection'

module.exports = class CustomersController extends Controller
  historyURL: 'customers'

  index: ->
    @collection = new CustomersCollection()
    @view = new CustomersCollectionView({@collection})

  show: (params) ->
    #@collection or= new CustomersCollection()
    #@model = @collection.find params.id
    @model = new Customer({id: params.id})
    @view = new CustomerPageView({@model})
    @model.fetch()
