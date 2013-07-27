View = require 'views/base/view'
Transaction = require 'models/transaction'
template = require 'templates/customer_page'

module.exports = class CustomerPageView extends View
  template: template
  container: '#page-container'
  autoRender: yes

  events:
    'click #add-value': 'openAddValue'
    'click #make-purchase': 'openMakePurchase'

  openAddValue: ->
    value = parseFloat prompt('lets add some value to this bitch')
    return unless value? && value > 0
    transaction = new Transaction
      customer_id: @model.id
      transaction_type: 'deposit'
      amount: value

    transaction.save null, success:  =>
      @model.set balance: value + @model.get('balance')
      @render()

  openMakePurchase: ->
    value = parseFloat prompt('lets make a purchase')
    return unless value && value > 0
    transaction = new Transaction
      customer_id: @model.id
      transaction_type: 'withdrawal'
      amount: value
    transaction.save null, success:  =>
      @model.set balance: @model.get('balance') - value
      @render()