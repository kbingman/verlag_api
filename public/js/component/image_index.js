'use strict';

define(
  [
    'flight/lib/component',
    'js/settings',
    'hgn!templates/images/image_index',
    'text!templates/pages/_thumbnail.mustache'
  ],
  
  function(defineComponent, settings, template, thumbnailPartial) {

    return defineComponent(imageIndex);

    function imageIndex() {
      
      this.defaultAttrs({
        assets: [],
      });
        
      this.render = function(e, data){

        var markup = template({
          images: data,
          settings: settings
        },{
          thumbnail: thumbnailPartial
        });
        
        this.$node.html(markup);
      }

      
      this.after('initialize', function () {
        this.on(document, 'uiRenderAssets', this.render);
      });
    }
  } 
);
