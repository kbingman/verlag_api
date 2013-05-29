define [
    'backbone' 
    'jquery' 
    'appdata'
    'cs!models/pages'
    'cs!presenters/page'
    'hgn!templates/pages/edit'
], (Backbone, $, AppData, Pages, PagePresenter, template) ->
  
    class ShowPageView extends Backbone.View
        template: template
        
        initialize: (options) ->
            if AppData.collections.pages
                @model = AppData.collections.pages.get(options.id)
            else 
                @model = new Pages.Page(id: options.id)

            @listenTo @model, 'change', @render
            @model.fetch()
            
        events: ->

            
        render: () ->
            context = new PagePresenter(@model)
            @$el.append template(context)
            


    ShowPageView