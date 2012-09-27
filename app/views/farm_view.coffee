PageView = require 'views/base/page_view'
template = require 'views/templates/farm'
CustomersCollection = require 'models/customers_collection'
CustomersCollectionView = require 'views/customers_collection_view'

module.exports = class FarmView extends PageView
  className: 'farm-view'
  template: template
  container: '#page-container'

  renderSubviews: ->
    @subview 'customers', new CustomersCollectionView
      collection: @model.get 'customers'
    
    subview.render() for subview in @subviews
