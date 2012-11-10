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
    value = parseFloat prompt('lets add some value to this bitch'), 10
    return unless value
    transaction = new Transaction
      customer_id: @model.id
      amount: value
    transaction.save {},
      success:  =>
        # will re-render the model
        @model.set balance: value + @model.get('balance')