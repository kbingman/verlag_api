'use strict';

define(
  [
    'flight/lib/component'
  ],
  
  function(defineComponent) {

    return defineComponent(mainMenu);

    function mainMenu() {
      
      this.defaultAttrs({
        pageIndexBtn: '.v-jsPageIndexBtn',
        assetIndexBtn: '.v-jsAssetIndexBtn'
      });
      
      // Pages Module
      this.pages = function(e){
        e.preventDefault();
        this.trigger('loadPages');
      }
      
      // Assets Module
      this.assets = function(e){
        e.preventDefault();
        this.trigger('dataFetchImages');
      }

      this.after('initialize', function () {
        this.on('click', { 
          'pageIndexBtn': this.pages,
          'assetIndexBtn': this.assets
        });
      });
    }
  } 
);
