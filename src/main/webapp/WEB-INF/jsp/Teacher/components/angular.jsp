  	
  	<script>
  		var app = angular.module('myApp', []);
   		app.controller('teacherCtrl', function($scope, $http) {

   		
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}');  				
   			console.log("teacher is "+$scope.teacher);
   			console.log("teacher id is "+$scope.teacher["id"]+"permissions are "+ $scope.permissions);  
   			console.log($scope.permissions);
   		});   	
   		</script>