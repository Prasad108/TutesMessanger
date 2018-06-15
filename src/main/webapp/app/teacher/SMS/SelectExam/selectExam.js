(function(){

angular.module("myApp").controller("selectExamCtrl",selectExamCtrl);
selectExamCtrl.$inject=['$scope','$http','$interval','$filter','ivhTreeviewMgr','shairedDataService'];


function selectExamCtrl($scope, $http, $interval, $filter,ivhTreeviewMgr,shairedDataService){
	
	console.log("*******selectExamCtrl*********");
	
	
	$scope.institute=shairedDataService.institute;
	$http({
		url : "GetExamsOFInstitute/"+ $scope.institute.id,
				method : "POST",
			}).then(function(response) {
						// if success       	
						console.log("WE got exams of this institute ");
						$scope.examList = response.data;
					},
					function(data) { // optional
						// failed
						console.log(" failed to get the exam of institute");
					});

	
	
	//------------------------------Get the Exam Modes -----------------------------------------------------------------------
	$http({
		url : "GetExamsMode/",
		method : "POST",
	})
			.then(
					function(response) {
						// if success       	
						console
								.log("WE got examsModes");
						$scope.examMode = response.data;

						/* for( i=$scope.examMode.length-1; i>=0; i--) {
						        console.log($scope.examMode[i].id + $scope.examMode[i].modeName);    	
							}       */
					},
					function(data) { // optional
						// failed

						console
								.log(" failed to get the examMode");
					});

	//------------------------------Get the Exam Types -----------------------------------------------------------------------
	$http({
		url : "GetExamsType/",
		method : "POST",
	}).then(function(response) {
						// if success       	
						console.log("WE got examType");
						$scope.examType = response.data;
					},
					function(data) { // optional
						console.log(" failed to get the examType");
			});
	
	$scope.ExamRegularArray = [{id : 0,discription : 'Regular'},{id : 1,discription : 'Repeat'}];
	
	};
}())

