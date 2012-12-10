mediator = require 'mediator'
PageView = require 'views/base/page_view'
template = require 'views/templates/farm'
Customer = require 'models/customer'
CustomersCollection = require 'models/customers_collection'
CustomersCollectionView = require 'views/customers_collection_view'

module.exports = class FarmView extends PageView
  autoRender: true
  className: 'farm-view'
  container: '#page-container'
  template: template

  initialize: ->
    super
    @delegate 'click', '.add-new-customer', @addNewCustomer

  renderSubviews: ->
    @subview 'customers', new CustomersCollectionView
      collection: mediator.user.customers
    
    @$el.append(subview.render().el) for subview in @subviews
    this

  addNewCustomer: ->
    mediator.publish '!startupController', 'customers', 'new'
