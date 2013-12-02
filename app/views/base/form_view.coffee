View = require 'views/base/view'
SpinnerView = require 'views/spinner_view'

module.exports = class FormView extends View
  tagName: 'form'
  autoRender: yes

  listen:
    'loginStatus mediator': 'render'

  events:
    'click .cancel-form': 'dismiss'
    'submit': 'save'

  publishSave: (response) ->
    @publishEvent @saveEvent, response, @model if @saveEvent

  dismiss: (event) =>
    event?.preventDefault()
    @trigger 'dispose'
    @dispose()

  save: (event) =>
    event.preventDefault()
    spinner = new SpinnerView container: @$('.submit-form')
    @model.save()
      .done (response) =>
        @publishSave response
        @dismiss()
      .fail (response) =>
        spinner.dispose()