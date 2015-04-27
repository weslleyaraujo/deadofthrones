module.exports = function (grunt) {
  'use strict';

  var tasks = [
    'grunt-contrib-compass',
    'grunt-contrib-watch'
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
      tasks: ['compass:all']
    },
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

  grunt.registerTask('build', [
    'compass:all',
  ]);
};
