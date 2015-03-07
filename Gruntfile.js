module.exports = function (grunt) {
  'use strict';

  var tasks = [
    'grunt-contrib-compass',
    'grunt-contrib-watch',
    'grunt-contrib-cssmin'
  ],

  config = {};

  // Compass
  config.compass = {
    all: {
      options: {
        specify: [
          'public/assets/sass/main.sass'
        ],
        sassDir: 'public/assets/sass',
        cssDir: 'public/assets/css',
        imagesDir: 'public/assets/images',
        outputStyle: 'nested',
        environment: 'development',
        raw: 'http_generated_images_path = \'/assets/images\''
      }
    }
  };


  // watch
  config.watch = {
    sass: {
      files: [
        'public/assets/sass/*.sass',
        'public/assets/sass/**/*.sass'
      ],
      tasks: ['compass:dev']
    },
  };

  // css min
  config.cssmin = {
    options: {
      keepSpecialComments: 0
    },
    target: {
      files: {
        'public/assets/css/application.min.css': [

          'public/assets/css/main.css',

          // vendor
          'public/assets/bower_components/animate.css/animate.css',
          'public/assets/fonts/armantic/stylesheet.css',
          'public/assets/fonts/deadfontwalking/stylesheet.css'
         ]
      }
    }
  };

  // Config
  grunt.initConfig(config);

  // Load tasks
  tasks.forEach(grunt.loadNpmTasks);

  // Create tasks
  grunt.registerTask('develop', [
    'compass:all',
    'watch'
  ]);
};
