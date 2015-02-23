;(function (module) {
  'use strict';

  function clearName () {
    return function (input) {
      return input ? input.replace(/\ *\(.*\)/g, '') : input;
    }
  }

  module.filter('clearName', clearName);

} (angular.module('dod.shared.filters')));
