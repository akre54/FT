mediator = require 'mediator'
AuthController = require 'controllers/base/auth_controller'
Customer = require 'models/customer'
CustomerPageView = require 'views/customer_page_view'
CustomersCollectionView = require 'views/customers_collection_view'
CreateCustomerView = require 'views/create_customer_view'

module.exports = class CustomersController extends AuthController
  beforeAction: ->
    super
    @collection = mediator.user.customers

  index: ->
    @view = new CustomersCollectionView { @collection, region: 'page' }
    @collection.fetch() if @collection.isEmpty()

  show: (params) ->
    @model = @collection.get params.id

    unless @model
      @model = @collection.add id: params.id
      @model.fetch()

    @view = new CustomerPageView {@model}

  new: ->
    @model = new @collection.model
    @view = new CreateCustomerView {@model}

    @view.subscribeEvent 'customer:created', (response, customer) =>
      @collection.add @model
      @redirectTo 'home'

  dispose: ->
    @model = @collection = null # remove reference so Chaplin wont dispose the model/collection. TODO implement composer
    super