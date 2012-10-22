PageView = require 'views/base/page_view'
template = require 'views/templates/customer_page'

module.exports = class CustomerPageView extends PageView
  template: template
  autoRender: no