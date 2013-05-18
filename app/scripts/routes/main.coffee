class verlagApi.Routers.RouterRouter extends Backbone.Router
    routes:
        "": "index"
    
    constructor: (options) ->
        super
    
        @app = options.app
    
    
        # Initialize root view
        @view = new MainView(el: @app.el)
        @view.render()
    
    index: ->
        # Main View
        alert('main')