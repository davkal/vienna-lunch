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
    	var markers = [];

    	var vollkornV = {
    		path: "M-135.977-329.811c0.378,4.441,1.134,9.024,2.268,13.748 c5.48,0.945,9.968,2.174,13.464,3.686s6.945,4.583,10.347,9.213c3.401,4.63,7.181,11.197,11.338,19.701l16.158,34.299l29.196,65.764 l32.031,75.118l33.732,80.787l33.732,84.188c8.504,0,16.063-0.756,22.677-2.268l57.26-151.086l54.709-150.803 c6.992-19.275,13.891-34.771,20.693-46.488s16.156-19.087,28.062-22.111c1.322-4.156,2.174-8.268,2.551-12.33 c0.379-4.062,0.566-8.268,0.566-12.614c-8.504,0.944-18.283,1.513-29.338,1.7c-11.055,0.189-21.023,0.284-29.904,0.284 c-8.883,0-17.197-0.142-24.945-0.425s-15.875-0.804-24.379-1.56c0,3.213,0.189,7.087,0.567,11.622s1.134,8.977,2.268,13.322 c18.331,2.08,29.009,9.072,32.032,20.977c0.756,3.591,1.133,7.56,1.133,11.906c0,10.394-2.551,23.055-7.652,37.984 c-13.04,39.496-26.552,77.857-40.536,115.086L73.22-28.629L28.433-138.331l-48.756-114.236 c-5.858-13.228-9.732-23.811-11.622-31.748c-1.134-4.156-1.7-7.842-1.7-11.055c0.188-2.834,0.66-5.291,1.416-7.369 c1.701-4.536,5.387-7.701,11.056-9.496c5.669-1.796,13.134-3.072,22.394-3.828c1.891-8.881,2.835-17.196,2.835-24.944 c-22.11,1.323-45.544,1.984-70.3,1.984c-12.472,0-25.369-0.142-38.692-0.425c-13.323-0.283-23.858-0.804-31.606-1.56 C-136.543-337.983-136.354-334.251-135.977-329.811z",
    		fillColor: '#5c0120',
    		fillOpacity: 1,
    		scale: 0.05
    	};

        var restaurantsByDistrict = {};

    	var restaurants = Restaurant.query(function() {
        	var pivot = restaurants.length / 2;
	        var map = $scope.restaurantMap;



        	$.each(restaurants, function(i, restaurant) {

		        // group restaurants by district

		        var districtMatch = restaurant.address.match(/(\d{4})/);
		        if (districtMatch) {
		        	var district = districtMatch[0];
		        	if(!restaurantsByDistrict[district]) {
		        		restaurantsByDistrict[district] = [];
		        	}
		        	restaurantsByDistrict[district].push(restaurant);
		        }

		        // put restaurants on the map

        		var marker = new google.maps.Marker({
        			position: new google.maps.LatLng(restaurant.location[0],restaurant.location[1]),
					map: map,
					icon: vollkornV,
					opacity: restaurant.lunch ? 0.8 : 0.4,
					animation: google.maps.Animation.DROP,
					title: restaurant.name
				});

				var content = '<div class="restaurant-info">'
					+ '<h5>' + restaurant.name + '</h5>'
					+ '<div class="address">' + restaurant.address + '</div>'
					+ '<div class="menu">' + (restaurant.lunch || "(no lunch found)") + '</div>'
					+ '</div>';

				var infowindow = new google.maps.InfoWindow({
					content: content 
				});

				google.maps.event.addListener(marker, 'click', function() {
					infowindow.open(map,marker);
				});
				restaurant.index = i;
				markers.push(marker);
        	});

			$scope.leftDistricts = ['1010', '1020', '1030', '1040', '1050', '1060'].map(function(zip) {
				var restaurantsForDistrict = restaurantsByDistrict[zip];
				if (restaurantsForDistrict) {
					return {zip: zip, restaurants: restaurantsForDistrict};
				}
			}).filter(function(r){return r});

			$scope.rightDistricts = ['1070', '1080', '1090'].map(function(zip) {
				var restaurantsForDistrict = restaurantsByDistrict[zip];
				if (restaurantsForDistrict) {
					return {zip: zip, restaurants: restaurantsForDistrict};
				}
			}).filter(function(r){return r});
    	});

    	$scope.onMouseOver = function() {
    		var marker = markers[this.restaurant.index];
    		marker.setAnimation(google.maps.Animation.BOUNCE);
    	};
    		
    	$scope.onMouseOut = function() {
    		var marker = markers[this.restaurant.index];
    		marker.setAnimation(null);
    	};

        $scope.mapOptions = {
        	center: new google.maps.LatLng(48.1975, 16.352314),
			zoom: 15,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			disableDefaultUI: true,
			styles: [
			  {
			    featureType: "all",
			    stylers: [
			      { saturation: -80 }
			    ]
			  },{
			    featureType: "poi",
			    stylers: [
			      { visibility: "off" }
			    ]
			  }
			]
		};
    }]);
