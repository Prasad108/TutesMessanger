(function(){
	
	angular.module("myApp").controller("editUsernamePassword",function($http,$scope,shairedDataService){		

   		
   		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		console.log("***********editUsernamePassword*****************");
				});
	
	
}())