CollectionView = require 'views/base/collection_view'
CustomerView = require 'views/customer_view'

module.exports = class CustomersCollectionView extends CollectionView
  tagname: 'ul'
  className: 'customer-list'
  itemView: CustomerView
