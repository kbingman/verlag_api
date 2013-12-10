'use strict';

define(
  [
    'lodash',
    'flight/lib/component',
    'js/mixins/with_ajax',
  ],
  
  function(_, defineComponent, withAjax) {

    return defineComponent(pageData, withAjax);

    function pageData() {
      
      this.defaultAttrs({
        pages: [],
        url: '/api/pages'
      });
      
      // this.validate = function(callback){
      //   if(data.page.title !== ''){
      //     this.trigger('createPage', data);
      //   }
      // }
              
      this.add = function(e, data){
        this.pages.push(data);
        this.trigger('uiClearForm');
        this.trigger('uiRenderPages', { pages: this.pages });
      }
      
      this.find = function(id){
        return _.find(this.pages, function(page){
          return page._id === id;
        });
      }
      
      this.showPage = function(e, data){
        var page = this.find(data.id);
        this.trigger('uiRenderPage', { page: page });
      }
      
      this.updatePage = function(e, data){
        var page = this.find(data.id);
        this.pages = _.reject(this.pages, function(p){
          return p === page;
        });
        this.pages.push(page);
        alert('updated')
        this.trigger('uiRenderPages', { pages: this.pages });
        // this.trigger('removePage', { id: data.id });
      }
      
      this.remove = function(e, data){
        var page = this.find(data.id);
        this.pages = _.reject(this.pages, function(p){
          return p === page;
        });
        this.trigger('uiRemovePage', { id: data.id });
      }
      
      this.reset = function(e, data){
        this.pages = data;
        this.trigger('uiRenderPages', { pages: this.pages });
      }
      
      this.load = function(){
        this.ajax({ 
          xhr: {
            url: this.attr.url,
            type: 'GET'
          },
          events: {
            done: 'resetPages',
            // fail: { node: document, event: 'ajaxError' }
          }
        });
      }
      
      this.get = function(e, data){
        this.ajax({
          xhr: {
            url: this.attr.url + '/' + data._id,
            type: 'GET'
          },
          events: {
            done: 'uiRenderPage',
            fail: { node: document, event: 'ajaxError' }
          }
        });
      }
      
      this.create = function(e, data){
        this.ajax({
          xhr: {
            url: this.attr.url,
            type: 'POST',
            data: { page: data }
          },
          events: {
            done: 'addPage',
            fail: { node: document, event: 'ajaxError' }
          }
        });
      }
      
      this.update = function(e, data){
        // update 
        this.ajax({
          xhr: {
            url: this.attr.url + '/' + data._id,
            type: 'POST',
            data: { page: data, _method: 'PUT' }
          },
          events: {
            done: 'uiShowUpdatedPage'
            // fail: { node: document, event: 'ajaxError' }
          }
        });
      }
      
      // For some reason jQuery will not send an delete request
      // and it has to be faked out
      this.destroy = function(e, data){
        var url = '/api/pages/' + data._id;
        
        this.ajax({
          xhr: {
            url: url,
            type: 'POST',
            data: { '_method': 'delete' }
          },
          events: {
            done: 'removePage',
            fail: { node: document, event: 'ajaxError' }
          }
        });
      }
      
      this.after('initialize', function () {
        this.on(document, 'loadPages', this.load);
        this.on(document, 'addPage', this.add);
        this.on(document, 'resetPages', this.reset);
        this.on(document, 'showPage', this.showPage);
        this.on(document, 'getPage', this.get);
        this.on(document, 'updatePage', this.update);
        this.on(document, 'createPage', this.create);
        this.on(document, 'deletePage', this.destroy);
        this.on(document, 'removePage', this.remove);
        
        this.on(document, 'ajaxError', function(e, data){
          alert('error');
          console.log(data);
        });
        
        this.trigger('loadPages');
      });
    }
  } 
);
