View = require 'views/base/view'
template = require 'templates/header'

module.exports = class HeaderView extends View
  id: 'header'
  tagName: 'header'
  className: 'header'
  template: template
  autoRender: yes

  getTemplateData: ->
    { @title, @previous_text }

  initialize: ->
    super
    @subscribeEvent 'loginStatus', @render
    @subscribeEvent 'startupController', @render
    @subscribeEvent '!adjustHeaderPreviousText', (@previous_text) -> @render()
    @subscribeEvent '!adjustHeaderTitle', (@title) -> @render()

  events:
    'click .button-prev': 'goBack'

  goBack: ->
    window.history.back()
