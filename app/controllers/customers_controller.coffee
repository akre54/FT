mediator = require 'mediator'
AuthController = require 'controllers/base/auth_controller'
Customer = require 'models/customer'
CustomerPageView = require 'views/customer_page_view'
CustomersCollectionView = require 'views/customers_collection_view'
CreateCustomerView = require 'views/create_customer_view'

module.exports = class CustomersController extends AuthController
  beforeAction: ->
    @collection = mediator.user.customers
    super

  index: ->
    @view = new CustomersCollectionView { @collection, region: 'page' }
    @collection.fetch() if @collection.isEmpty()

  show: (params) ->
    @model = @collection.get(params.id)
    unless @model
      @model = new Customer id: params.id
      @collection.add {@model}
      @model.fetch()
    @view = new CustomerPageView {@model}

  new: (params) ->
    @model = new @collection.model
    @view = new CreateCustomerView {@model}

    @view.subscribeEvent 'customer:created', (response, customer) =>
      @collection.add @model
      mediator.publish '!router:routeByName', 'home'

  dispose: ->
    @model = @collection = null # remove reference so Chaplin wont dispose the model/collection. TODO implement composer
    super