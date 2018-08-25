	<script>
  		var app = angular.module('myApp');
   		app.controller('studentCtrl',["$scope","$http","shairedDataService", function($scope, $http,shairedDataService) {

   		
   			$scope.student=JSON.parse('${studentJSON}');
   			shairedDataService.student=$scope.student;
   			//$scope.permissions=JSON.parse('${permissions}');  				
   			console.log("student is "+$scope.student);
   			console.log("student id is "+$scope.student["id"]);  			   		  			 			  			
   		}]);   	
   	</script>