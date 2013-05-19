define ['backbone', 'hgn!templates/pages/index'], (Backbone, template) ->
    class PagesIndexView extends Backbone.View
        template: template

        render: () ->
            # @template message: 'Hello World', (err, html) => @$el.html html
            @$el.html template(message: 'Hello World')

    PagesIndexView
