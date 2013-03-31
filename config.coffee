exports.config =
  # See http://brunch.readthedocs.org/en/latest/config.html for documentation.
  files:
    javascripts:
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^vendor/
        'test/javascripts/test.js': /^test(\/|\\)(?!vendor)/
        'test/javascripts/test-vendor.js': /^test(\/|\\)(?=vendor)/
      order:
        # Files in `vendor` directories are compiled before other files
        # even if they aren't specified in order.before.
        before: [
          'vendor/scripts/console-helper.js',
          'vendor/scripts/jquery-1.9.0.js',
          'vendor/scripts/underscore-1.4.3.js',
          'vendor/scripts/backbone-0.9.10.js',
          'vendor/scripts/exports.js'
        ]

    stylesheets:
      joinTo:
        'stylesheets/app.css': /^app/
        'test/stylesheets/test.css': /^test/
      order:
        before: ['vendor/styles/bootstrap/bootstrap.less']

    templates:
      joinTo: 'javascripts/app.js'

  coffeelint:
    options:
      max_line_length:
        value: 100
        level: 'warn'
      indentation:
        level: 'ignore'
      line_endings:
        level: 'warn'
      no_stand_alone_at:
        level: 'error'
