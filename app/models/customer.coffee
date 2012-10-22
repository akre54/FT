Model = require 'models/base/model'

module.exports = class Customer extends Model
    urlPath: =>
        '/customers/'