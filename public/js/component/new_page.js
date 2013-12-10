'use strict';

define(
  [
    'flight/lib/component',
    'component/new_text_block',
    'js/mixins/with_serializer',
    'js/mixins/with_page_renderer',
    'hgn!templates/pages/new_page'
  ],
  
  function(defineComponent, textBlockUI, withSerializer, withPageRenderer, template) {

    return defineComponent(newPage, withSerializer, withPageRenderer);

    function newPage() {
      
      this.defaultAttrs({
        newPageForm: '.v-jsNewPageForm',
        page: {
          blocks: []
        }
      });
      
      this.template = template;
      
      this.render = function(e, data){
        this.renderPage(this.attr.page);
      }
      
      this.clear = function(){
        this.$node.find('input[name="title"]').val('');
        this.$node.find('textarea[name="body"]').val('');
      }
      
      this.create = function(e, data){
        e.preventDefault();
        this.trigger('createPage', this.serializePage());
      }
      
      // Mixin?
      this.showIndex = function(e, data){
        e.preventDefault();
        this.trigger('loadPages');
      }
      
      this.after('initialize', function () {
        this.on(document, 'uiShowNewPage', this.render);
        this.on(document, 'uiClearForm', this.clear);
        
        this.on('click', { 'cancelEditBtn': this.showIndex });
        this.on('submit', { 'newPageForm': this.create });
      });
      
      this.after('render', function(){
        textBlockUI.attachTo('#textBlocks');
      });
    }
  } 
);