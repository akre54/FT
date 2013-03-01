CollectionView = require 'views/base/collection_view'
CustomerItemView = require 'views/customer_item_view'

module.exports = class CustomersCollectionView extends CollectionView
  tagName: 'ul'
  id: 'customer-list'
  className: 'list'
  itemView: CustomerItemView
  autoRender: true