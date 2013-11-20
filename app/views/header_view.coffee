View = require 'views/base/view'
template = require 'templates/header'

module.exports = class HeaderView extends View
  tagName: 'header'
  className: 'bar-title'
  region: 'header'
  template: template
  autoRender: yes

  getTemplateData: -> { @title, @previous_text }

  listen:
    'loginStatus': 'render'
    'startupController': 'render'
    '!adjustHeaderPreviousText': (@previous_text) -> @render()
    '!adjustHeaderTitle': (@title) -> @render()

  events:
    'click .button-prev': 'goBack'

  goBack: ->
    # Chaplin.helpers.redirectTo 'previous'
