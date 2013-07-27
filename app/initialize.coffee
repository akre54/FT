$ = require 'jquery'
Application = require 'application'
routes = require 'routes'

$ ->
  new Application { title: 'Farm Tab', routes }