PageView = require 'views/base/page_view'
Transaction = require 'models/transaction'
template = require 'views/templates/customer_page'

module.exports = class CustomerPageView extends PageView
  template: template
  autoRender: no

  initialize: ->
    super
    @delegate 'click', '#add-value', @openAddValue
    @delegate 'click', '#make-purchase', @openMakePurchase

  openAddValue: ->
    value = parseFloat prompt('lets add some value to this bitch'), 10
    return unless value? && value > 0
    transaction = new Transaction
      customer_id: @model.id
      transaction_type: 'deposit'
      amount: value
    transaction.save {},
      success:  =>
        @model.set balance: value + @model.get('balance')
        @render()

  openMakePurchase: ->
    value = parseFloat prompt('lets make a purchase'), 10
    return unless value && value > 0
    transaction = new Transaction
      customer_id: @model.id
      transaction_type: 'withdrawal'
      amount: value
    transaction.save {},
      success:  =>
        @model.set balance: @model.get('balance') - value
        @render()