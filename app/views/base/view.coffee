Chaplin = require 'chaplin'
require 'lib/view_helpers'

module.exports = class View extends Chaplin.View

  getTemplateFunction: ->
    @template
