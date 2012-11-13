PageView = require 'views/base/page_view'
template = require 'views/templates/new_customer'
Customer = require 'models/customer'
CustomersCollection = require 'models/customers_collection'
CustomersCollectionView = require 'views/customers_collection_view'

module.exports = class NewCustomerView extends PageView

  initialize: ->
    super
    @delegate 'click', '#add-customer', @createCustomer

  createCustomer: ->
    name  = prompt 'gimme a name'
    email = prompt 'gimme an email'
    pin   = prompt 'gimme a pin'

    customer = new Customer
      name:  name
      email: email
      pin:   pin

    customer.save(
      success ->
        alert 'customer created!'
        mediator.customers.add customer
    )