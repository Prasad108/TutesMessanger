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
  				
  		function traverseTillsubDivId(o, subDivId) {

			if ($scope.flag < 1) {
				for ( var i in o) {
					if ($scope.flag < 1) {
						if (o[i] !== null
								&& typeof (o[i]) == "object") {
							if (o[i].type == "Institute") {
								$scope.inst.label = o[i].label;
								console.log($scope.inst.label);
							}

							if (o[i].type == "Branch") {
								$scope.branch.label = o[i].label;
								console.log($scope.branch.label);
							}

							if (o[i].type == "Class") {
								$scope.classes.label = o[i].label;
								console.log($scope.classes.label);
							}

							if (o[i].type == "Division") {
								$scope.div.label = o[i].label;
								$scope.div.value = o[i].value;
								console.log($scope.div.label);
								console.log($scope.div.value);
							}

							if (o[i].type == "Subject"
									&& o[i].value == subDivId) {
								$scope.subject.label = o[i].label;
								console.log($scope.subject.label);
								$scope.flag = 2;
								console.log("break **************************");
								break;
							}

							//going one step down in the object tree!!
							traverseTillsubDivId(o[i], subDivId);
						}
					}
				}
			}
		};
  		
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