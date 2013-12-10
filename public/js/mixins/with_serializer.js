define(
  [],
  
  function() {

    return function() {

      // Converts a page form into a JSON object
      this.serializePage = function(){
        var textBlocks = this.attr.page.blocks;
        var $textnodes = $('.textBlock');
        
        // Page attributes first
        // --------------------------------
        this.attr.page.title = this.$node.find('input[name="title"]').val();
        // TextBlock attributes next
        // --------------------------------
        // This is a jQuery object, so we have to use $.each instead 
        // of .forEach
        $textnodes.each(function(i, el){
          var $el = $(el),
              id = $el.attr('id').replace(/text\-block\-/,''),
              textBlock;
          
          textBlock = textBlocks.filter(function(textBlock){
            return textBlock._id === id;
          })[0];

          if(!textBlock){
            textBlock = {} 
            textBlocks.push(textBlock);
          }
          
          textBlock.name = $el.find('input[name="name"]').val();
          textBlock.body = $el.find('textarea[name="body"]').val();
        });
        
        // this.attr.page.text_blocks = textBlocks;
        
        return this.attr.page;
      }

    }
    
  } 
);
