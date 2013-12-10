'use strict';

define(
  [
    'flight/lib/component'
  ],
  
  function(defineComponent) {

    return defineComponent(pageHistory);

    function pageHistory() {
      
      this.openLocation = function(e, data){
        
        history.pushState({title: 'title'}, 'title', data.path);
        console.log(document.location.pathname)
      }
      
      this.listenForHistory = function(){
        console.log('initialized');
        window.onpopstate = function (event) {
          // see what is available in the event object
          console.log('event')
          console.log(event)
        }
      }
      
      this.after('initialize', function () {
        this.on(document, 'navigate', this.openLocation);
        this.on(document, 'listen', this.listenForHistory);
        this.trigger('listen');
      });
      
    }
  } 
);
