CollectionView = require 'views/base/collection_view'
CustomerItemView = require 'views/customer_item_view'

module.exports = class CustomersCollectionView extends CollectionView
  tagName: 'ul'
  className: 'customer-list'
  itemView: CustomerItemView
  autoRender: true