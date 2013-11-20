mediator = require 'mediator'
View = require 'views/base/view'
template = require 'templates/farm'
Customer = require 'models/customer'
CustomersCollection = require 'models/customers_collection'
CustomersCollectionView = require 'views/customers_collection_view'

module.exports = class FarmView extends View
  autoRender: true
  className: 'farm-view'
  region: 'page'
  template: template

  render: ->
    super
    @subview 'customers', new CustomersCollectionView
      collection: @model.customers
      container: @$el

    @$el.append(subview.render().el) for subview in @subviews
    this
