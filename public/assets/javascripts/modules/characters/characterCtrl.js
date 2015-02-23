;(function (module) {
  'use strict';

  function Character ($scope, getCharacter) {
    this.$scope = $scope;
    this.getCharacter = getCharacter;

    this.update();
  }

  Character.prototype.update = function () {
    this.getCharacter.get().success(this.onSuccess.bind(this));
  };

  Character.prototype.onSuccess = function (data) {
    this.$scope.character = data;
  };

  Character.$inject = ['$scope', 'dod.shared.services.getCharacter'];

  module.controller('dod.characters.controllers.Character', Character);

} (angular.module('dod.characters')));
