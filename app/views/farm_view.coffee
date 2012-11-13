mediator = require 'mediator'
PageView = require 'views/base/page_view'
template = require 'views/templates/farm'
Customer = require 'models/customer'
CustomersCollection = require 'models/customers_collection'
CustomersCollectionView = require 'views/customers_collection_view'

module.exports = class FarmView extends PageView
  className: 'farm-view'
  template: template
  container: '#page-container'

  initialize: ->
    super
    @delegate 'click', '.add-new-customer', @addNewCustomer

  renderSubviews: ->
    @subview 'customers', new CustomersCollectionView
      collection: mediator.user.customers
    
    @$el.append(subview.render().el) for subview in @subviews
    this

  addNewCustomer: ->
    mediator.publish '!startupController', 'customers', 'create' #, params
