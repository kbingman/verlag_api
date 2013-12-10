define(
  [
    'js/settings',
    'text!templates/pages/_form.mustache',
    'text!templates/pages/_text_block.mustache',
    'text!templates/pages/_image_block.mustache',
    'text!templates/pages/_thumbnail.mustache'
  ],
  
  function(settings, formPartial, textBlockPartial, imageBlockPartial, thumbnailPartial) {
    
    return function() {
      
      // Converts a JSON object into a page form
      this.renderPage = function(page){
        
        var attributes = _.clone(page);
        
        // Builds variable to show which partial to render
        attributes.blocks = page.blocks.map(function(block){
          switch(block.class_name){
            case 'ImageBlock':
              block.isImage = true;
              break;
            case 'Block':
              block.isText = true;
              break;
            case 'TextBlock':
              block.isText = true;
              break;
          }
          return block;
        });
        
        var markup = this.template({
          page: attributes,
          i18n: function(key){
            return key;
          },
          settings: settings
        }, { 
          form: formPartial,
          textBlock: textBlockPartial,
          imageBlock: imageBlockPartial,
          thumbnail: thumbnailPartial
        });
        
        this.$node.html(markup);
        // this.$node.find('input[name="title"]').focus();
      }
      
      // Renders the page when an image is added
      this.addImage = function(e, data){
        console.log(data)
        // this.attr.page.images.push(data);
        // this.renderPage(this.attr.page);
      }
      
      this.addTextBlock = function(e, data){
        var id = this.generateUUID();
        this.attr.page.blocks.push({});
        this.trigger('updatePage', this.attr.page);
      }
      
      // Saves (or will) on keyup
      this.delay = function(e, data){
        var self = this;
        
        if (this.timeout){
          clearTimeout(this.timeout);
        }
        this.timeout = setTimeout(function(){
          var page = self.attr.page;
          var blocks = self.attr.page.blocks;
          var value = $(e.target).html();
          var block = blocks.filter(function(b){
            return b._id === $(e.target).data('id');
          })[0];
          
          block.body = value;
          page.blocks = blocks;
          
          self.trigger('updatePage', page);
        }, 700);
      }
      
      this.generateUUID = function(){
        // xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx
        return 'xxxxxxxxxxxxxxyxxxxxxxxx'.replace(/[xy]/g, function(c) {
            var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
            return v.toString(16);
        });
      };
      
    }
    
  } 
);