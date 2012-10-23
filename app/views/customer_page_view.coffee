PageView = require 'views/base/page_view'
Transaction = require 'models/transaction'
template = require 'views/templates/customer_page'

module.exports = class CustomerPageView extends PageView
  template: template
  autoRender: no

  initialize: ->
    super
    @delegate 'click', '#add-value', @openAddValue

  openAddValue: ->
    value = parseInt prompt('lets add some value to this bitch'), 10
    transaction = new Transaction
      customer_id: @model.id
      amount: value
    transaction.save()