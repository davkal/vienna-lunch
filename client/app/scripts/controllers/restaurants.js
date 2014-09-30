'use strict';
 
/**
 * @ngdoc function
 * @name vienna-lunch.controller:RestaurantsCtrl
 * @description
 * # RestaurantsCtrl
 * Controller of the vienna-lunch
 **/
angular.module('viennaLunch')
    .controller('RestaurantsCtrl', ['$scope', 'Restaurant', function ($scope, Restaurant) {
        $scope.restaurants = Restaurant.query();
    }]);
