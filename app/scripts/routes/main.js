(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'underscore', 'cs!views/pages/index'], function(Backbone, _, PagesIndexView) {
    var RouterMain;

    RouterMain = (function(_super) {
      __extends(RouterMain, _super);

      RouterMain.prototype.routes = {
        '': 'index'
      };

      function RouterMain(options) {
        RouterMain.__super__.constructor.apply(this, arguments);
        this.app = options.app;
      }

      RouterMain.prototype.index = function() {
        this.view = new PagesIndexView({
          el: this.app.el
        });
        this.view.render();
        return console.log('main');
      };

      return RouterMain;

    })(Backbone.Router);
    return RouterMain;
  });

}).call(this);
