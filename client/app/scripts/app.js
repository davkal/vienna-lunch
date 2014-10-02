'use strict';

angular.module('viennaLunch', ['ngAnimate', 'ngResource', 'ngRoute'])

  .constant('version', 'v0.1.0')

  .config(function($locationProvider, $routeProvider) {

    $locationProvider.html5Mode(false);

    $routeProvider
      .when('/restaurants', {
        templateUrl: 'views/restaurants.html',
        controller: 'RestaurantsCtrl'
      })
      .otherwise({
        redirectTo: '/restaurants'
      });

  })

  .factory('Restaurant', ['$resource', function($resource) {
      return $resource('/api/restaurants', null);
  }]);
