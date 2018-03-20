  	
  	<script>
  		var app = angular.module('myApp');
  		  		 		
   		app.controller('teacherCtrl', function($scope, $http,shairedDataService) {
   			
   			shairedDataService.teacher=JSON.parse('${teacherJSON}');
   			shairedDataService.permissions=JSON.parse('${permissions}');  	
   			shairedDataService.institute=JSON.parse('${institute}');
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}');  	
   			$scope.institute=JSON.parse('${institute}');
   			console.log("teacher is "+shairedDataService.teacher);
   			console.log("teacher id is "+shairedDataService.teacher["id"]+"permissions are "+ shairedDataService.permissions);  
   			console.log("institute is "+shairedDataService.institute);  
   		});
   				
   		</script>