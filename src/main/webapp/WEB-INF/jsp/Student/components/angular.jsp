	<script>
  		var app = angular.module('myApp', []);
   		app.controller('studentCtrl', function($scope, $http) {

   		
   			$scope.student=JSON.parse('${studentJSON}');
   			//$scope.permissions=JSON.parse('${permissions}');  				
   			console.log("student is "+$scope.student);
   			console.log("student id is "+$scope.student["id"]);  			   		  			 			  			
   		});   	
   	</script>