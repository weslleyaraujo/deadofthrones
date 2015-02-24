;(function (module) {
  'use strict';

  function Navigation () {
    this.prepare();
    this.bind();
  };

  Navigation.prototype.prepare = function () {
    this.elements = {};
    this.elements.$all = angular.element('html, body');
    this.elements.$scrollTo = angular.element('.scroll-to');
    this.elements.$infinite = angular.element('.infinite');
  };

  Navigation.prototype.bind = function () {
    this.elements.$scrollTo.on('click', this.onScrollToClick.bind(this));
    this.elements.$infinite.on('click', this.onInfiniteClick.bind(this));
  };

  Navigation.prototype.onScrollToClick = function (event) {
    var $target = angular.element(event.target).closest('a');
    this.scrollTo($target.attr('href'));
  };

  Navigation.prototype.scrollTo = function (selector) {
    try {
      this.elements.$all.animate({
        scrollTop: angular.element(selector).offset().top
      }, 400);
    } catch (e) {}

    event.preventDefault();
  };

  Navigation.prototype.onInfiniteClick = function (event) {
    var $target = angular.element(event.target).closest('.animated'),
        stop = $target.data('stop-animation');

    try {
      if (stop) {
        $target.removeClass(stop);
      }
    } catch (e) {}
  };

  Navigation.$inject = [];

  module.controller('dod.characters.controllers.Navigation', Navigation);

} (angular.module('dod.characters')));
