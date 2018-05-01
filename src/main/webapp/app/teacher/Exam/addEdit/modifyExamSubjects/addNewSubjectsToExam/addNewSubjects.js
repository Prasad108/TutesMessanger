(function(){
	
	angular.module("myApp").directive("tsAddNewSubjectToExams",function(){
		return {
		
		 templateUrl: '../app/teacher/Exam/addEdit/modifyExamSubjects/addNewSubjectsToExam/addNewSubjects.html',	
		 
		 restrict : "E",
		 controller: function($scope, $http, $interval, $filter,ivhTreeviewMgr,shairedDataService){
			 
			
			 
			 $scope.HideMessages=function(){
				$scope.AddSubjectMessages=false;
				$scope.SubjectAddedSuccess=false;
				$scope.SubjectAddedfailed=false;
				 
			 }
			 
			 $scope.HideMessages();
			 
			 $scope.ShowSubAddSuccessMessages=function(){
					$scope.AddSubjectMessages=true;
					$scope.SubjectAddedSuccess=true;
					$scope.SubjectAddedfailed=false;
					$scope.ShowAddSubjectTable=false;
					 
				 }
			 $scope.ShowSubAddFailureMessages=function(){
					$scope.AddSubjectMessages=true;
					$scope.SubjectAddedSuccess=false;
					$scope.SubjectAddedfailed=true;
					$scope.ShowAddSubjectTable=false;
					 
				 }
			 
			 
			 
			 
			 
$scope.GetTreeStructSubjectsNotInExam = function(InstId,ExamId){
				 
				 $http(
							{
								url : "TreeStructureSujectsNotInExam/"+InstId+"/"+ExamId,
								contentType : 'application/json; charset=utf-8',
								dataType : 'json',
								method : "POST",
							})
							.then(
									function(response) {
										// if success       	
										console.log("succcess");
										
										$scope.InstTreeStructureWithSubjectNotInExam=response.data;
									},
									function(data) { // optional
										// failed		                 
										console.log(" failed to get TreeStructureSujectsNotInExam");
									});
				 
				 
			 }
			 
			 
			 
			 
			 
			 		$scope.AddSubjectToExam = function() {

					$scope.ExamSubjectList = [];
					console.log($scope.selectedSubject);

					for (var i = 0; i < $scope.selectedSubject.length; i++) {
						var ExamSubject = {};
						ExamSubject.exam = {};
						ExamSubject.subjectDivComposit = {};

						ExamSubject.exam.id = $scope.selectedExamForAddSubject.id;
						ExamSubject.subjectDivComposit.id = $scope.selectedSubject[i].value;
						ExamSubject.dateTime = new Date($scope.selectedSubject[i].ExamDate);
						ExamSubject.durationInMinutes = $scope.selectedSubject[i].DurationInMinutes;
						ExamSubject.outOfMarks = $scope.selectedSubject[i].OutOF;
						ExamSubject.passingMarks = $scope.selectedSubject[i].PassingMarks;
						$scope.ExamSubjectList.push(ExamSubject);

					}

					console.log($scope.ExamSubjectList);

					var data = JSON.stringify($scope.ExamSubjectList);

					$http(
							{
								url : "AddSubjectToExam",
								contentType : 'application/json; charset=utf-8',
								dataType : 'json',
								method : "POST",
								data : data
							})
							.then(
									function(response) {
										// if success       	
										console.log("succcess");
										var resp = response.data;

										if (resp.message = "success") {// subjecte added to exam 
											$scope.ShowSubAddSuccessMessages();										
											$scope.GetTreeStructSubjectsNotInExam($scope.institute.id,$scope.selectedExamForAddSubject.id);

										} else {// failed to add subject to exam
											$scope.ShowSubAddFailureMessages();
										}
									},
									function(data) { // optional
										// failed		                 
										console.log(" failed to AddSubjectToExam the exam");
									});
				};

				//-------------------------------to check wheather all subjects have passing marks less than OutOf marks-------------				 
				$scope.ValidateOutOFandPassing = function() {

					var result = true;
					for (var i = 0; i < $scope.selectedSubject.length; i++) {

						if ($scope.selectedSubject[i].OutOF < $scope.selectedSubject[i].PassingMarks) {
							result = false;
							break;
						}
					}
					return result;
				};
				
				
				
				$scope.KeepSameExamDateFucntion = function() {

					if ($scope.selectedSubject[0].KeepSameExamDate == true) {
						var examDate;

						for (var i = 0; i < $scope.selectedSubject.length; i++) {
							if (i == 0) {
								examDate = $scope.selectedSubject[i].ExamDate;
							} else {
								$scope.selectedSubject[i].ExamDate = examDate;
							}

						}
					}
				}

				$scope.KeepSameDurationInMinutesFunction = function() {
					if ($scope.selectedSubject[0].KeepSameDurationInMinutes == true) {
						var DurationInMinutes;

						for (var i = 0; i < $scope.selectedSubject.length; i++) {
							if (i == 0) {
								DurationInMinutes = $scope.selectedSubject[i].DurationInMinutes;
							} else {
								$scope.selectedSubject[i].DurationInMinutes = DurationInMinutes;
							}

						}
					}
				}

				$scope.KeepSamePassingMarksFunction = function() {
					if ($scope.selectedSubject[0].KeepSamePassingMarks == true) {
						var PassingMarks;

						for (var i = 0; i < $scope.selectedSubject.length; i++) {
							if (i == 0) {
								PassingMarks = $scope.selectedSubject[i].PassingMarks;
							} else {
								$scope.selectedSubject[i].PassingMarks = PassingMarks;
							}

						}
					}
				}

				$scope.KeepSameOutOFFunction = function() {
					if ($scope.selectedSubject[0].KeepSameOutOF == true) {
						var OutOF;

						for (var i = 0; i < $scope.selectedSubject.length; i++) {
							if (i == 0) {
								OutOF = $scope.selectedSubject[i].OutOF;
							} else {
								$scope.selectedSubject[i].OutOF = OutOF;
							}

						}
					}
				}
			 
			 },
		 }
		 
		 
	})
}())