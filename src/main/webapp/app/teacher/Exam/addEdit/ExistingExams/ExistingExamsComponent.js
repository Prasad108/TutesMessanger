(function(){
	
	angular.module("myApp").directive("tsExistingExams",function(){
		return {
		
		 templateUrl: '../app/teacher/Exam/addEdit/ExistingExams/ExistingExams.html',	
		 controller: function($scope, $http, $interval, $filter,ivhTreeviewMgr,shairedDataService){
			 
				 		
			
			 	
			 	//------------------------------Delete Exam Function-----------------------------------------------------------------------	   		
				$scope.DeleteExam = function(exam) {

					$scope.ExamDeleteSuccess = false;
					$scope.ExamDeleteError = false;
					$scope.ExamUpdateSuccess = false;
					$scope.ExamCreateSuccess = false;
					$scope.ExamCreateError = false;

					console.log("delete exam function");

					$http(
							{
								url : "DeleteExam/"
										+ exam.id,
								contentType : 'application/json; charset=utf-8',
								dataType : 'json',
								method : "POST"

							})
							.then(
									function(response) {     	
										console.log("succcess ");
										if (response.data.message == "success") {
											console
													.log("delettion successfull"); // delete exam from exam list
											for (i = $scope.examList.length - 1; i >= 0; i--) {
												if ($scope.examList[i].id == exam.id) {
													$scope.examList
															.splice(
																	i,
																	1);
													$scope.ExamDeleteSuccess = true;
												}
											}

										} else {
											console.log("delettion failed");
											$scope.ExamDeleteError = true;
										}

									},
									function(data) { 
										console.log(" failed to delete the exam");
									});

				};
				//------------------------------Load Selected Exam containts in Modal Form-----------------------------------------------------------------------	   		
				$scope.LoadEditExam = function(exam) {
					console.log("loading form data"
							+ exam.id);
					$scope.ExamUpdateSuccess = false;
					$scope.ExamCreateSuccess = false;
					$scope.ExamCreateError = false;

					$scope.selectedExamModeEditExam = $scope.examMode[exam.examMode.id - 1];
					$scope.selectedExamTypeEditExam = $scope.examType[exam.examType.id - 1];
					$scope.discriptionEditExam = exam.discription;
					$scope.outOfEditExam = exam.outOf;
					$scope.passingMarksEditExam = exam.passingMarks;
					$scope.selectedRegularEditExam = $scope.ExamRegularArray[exam.regular];
					$scope.EditExamid = exam.id;

					/* console.log($scope.selectedExamModeEditExam);
					console.log($scope.selectedExamTypeEditExam); */
					console.log($scope.EditExamid);
					console.log($scope.discriptionEditExam);
					console.log($scope.outOfEditExam);
					console.log($scope.passingMarksEditExam);
					/* 	console.log($scope.selectedRegularEditExam); */

				};

				//------------------------------Update Exam get values from modal-----------------------------------------------------------------------	   		
				$scope.UpdateExam = function() {
					$scope.ExamUpdateSuccess = false;
					$scope.ExamCreateSuccess = false;
					$scope.ExamCreateError = false;

					console.log("Update Exam");
					var UpdateExam = {};
					UpdateExam.id = $scope.EditExamid;
					UpdateExam.examMode = $scope.selectedExamModeEditExam;
					UpdateExam.examType = $scope.selectedExamTypeEditExam;
					/* exam.institute=$scope.institute; */
					UpdateExam.discription = $scope.discriptionEditExam;
					UpdateExam.outOf = $scope.outOfEditExam;
					UpdateExam.passingMarks = $scope.passingMarksEditExam;
					UpdateExam.regular = $scope.selectedRegularEditExam.id;

					console.log(UpdateExam);

					var data = JSON.stringify(UpdateExam);

					$http(
							{
								url : "UpdateExam/"
										+ $scope.institute.id,
								contentType : 'application/json; charset=utf-8',
								dataType : 'json',
								method : "POST",
								data : data
							})
							.then(
									function(response) {
										// if success       	
										console
												.log("succcess");
										console
												.log(response.data);

										for (i = $scope.examList.length - 1; i >= 0; i--) {
											if ($scope.examList[i].id == UpdateExam.id)
												$scope.examList.splice(i,1);// remove the updating exam 				  		   	   
										}
										$scope.examList.push(response.data);// add new modfied exam
										$scope.ExamUpdateSuccess = true;

									},
									function(data) { 	                 
										console.log(" failed to save the exam");
									});

				};
			 
			 
		 },
		 }
		 
		 
	})
}())