require.define({
  'underscore': function(exports, require, module) {
    module.exports = _.noConflict();
    delete _;
  },
  'backbone': function(exports, require, module) {
    module.exports = Backbone.noConflict();
    delete Backbone;
  },
  'jquery': function(exports, require, module) {
    module.exports = $.noConflict(true);
    delete $;
  },
  'chaplin': function(exports, require, module) {
    module.exports = window.Chaplin;
    delete window.Chaplin;
  }
});