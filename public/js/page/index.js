'use strict';

define(
  [
    'component/menu',
    'component/image_index',
    'component/page_index',
    'component/page_detail',
    'component/new_page',
    'component/new_text_block',
    'js/data/pages',
    'js/data/images'
  ],
  
  function(mainMenu, imageIndex, pageIndex, pageDetail, newPage, newTextBlock, pages, images) {

    return initialize;

    function initialize() {
      // data
      pages.attachTo(document);
      images.attachTo(document);
      // router.attachTo(document);
      // UI
      mainMenu.attachTo('#mainMenu');
      imageIndex.attachTo('#container');
      pageIndex.attachTo('#container');
      pageDetail.attachTo('#container');
      newPage.attachTo('#container');
    }

  } 
);