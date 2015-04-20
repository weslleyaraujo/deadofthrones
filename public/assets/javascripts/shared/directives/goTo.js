;(function (module) {
  'use strict';

  function goTo () {
    return {
      restrict: 'A',
      link: function ($scope, element, attr) {
        element.on('click', function() {
          this.classList.add('clicked');
          angular.element('html, body').animate({
            scrollTop: angular.element(attr.container).offset().top
          }, 400);
        });
      },
    }
  }

  module.directive('goTo', goTo);

} (angular.module('dod.shared.directives')));
