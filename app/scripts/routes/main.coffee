define ['backbone', 'underscore','cs!views/pages/index'], (Backbone, _, PagesIndexView) ->
    class RouterMain extends Backbone.Router
        routes:
            '': 'index'
        
        constructor: (options) ->
            super
        
            @app = options.app

        
        index: ->
            # Main View
            @view = new PagesIndexView(el: @app.el)
            @view.render()

    RouterMain
