;(function (module) {
  'use strict';

  function Character ($scope) {
    this.$scope = $scope;
    console.log('fuck yeah');
  }

  Character.$inject = ['$scope'];

  module.controller('dod.characters.controllers.Character', Character);

} (angular.module('dod.characters')));
