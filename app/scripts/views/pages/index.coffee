define ['backbone', 'appdata', 'cs!views/pages/show', 'hgn!templates/pages/index'], (Backbone, AppData, ShowPageView, template) ->
  
    class PagesIndexView extends Backbone.View
        template: template
        
        initialize: (options) ->
            @listenTo @collection, 'sync', @render
            @collection.fetch()
            AppData.collections.pages = @collection
            
        events: ->
            'click h1 a': 'showIndex'

        render: () ->
            @$el.html template()
            pageListing = @$el.find('ul.page-list')
            
            # Clears the the "no pages" message. 
            # Should be a better way
            if @collection.length != 0
                pageListing.html('')
            
            
            
            @collection.forEach (page) =>
                new ShowPageView
                    el: pageListing
                    model: page
                    
         showIndex: (e) ->
             e.preventDefault()
             path = $(e.target).attr('href')
             alert(path)
             AppData.router.navigate(path, trigger: true)   
              

    PagesIndexView
