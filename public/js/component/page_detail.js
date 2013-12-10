'use strict';

define(
  [
    'flight/lib/component',
    'component/new_text_block',
    'js/mixins/with_serializer',
    'js/mixins/with_page_renderer',
    'hgn!templates/pages/show_page',
    'hgn!templates/pages/_thumbnail'
  ],
  
  function(defineComponent, textBlockUI, withSerializer, withPageRenderer, template) {

    return defineComponent(pageIndex, withSerializer, withPageRenderer);

    function pageIndex() {
      
      this.defaultAttrs({
        contenteditable: '.v-contenteditable',
        cancelEditBtn: '.v-jsCancelEditBtn',
        newTextBlockBtn: '.v-jsNewTextBlockBtn',
        newImageBlockBtn: '.v-jsNewImageBlockBtn',
        uploadImageBtn: '.v-jsUploadImageBtn',
        page: {}
      });

      this.template = template;
        
      this.render = function(e, data){
        this.attr.page = data;
        window.page = data;
        this.renderPage(this.attr.page);
      }
      
      this.update = function(e, data){
        e.preventDefault();
        this.trigger('updatePage', this.serializePage());
      }
      
      this.showUpdate = function(e, data){
        this.attr.page = data;
        console.log('show update here')
      }
      
      this.upload = function(e, data){
        e.preventDefault();

        console.log($(e.target).data('id'));
        
        var files = data.el.files;
        
        for (var i = 0; i < files.length; i++){
          this.trigger('dataUploadImage', { 
            file: files[i], 
            pageId: this.attr.page._id,
            blockId: $(e.target).data('id')
          });
        }

      }
      
      this.after('initialize', function () {        
        this.on(document, 'uiRenderPage', this.render);
        this.on(document, 'uiAddImage', this.addImage);
        this.on(document, 'uiAddTextBlock', this.addTextBlock);
        this.on(document, 'uiShowUpdatedPage', this.showUpdate);

        this.on('click', { 
          'cancelEditBtn': this.showIndex,
          'newTextBlockBtn': function(e){ 
            e.preventDefault(); 
            this.trigger('uiAddTextBlock');
          },
          'newImageBlockBtn': function(e){ 
            e.preventDefault(); 
            this.trigger('uiAddTextBlock');
          }
        });
        this.on('change', {
          'uploadImageBtn': this.upload
        });
        // this.on('submit', { 
        //   'editPageForm': this.update
        // });
        this.on('keyup', { 
          'contenteditable': this.delay
        });
      });

    }
  } 
);
