module.exports = function (grunt) {
  'use strict';

  var tasks = [
    'grunt-contrib-compass',
    'grunt-contrib-watch'
  ],

  config = {};

  // Compass
  config.compass = {
    dev: {
      options: {
        sassDir: 'assets/sass',
        cssDir: 'assets/css',
        imagesDir: 'assets/images',
        outputStyle: 'nested',
        environment: 'development',
        force: true
      }
    },
    dist: {
      options: {
        sassDir: 'assets/sass',
        cssDir: 'assets/css',
        imagesDir: 'dist/assets/images',
        outputStyle: 'compressed',
        noLineComments: true,
        environment: 'production'
      }
    }
  };


  // watch
  config.watch = {
    sass: {
      files: [
        'assets/sass/*.sass',
        'assets/sass/**/*.sass'
      ],
      tasks: ['compass:dev']
    },
  };

  // Config
  grunt.initConfig(config);

  // Load tasks
  tasks.forEach(grunt.loadNpmTasks);

  // Create tasks
  grunt.registerTask('develop', [
    'compass:dev',
    'watch'
  ]);
};
