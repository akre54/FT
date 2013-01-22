require.define({'underscore': function(exports, require, module) {
  module.exports = _.noConflict();
}});

require.define({'backbone': function(exports, require, module) {
  module.exports = Backbone.noConflict();
}});

require.define({'jquery': function(exports, require, module) {
  $.noConflict();
  var Backbone = require('backbone');
  module.exports = Backbone.$;
}});