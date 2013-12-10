'use strict';

define(
  [
    'flight/lib/component',
    'component/new_page',
    'hgn!templates/pages/page_index',
    'hgn!templates/pages/_form'
  ],
  
  function(defineComponent, newPage, template, formPartial) {

    return defineComponent(pageIndex);

    function pageIndex() {
      
      this.defaultAttrs({
        newPageBtn: '.v-jsNewPage',
        editPageBtn: '.v-jsEditPage',
        removePageBtn: '.v-jsRemovePage'
      });
        
      this.render = function(e, data){
        
        var markup = template(data);
        
        this.$node.html(markup);
        // newPage.attachTo('#new-page');
        // var selector = this.select('pageSelector');
        // this.on(selector, 'click', this.showPage);
      }
      
      this.new = function(e, data){
        e.preventDefault();
        this.trigger('uiShowNewPage');
      }
      
      this.edit = function(e, data){
        e.preventDefault();
        var id = $(e.target).data('id');

        this.trigger('getPage', { _id: id });
      }
      
      this.remove = function(e, data){
        e.preventDefault();
        var id = $(e.target).data('id');
        
        // This would be the correct place to render a check to delete pages. 
        this.trigger('deletePage', { _id: id });
      }
      
      this.removePageElement = function(e, data){
        var el = this.$node.find('#page-' + data.id);
        el.remove();
      }
      
      this.after('initialize', function () {
        this.on(document, 'uiRenderPages', this.render);
        this.on(document, 'uiRemovePage', this.removePageElement);
        
        this.on('click', { 'newPageBtn': this.new });
        this.on('click', { 'editPageBtn': this.edit });
        this.on('click', { 'removePageBtn': this.remove });
      });
    }
  } 
);
