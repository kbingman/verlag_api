define ['cs!presenters/presenter'], (Presenter) ->
    class PagePresenter extends Presenter
    
      message: 'Hello World! How are you?'
      
      path: ->
          "/pages/#{@_id}/edit"
    
    PagePresenter