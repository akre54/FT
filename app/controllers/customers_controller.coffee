mediator = require 'mediator'
AuthController = require 'controllers/base/auth_controller'
Customer = require 'models/customer'
CustomerPageView = require 'views/customer_page_view'
CustomersCollectionView = require 'views/customers_collection_view'
CreateCustomerView = require 'views/create_customer_view'

module.exports = class CustomersController extends AuthController
  beforeAction: (params) ->
    @collection = mediator.user.customers
    super

  index: ->
    @view = new CustomersCollectionView {@collection, container: '#page-container'}
    @collection.fetch() if @collection.isEmpty()

  show: (params) ->
    @model = @collection.get(params.id)
    unless @model
      @model = new Customer id: params.id
      @collection.add {@model}
      @model.fetch()
    @view = new CustomerPageView {@model}

  create: (params) ->
    @model = @collection.create {}, wait: true
    @view = new CreateCustomerView {@model}

    @view.subscribeEvent 'customer:created', (response, customer) ->
      mediator.publish '!router:routeByName', 'farms'
