'use strict';

angular.module('davkal.ViennaHackerLunch')

  .controller('MainCtrl', function($scope, $location, version) {

    $scope.$path = $location.path.bind($location);
    $scope.version = version;

  });
