(function(){
	
	angular.module("myApp").directive("tsCreateExam",function(){
		return {		
			 templateUrl: '../app/teacher/Exam/addEdit/createExam/createExam.html',	
			 controller: function($scope, $http, $interval, $filter,ivhTreeviewMgr,shairedDataService){
				 
				//------------------------------Create Exam Function-----------------------------------------------------------------------	   		
					$scope.CreateExam = function() {
						$scope.ExamCreateSuccess = false;
						$scope.ExamCreateError = false;
						$scope.ExamUpdateSuccess = false;

						console.log("create exam");
						var exam = {};
						exam.examMode = $scope.selectedExamMode;
						exam.examType = $scope.selectedExamType;
						/* exam.institute=$scope.institute; */
						exam.discription = $scope.discription;
						exam.outOf = $scope.outOf;
						exam.passingMarks = $scope.passingMarks;
						exam.regular = $scope.selectedRegular.id;

						console.log(exam);

						var data = JSON.stringify(exam);

						$http(
								{
									url : "SaveExam/"+ $scope.institute.id,
									contentType : 'application/json; charset=utf-8',
									dataType : 'json',
									method : "POST",
									data : data
								})
								.then(
										function(response) {
											// if success       	
											console.log("succcess  var data=JSON.stringify($scope.selectedstudentList);");

											$scope.examList.push(response.data); //add created exam to exam list

											$scope.selectedExamMode = null;
											$scope.selectedExamType = null;
											/* exam.institute=$scope.institute; */
											$scope.discription = null;
											$scope.outOf = null;
											$scope.passingMarks = null;
											$scope.selectedRegular.id = null;

											$scope.ExamCreateSuccess = true;

										},
										function(data) { 
											console.log(" failed to save the exam");
											$scope.ExamCreateError = true;
										});

					};
				 
			 }
		 }
		 
		 
	})
}())