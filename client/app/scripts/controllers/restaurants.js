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

    	var markerIcon = {
    		path: "M39.844-66.655c0-7.162-1.747-13.845-5.24-20.053 c-3.495-6.207-8.259-11.173-14.293-14.898c-6.033-3.724-12.573-5.587-19.618-5.587c-7.103,0-13.657,1.819-19.663,5.458 c-6.005,3.637-10.755,8.531-14.248,14.681c-3.494,6.15-5.24,12.776-5.24,19.878c0,7.103,2.107,14.957,6.323,23.561 c4.215,6.582,9.022,13.425,14.421,20.526c5.398,7.103,9.744,12.561,13.036,16.371L0.26-1c0.577-0.52,1.357-1.271,2.339-2.253 c0.98-0.981,2.9-3.017,5.76-6.105c2.858-3.09,5.629-6.236,8.315-9.441c2.685-3.204,5.687-7.118,9.008-11.737 c3.32-4.619,6.222-9.094,8.705-13.426C38.024-51.988,39.844-59.553,39.844-66.655z M23.04-68.994c0,6.178-2.181,11.448-6.539,15.807 c-4.36,4.36-9.6,6.54-15.721,6.54c-6.179,0-11.448-2.18-15.807-6.54c-4.36-4.359-6.54-9.629-6.54-15.807 c0-6.179,2.18-11.434,6.54-15.765c4.359-4.331,9.628-6.496,15.807-6.496c6.179,0,11.433,2.18,15.765,6.54 C20.875-80.356,23.04-75.115,23.04-68.994z",
    		fillColor: '#5c0120',
    		fillOpacity: 1,
    		scale: 0.25
    	};

        var restaurantsByDistrict = {};

    	var restaurants = Restaurant.query(function() {
        	var pivot = restaurants.length / 2;
	        var map = $scope.restaurantMap;

            $scope.restaurantCount = restaurants.length;

        	$.each(restaurants, function(i, restaurant) {
        		restaurant.notfound = !restaurant.lunch;

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
					icon: markerIcon,
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
        	center: new google.maps.LatLng(48.199, 16.355),
			zoom: 15,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
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
