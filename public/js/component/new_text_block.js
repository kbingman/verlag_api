'use strict';

define(
  [
    'flight/lib/component',
    'js/mixins/with_page_renderer',
    'hgn!templates/pages/_text_block'
  ],
  
  function(defineComponent, withPageRenderer, template) {

    return defineComponent(pageIndex, withPageRenderer);

    function pageIndex() {
      
      this.defaultAttrs({

      });
        
      this.render = function(e, data){
        var markup = template({
          _id: this.generateUUID()
        });
        this.$node.append(markup);
      };
      
      this.generateUUID = function(){
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
            return v.toString(16);
        });
      };

      this.after('initialize', function () {
        this.on(document, 'uiRenderTextBlock', this.render);
      });
    }
  } 
);
