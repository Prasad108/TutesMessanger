  		var app = angular.module('myApp', []);
   		app.controller('teacherCtrl', function($scope, $http) {

   		var abc='<%=session.getAttribute("teacherJSON")%>';
   		consol.log(abc);
   			$scope.teacher=JSON.parse('<%=session.getAttribute("teacherJSON")%>');
   			$scope.permissions=JSON.parse('<%=session.getAttribute("permissions")%>'); 			
   			console.log("teacher is "+$scope.teacher);
   			console.log("teacher id is "+$scope.teacher["id"]);  			   		  			 			  			
   		});   	