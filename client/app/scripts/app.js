'use strict';

angular.module('viennaLunch', ['ngAnimate', 'ngResource', 'ngRoute'])

  .constant('version', 'v0.1.0')

  .config(function($locationProvider, $routeProvider) {

    $locationProvider.html5Mode(false);

    $routeProvider
      .when('/', {
        templateUrl: 'views/home.html'
      })
      .when('/restaurants', {
        templateUrl: 'views/restaurants.html',
        controller: 'RestaurantsCtrl'
      })
      .when('/contact', {
        templateUrl: 'views/contact.html'
      })
      .otherwise({
        redirectTo: '/'
      });

  })

  .factory('Restaurant', ['$resource', function($resource) {
      return $resource('/restaurants/index/:id.json', null, {
          'update': { method:'PUT' }
      });
  }]);
