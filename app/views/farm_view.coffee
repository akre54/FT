View = require 'views/base/view'
template = require 'views/templates/farm'
CustomersCollectionView = require 'views/customers_collection_view'

module.exports = class FarmView extends View
  template: template

  renderSubviews: ->
    @subview 'customers', new CustomersCollectionView
      collection: @model.customers


