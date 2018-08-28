var app=angular.module("myApp");
		
 		  app.controller('viewProfileCtrl', ['$scope','shairedDataService', function($scope,shairedDataService) {
 			   
 			   	$scope.teacher=shairedDataService.teacher;
	    		$scope.permissions=shairedDataService.permissions; 
	    		$scope.institute=shairedDataService.institute;
 			}]);