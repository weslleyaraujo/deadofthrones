;(function (module) {
  'use strict';

  function Character ($scope, getCharacter) {
    this.$scope = $scope;
    this.getCharacter = getCharacter;
    this.isLoading(true);
    this.update();
  }

  Character.prototype.isLoading = function (value) {
    this.$scope.isLoading = value;
  };

  Character.prototype.update = function () {
    this.isLoading(true);
    setTimeout(function () {
      this.getCharacter.get().success(this.onSuccess.bind(this));
    }.bind(this), 300);
  };

  Character.prototype.onSuccess = function (data) {
    this.isLoading(false);
    this.$scope.character = data;

    if (data.image) {
      this.loadImage(data.image);
    }
  };

  Character.prototype.loadImage = function (src) {
    var image = document.createElement('img');
    image.src = '/characters/' + src;
    image.onload = this.onImageLoad.bind(this);
  };

  Character.prototype.onImageLoad = function () {
    console.log('image onload');
  };

  Character.$inject = ['$scope', 'dod.shared.services.getCharacter'];

  module.controller('dod.characters.controllers.Character', Character);

} (angular.module('dod.characters')));
