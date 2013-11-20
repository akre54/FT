$ = require 'jquery'
Application = require 'application'
routes = require 'routes'

$.ajaxSetup
  cors: true
  headers:
    'X-Api-Token': config.accessToken

$ ->
  new Application { title: 'Farm Tab', routes }