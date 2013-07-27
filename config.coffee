exports.config =
  # See http://brunch.readthedocs.org/en/latest/config.html for documentation.
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^(bower_components|vendor)/

    stylesheets:
      joinTo:
        'stylesheets/app.css': /^app/
        'test/stylesheets/test.css': /^test/

    templates:
      joinTo: 'javascripts/app.js'

  plugins:
    coffeelint:
      options:
        arrow_spacing:
          level: 'warn'
        max_line_length:
          value: 100
          level: 'warn'
        indentation:
          level: 'ignore'
        line_endings:
          level: 'warn'
        no_empty_param_list:
          level: 'warn'
        no_stand_alone_at:
          level: 'error'
