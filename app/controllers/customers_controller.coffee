mediator = require 'mediator'
Controller = require 'controllers/base/controller'
Customer = require 'models/customer'
CustomerPageView = require 'views/customer_page_view'
CustomersCollection = require 'models/customers_collection'
CustomersCollectionView = require 'views/customers_collection_view'

module.exports = class CustomersController extends Controller
  historyURL: 'customers'

  index: ->
    mediator.customers or= new CustomersCollection()
    @view = new CustomersCollectionView collection: mediator.customers
    mediator.customers.fetch() if mediator.customers.isNew()

  show: (params) ->
    @model = mediator.user.customers?.get(params.id) || new Customer id: params.id
    @view = new CustomerPageView model: @model
    @model.fetch() if @model.isNew
