mediator = require 'mediator'
Controller = require 'controllers/base/controller'
Customer = require 'models/customer'
CustomerPageView = require 'views/customer_page_view'
CustomersCollection = require 'models/customers_collection'
CustomersCollectionView = require 'views/customers_collection_view'
CreateCustomerView = require 'views/create_customer_view'

module.exports = class CustomersController extends Controller
  historyURL: 'customers'

  index: ->
    mediator.user.customers or= new CustomersCollection()

    @collection = mediator.user.customers
    @view = new CustomersCollectionView {@collection, container: '#page-container'}
    @collection.fetch() if @collection.isEmpty()

  show: (params) ->
    @model = new Customer id: params.id
    @view = new CustomerPageView {@model}
    @model.fetch()

  create: (params) ->
    @view = new CreateCustomerView
      model: new Customer()

    @view.subscribeEvent 'customer:created', (response, customer) ->
      alert 'customer created!'
      mediator.user.customers.add customer
      mediator.publish '!startupController', 'farms'
