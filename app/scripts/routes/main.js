(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  verlagApi.Routers.RouterRouter = (function(_super) {
    __extends(RouterRouter, _super);

    RouterRouter.prototype.routes = {
      "": "index"
    };

    function RouterRouter(options) {
      RouterRouter.__super__.constructor.apply(this, arguments);
      this.app = options.app;
      this.view = new MainView({
        el: this.app.el
      });
      this.view.render();
    }

    RouterRouter.prototype.index = function() {
      return alert('main');
    };

    return RouterRouter;

  })(Backbone.Router);

}).call(this);
