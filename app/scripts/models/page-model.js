(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'underscore'], function(Backbone, _) {
    var Page, _ref;

    return Page = (function(_super) {
      __extends(Page, _super);

      function Page() {
        _ref = Page.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      return Page;

    })(Backbone.Model);
  });

}).call(this);
