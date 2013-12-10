'use strict';

define(
  [
    'lodash',
    'flight/lib/component',
    'js/mixins/with_ajax',
  ],
  
  function(_, defineComponent, withAjax) {

    return defineComponent(imageData, withAjax);

    function imageData() {   
      
      this.defaultAttrs({
        assets: [],
        url: '/api/images'
      });
         
      this.upload = function(e, data){
        var formData = new FormData();
        
        console.log('e', e);
        console.log('data', data);
        console.log(data.file);
        
        formData.append('image[file]', data.file);
        formData.append('image[page_id]', data.pageId);
        formData.append('image[block_id]', data.blockId);
        
        this.ajax({
          xhr: {
            url: this.attr.url,
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false
          },
          events: {
            done: 'uiAddImage',
            fail: { node: document, event: 'ajaxError' }
          }
        });
      }
      
      this.fetch = function(){
        this.ajax({ 
          xhr: {
            url: this.attr.url,
            type: 'GET'
          },
          events: {
            done: 'uiRenderAssets',
            // fail: { node: document, event: 'ajaxError' }
          }
        });
      }
      
      this.after('initialize', function () {        
        this.on(document, 'dataUploadImage', this.upload);
        this.on(document, 'dataFetchImages', this.fetch);
      });
    }
  } 
);