(function(){
	
	var app=angular.module("myApp");
	
	  app.controller('smsSubjectStudentCtrl',smsSubjectStudentCtrl)
	  
		   
		smsSubjectStudentCtrl.$inject=['shairedDataService','$stateParams','$scope','$http','$log'];
	    function smsSubjectStudentCtrl( shairedDataService, $stateParams,$scope, $http,$log) {
		   
		    $scope.teacher=shairedDataService.teacher;
	   		$scope.permissions=shairedDataService.permissions; 
	   		$scope.institute=shairedDataService.institute;
	   		$scope.examId=$stateParams.id;
	   		$scope.subjectDivId=$stateParams.subjectId;
	   		$scope.selectedStudentList=[];	
	   		$scope.ExamSubjectStudentResult=[];
	   		$scope.successMessage=false;
        	$scope.errorMessage=false;
	   		
	   		
	   		$http({
						url : "smsSubjectStudentResult",			
						contentType : 'application/json; charset=utf-8',
						dataType : 'json',
						method : "GET",
						 params: {examId: $scope.examId,subDivId:$scope.subjectDivId}
						
					})
					.then(function successCallback(response) {
								// if success   then generate student table

								console.log("response came 2********");
								console.log(response);
								$scope.ExamSubjectStudentResult=response.data;
								
							
							},
							function errorCallback(response) {
								// failed
								console.log("error response came 2********");
								console.log(response);
							});	
	   		
	 //-------------------- send SMS to selected Students and their Parents -------------------------------    		
	   		$scope.sendSMS=function(){
	   			
	   			for(var i=0; i< $scope.ExamSubjectStudentResult.length; i++){
	   				if($scope.ExamSubjectStudentResult[i].studentSelected){
	   					console.log($scope.ExamSubjectStudentResult[i].student.fname+" is selected");
	   					//$scope.selectedStudentList[i]=$scope.ExamSubjectStudentResult[i];
	   					if($scope.ExamSubjectStudentResult[i].parentSelected){
	   						console.log($scope.ExamSubjectStudentResult[i].student.fname+"'s parent also selected");
	   					}
	   				}
	   				else if($scope.ExamSubjectStudentResult[i].parentSelected){
	   					console.log($scope.ExamSubjectStudentResult[i].student.fname+"'s parent only selected");
	   					//$scope.selectedStudentList[i]=$scope.ExamSubjectStudentResult[i];
	   				}
	   			}
	   			
	   			var data=angular.toJson($scope.ExamSubjectStudentResult);
	   			
	   			$http({
					url : "sendSMSSubjectResult",			
					contentType : 'application/json; charset=utf-8',
					dataType : 'json',
					method : "POST",
					data :  data
					
				})
				.then(function successCallback(response) {
							// if success   
                           
                            if(response.data.status == "success"){
                            	 console.log("success response came ********");
                            	$scope.successMessage=true;
                            	$scope.errorMessage=false;
                            } else if(response.data.status == "fail"){
                            	 console.log("error response came ********");
                            	$scope.successMessage=false;
                            	$scope.errorMessage=true;
                            }
			
						},
						function errorCallback(response) {
							// failed
							console.log("error response came 2********");
							$scope.successMessage=false;
                        	$scope.errorMessage=true;
						});	
	   			
	   		};
	   		
	   };
}())