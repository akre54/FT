$ = require 'jquery'
Application = require 'application'
config = require 'config'
routes = require 'routes'

$.ajaxSetup
  cors: true
  headers:
    'X-Api-Token': config.accessoken

$ ->
  new Application { title: 'Farm Tab', routes }