(function(){
	
	var app=angular.module("myApp");
	
	  app.controller('examSubjectCtrl', ['$scope', '$http','shairedDataService',' $stateParam', function($scope, $http,shairedDataService, $stateParam) {
		   
		$scope.teacher=shairedDataService.teacher;
  		$scope.permissions=shairedDataService.permissions; 
  		$scope.institute=shairedDataService.institute;
  		//console.log("state param is "+$stateParam.examID);
		}]);
	
	
}())