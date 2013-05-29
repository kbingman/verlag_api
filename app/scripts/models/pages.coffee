define ['backbone', 'underscore'], (Backbone, _) ->
    Pages = {}
    
    class Pages.Page extends Backbone.Model
      
        url: '/api/pages'
      
    
    class Pages.PagesCollection extends Backbone.Collection
      
        url: '/api/pages'
        
        model: Pages.Page
        
    Pages