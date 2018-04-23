(function(){
	
	var app=angular.module("myApp");
	
	  app.controller('examSubjectStudentCtrl',examSubjectStudentCtrl)
	  
		   
		examSubjectStudentCtrl.$inject=['shairedDataService','$stateParams','$scope','$http'];
	   function examSubjectStudentCtrl( shairedDataService, $stateParams,$scope, $http) {
		   
		   $scope.teacher=shairedDataService.teacher;
	   		$scope.permissions=shairedDataService.permissions; 
	   		$scope.institute=shairedDataService.institute;
	   		$scope.examId=$stateParams.id;
	   		$scope.subjectDivId=$stateParams.subjectId;
	   		$scope.StudentList=[];	
	   		
	   		
	   		$http(
					{
						url : "GetStudentListOfExamJSON/"
								+ $scope.subjectDivId
								+ "/"
								+ $scope.examId,
						contentType : 'application/json; charset=utf-8',
						dataType : 'json',
						method : "POST",
					})
					.then(function successCallback(response) {
								// if success   then generate student table

								console.log("response came");
								console.log(response);
								$scope.StudentList=response.data;
							
							},
							function errorCallback(response) {
								// failed
								console.log("error response came");
								console.log(response);
							});
	   		
	   		
	   		$http(
					{
						url : "resultStudentList",			
						contentType : 'application/json; charset=utf-8',
						dataType : 'json',
						method : "POST",
					})
					.then(function successCallback(response) {
								// if success   then generate student table

								console.log("response came 2********");
								console.log(response);
								
							
							},
							function errorCallback(response) {
								// failed
								console.log("error response came 2********");
								console.log(response);
							});

		

		   
	   };
}())