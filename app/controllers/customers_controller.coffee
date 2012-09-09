Controller = require 'controllers/base/controller'
Customer = require 'models/customer'
CustomerPageView = require 'views/customer_page_view'
CustomersCollection = require 'models/customers_collection'
CustomersCollectionView = require 'views/customers_collection_view'

module.exports = class CustomersController extends Controller
  historyURL: 'customers'

  index: ->
    @collection = new CustomersCollection()
    @view = new CustomersCollectionView collection: @collection
    @collection.fetch()

  show: (params) ->
    #@collection or= new CustomersCollection()
    #@model = @collection.find params.id
    @model = new Customer id: params.id
    @view = new CustomerPageView model: @model
    @model.fetch()
