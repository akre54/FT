View = require 'views/base/view'
template = require 'views/templates/header'

module.exports = class HeaderView extends View
  id: 'header'
  tagName: 'header'
  className: 'header'
  template: template
  autoRender: yes

  # always has to be the first item in the body for ratchet to work
  container: 'body'
  containerMethod: 'prepend'

  initialize: ->
    super
    @subscribeEvent 'loginStatus', @render
    @subscribeEvent 'startupController', @render
    @subscribeEvent '!adjustTitle', @render
