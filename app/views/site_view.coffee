View = require 'views/base/view'
template = require 'templates/site'

module.exports = class SiteView extends View
  container: 'body'
  id: 'site-container'
  regions:
    header: '#header-container'
    page: '#page-container'
  template: template
  template = null