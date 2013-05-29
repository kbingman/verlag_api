define ['backbone', 'jquery', 'appdata', 'cs!presenters/page', 'hgn!templates/pages/show'], (Backbone, $, AppData, PagePresenter, template) ->
  
    class ShowPageView extends Backbone.View
        template: template
        
        initialize: (options) ->
            @listenTo @model, 'change', @render
            @render()
            
        events: ->
            'click a.edit': 'edit'
            
        render: () ->
            context = new PagePresenter(@model)
            @$el.append template(context)
            
        edit: (e) ->
            e.preventDefault()
            path = $(e.target).attr('href')
            AppData.App.router.navigate(path, trigger: true)
            

    ShowPageView