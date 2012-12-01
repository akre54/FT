mediator = require 'mediator'
View = require 'views/base/view'

module.exports = class PageView extends View
  container: '#page-container'
  autoRender: yes
  renderedSubviews: no

  initialize: ->
    super
    if @model or @collection
      @modelBind 'change', => _.once @render()

  renderSubviews: ->
    return

  render: ->
    super
    unless @renderedSubviews
      @renderSubviews()
      @renderedSubviews = yes
