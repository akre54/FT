mediator = require 'mediator'
PageView = require 'views/base/page_view'
template = require 'templates/farm'
Customer = require 'models/customer'
CustomersCollection = require 'models/customers_collection'
CustomersCollectionView = require 'views/customers_collection_view'

module.exports = class FarmView extends PageView
  autoRender: true
  className: 'farm-view'
  container: '#page-container'
  template: template

  renderSubviews: ->
    @subview 'customers', new CustomersCollectionView
      collection: mediator.user.customers
      container: @$el

    @$el.append(subview.render().el) for subview in @subviews
    this
