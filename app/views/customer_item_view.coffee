View = require 'views/base/view'
template = require 'views/templates/customer'

module.exports = class CustomerView extends View
  template: template
  tagName: 'li'
  className: 'customer-item'
