;(function (module) {
  'use strict';

  function characterImage () {
    return {
      restrict: 'A',
      link: function ($scope, element, attr) {
        $scope.$watch('isLoading', function () {
          element.css('backgroundImage', '');
        });

        attr.$observe('characterImage', function (src) {
          var image = '/characters/' + src;
          if (src) {
            characterImage.create(image).onload(function () {
              element.find('.character-image-loader').addClass('fadeOut');
                setTimeout(function () {
                  element.css('backgroundImage', 'url(' + image + ')');
                }, 350);
            });
          }
        }.bind(this));
      }
    }
  }

  characterImage.create = function (src) {
    var element = document.createElement('img');
    element.src = src;
    return {
      onload: function (fn) {
        element.onload = fn;
      }
    }
  };

  module.directive('characterImage', characterImage);

} (angular.module('dod.shared.directives')));
