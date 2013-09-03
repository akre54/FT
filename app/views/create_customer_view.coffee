FormView = require 'views/base/form_view'
template = require 'templates/create_customer'
Customer = require 'models/customer'

module.exports = class CreateCustomerView extends FormView
  template: template
  className: 'create-customer-form'
  saveEvent: 'customer:created'

  save: ->
    @model.set
      name: @$('input[name="name"]').val()
      email: @$('input[name="email"]').val()
      pin: @$('input[name="pin"]').val()
    super