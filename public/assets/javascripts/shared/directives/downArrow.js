;(function (module) {
  'use strict';

  function Directive () {
    return {
      restrict: 'E',
      templateUrl: '/partials/down-arrow.html',
      scope: true,
      link: function ($scope, element, attr) {
        var dom = {},
            selector = element.find('a').attr('href');

        dom.$all = angular.element('html, body');
        element.find('a').on('click', function (event) {
          dom.$all.animate({
            scrollTop: angular.element(selector).offset().top
          }, 400);

          event.preventDefault();
        });
      },
    }
  }

  module.directive('downArrow', Directive);

} (angular.module('dod.shared.directives')));
