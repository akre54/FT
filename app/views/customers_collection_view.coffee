CollectionView = require 'views/base/collection_view'
CustomerItemView = require 'views/customer_item_view'
mediator = require 'mediator'

module.exports = class CustomersCollectionView extends CollectionView
  tagName: 'ul'
  id: 'customer-list'
  className: 'list'
  itemView: CustomerItemView
  autoRender: true

  initialize: ->
    @publishEvent '!adjustHeaderTitle', mediator.user.get 'name'
    super
