;(function (module) {
  'use strict';

  function DownArrow () {
    return {
      restrict: 'E',
      templateUrl: '/partials/down-arrow.html',
      link: function ($scope, element, attr) {

        debugger
      }
    }
  }

  module.directive('downArrow', DownArrow);

} (angular.module('dod.shared.directives')));
