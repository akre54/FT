CollectionView = require 'views/base/collection_view'
Customer = require 'view/customer'

module.exports = class CustomersCollectionView extends CollectionView
  tagname: 'ul'
  className: 'customer-list'
  itemView: Customer
