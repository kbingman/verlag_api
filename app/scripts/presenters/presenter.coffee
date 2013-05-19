define ['backbone'], (Backbone) ->
    class Presenter
    
      constructor: (model) ->
        @model = model
        # if @model
        #   (@[key] = value unless @[key]?) for own key, value of @model.attributes
    
      get: (name) ->
        @model.get name
    
    Presenter