/*global require*/
'use strict';

require.config({
    shim: {
        underscore: {
            exports: '_'
        },
        backbone: {
            deps: [
                'underscore',
                'jquery'
            ],
            exports: 'Backbone'
        },
    },
    paths: {
        'jquery': '../components/jquery/jquery',
        'backbone': '../components/backbone-amd/backbone',
        'underscore': '../components/underscore-amd/underscore',
        
        // CoffeeScript Support
        'cs': '../components/coffee-script/requirejs-plugin',
        'coffee-script': '../components/coffee-script/coffee-script',
        
        // Hogan Templating Support
        'text': '../bower_components/text/text',
        'hgn': '../bower_components/requirejs-hogan-plugin/hgn',
        'hogan': '../bower_components/requirejs-hogan-plugin/hogan',
    }
});

require([
    'app', 'backbone'
], function (App) {
    App.init('app-container', { root: '/' });
});