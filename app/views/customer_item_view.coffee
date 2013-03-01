View = require 'views/base/view'
template = require 'views/templates/customer_item'

module.exports = class CustomerItemView extends View
  template: template
  tagName: 'li'
  className: 'customer-item chevron'