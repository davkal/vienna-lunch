'use strict';
 
/**
 * @ngdoc function
 * @name davkal.ViennaHackerLunch.controller:RestaurantsCtrl
 * @description
 * # RestaurantsCtrl
 * Controller of the davkal.ViennaHackerLunch
 **/
angular.module('davkal.ViennaHackerLunch')
    .controller('RestaurantsCtrl', ['$scope', 'Restaurant', function ($scope, Restaurant) {
        $scope.restaurants = Restaurant.query();
    }]);
