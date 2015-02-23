;(function (module) {
  'use strict';

  function getCharacter (config, $http) {
    this.config = config;
    this.$http = $http;
  }

  getCharacter.prototype.get = function () {
    return this.$http.get(this.config.characterURL);
  };

  module.$inject = ['config', '$http'];
  module.service('dod.shared.services.getCharacter', getCharacter);

} (angular.module('dod.shared')));
