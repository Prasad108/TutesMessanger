(function(){
	
	var app=angular.module("myApp");
	
	  app.controller('examSubjectCtrl',examSubjectCtrl)
	  
		   
		examSubjectCtrl.$inject=['shairedDataService','$stateParams','$scope','$http','InstTreeStructureWithSubject'];
	   function examSubjectCtrl( shairedDataService, $stateParams,$scope, $http,InstTreeStructureWithSubject) {	  
		$scope.teacher=shairedDataService.teacher;
   		$scope.permissions=shairedDataService.permissions; 
   		$scope.institute=shairedDataService.institute;
  		console.log("state param is "+$stateParams.id);
  		$scope.examId=$stateParams.id;
  		
  		$scope.SubjectDivCompIDList={};
  		$scope.InstTreeStructureWithSubject=InstTreeStructureWithSubject;
 		
  		$http(
				{
					url : "GetSubjectDivCompID/"
							+ $stateParams.id,
					method : "POST",
				})
				.then(
						function(response) { // if success       	
							console.log("WE got ids");

							$scope.SubjectDivCompIDList = response.data;
							console.log($scope.SubjectDivCompIDList);
							$scope.ShowSelectedSubjectTable = true;
							$scope.subjectNotInExam = false;

							for (var j = 0; j < $scope.SubjectDivCompIDList.length; j++) {
								$scope.flag = 0;
								$scope.inst = {};
								$scope.branch = {};
								$scope.classes = {};
								$scope.div = {};
								$scope.subject = {};

								$scope.flag = 0;

								traverseTillsubDivId(
										$scope.InstTreeStructureWithSubject,
										$scope.SubjectDivCompIDList[j].id);

								if ($scope.flag > 0) {
									$scope.SubjectDivCompIDList[j].inst = $scope.inst;
									$scope.SubjectDivCompIDList[j].branch = $scope.branch;
									$scope.SubjectDivCompIDList[j].classes = $scope.classes;
									$scope.SubjectDivCompIDList[j].div = $scope.div;
									$scope.SubjectDivCompIDList[j].subject = $scope.subject;
								}
								console.log("subject details");
								console.log($scope.SubjectDivCompIDList[j]);
							}
						},
						function(data) { // optional // if failed
							
							console.log(" failed to get the ids");
						});
  		
  		
  		
  		
  		
  		
  		
		};
	
	
}())