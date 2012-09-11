View = require 'views/base/view'
template = require 'views/templates/farm'
CustomersCollectionView = require 'view/customers_collection'

module.exports = class FarmView extends View
  template: template

  renderSubviews: ->
    @subview 'customers', new CustomersCollectionView
      collection: @model.customers


