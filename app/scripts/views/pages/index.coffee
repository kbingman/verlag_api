define ['backbone', 'cs!presenters/page', 'hgn!templates/pages/index'], (Backbone, PagePresenter, template) ->
    class PagesIndexView extends Backbone.View
        template: template

        render: () ->
            context = new PagePresenter()
            @$el.html template(context)

    PagesIndexView
