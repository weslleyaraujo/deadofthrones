;(function () {
  'use strict';

  angular.module('dod.characters', []);
  angular.module('dod.shared', []);
  angular.module('dod.shared.filters', []);
  angular.module('dod.shared.directives', []);
  angular.module('dod', [
    'dod.shared',
    'dod.shared.filters',
    'dod.shared.directives',
    'dod.characters'
  ]);

} ());
