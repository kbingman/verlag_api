define ['backbone', 'underscore', 'appdata', 'cs!models/pages', 'cs!views/pages/index', 'cs!views/pages/edit'], (Backbone, _, AppData, Pages, PagesIndexView, PagesEditView) ->
    class RouterMain extends Backbone.Router
        routes:
            '': 'index'
            'pages/:id/edit': 'editPage'
        
        constructor: (options) ->
            super
          
            @app = options.app

        
        index: ->
            @view = new PagesIndexView
                el: @app.el
                collection: new Pages.PagesCollection()
                
        editPage: (id) ->
            console.log(AppData.collections.pages)
            @view = new PagesEditView
                el: @app.el
                id: id
 
            
    RouterMain
