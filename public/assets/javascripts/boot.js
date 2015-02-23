;(function () {
  'use strict';

  angular.module('dod.characters', []);
  angular.module('dod.shared', []);
  angular.module('dod', [
    'dod.shared',
    'dod.characters'
  ]);

} ());
