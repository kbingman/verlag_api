'use strict';

requirejs.config({
  baseUrl: '',
  paths: {
    'flight': '../components/flight',
    'lodash': '../components/lodash/lodash',
    'jquery': '../components/jquery/jquery',
    'component': '../js/component',
    'page': '../js/page',
    
    // Hogan Templating Support
    'text': '../components/text/text',
    'hgn': '../components/requirejs-hogan-plugin/hgn',
    'hogan': '../components/requirejs-hogan-plugin/hogan'
  }
});

require(
  [
    'flight/lib/compose',
    'flight/lib/registry',
    'flight/lib/advice',
    'flight/lib/logger',
    'flight/tools/debug/debug'
  ],

  function(compose, registry, advice, withLogging, debug) {
    debug.enable(false);
    // DEBUG.events.logAll();
    
    compose.mixin(registry, [advice.withAdvice, withLogging]);

    require(['page/index'], function(initializeDefault) {
      initializeDefault();
    });
  }
);
