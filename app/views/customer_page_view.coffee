View = require 'views/base/view'
Transaction = require 'models/transaction'
template = require 'templates/customer_page'

module.exports = class CustomerPageView extends View
  template: template
  region: 'page'
  autoRender: yes

  events:
    'click #add-value': 'openAddValue'
    'click #make-purchase': 'openMakePurchase'

  listen:
    'change model': 'render'

  render: ->
    @publishEvent '!adjustHeaderTitle', @model.get('name') || 'Customer page'
    super

  openAddValue: ->
    value = parseFloat prompt('lets add some value to this bitch')
    return unless value? && value > 0
    transaction = new Transaction
      customer_id: @model.id
      transaction_type: 'deposit'
      amount: value

    transaction.save null, success:  =>
      @model.set balance: @model.get('balance') + value

  openMakePurchase: ->
    value = parseFloat prompt('lets make a purchase')
    return unless value && value > 0
    transaction = new Transaction
      customer_id: @model.id
      transaction_type: 'withdrawal'
      amount: value
    transaction.save null, success:  =>
      @model.set balance: @model.get('balance') - value
