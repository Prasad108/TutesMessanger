(function(){
	
	angular.module("myApp").directive("tsSubjectInfo",function(){
		return {		
			 templateUrl: '../app/teacher/Exam/addEdit/createExam/createExam.html',	
			 restrict : "E",
			 scope :{
				 subid:'<',
				 InstTreeStructureWithSubject :'<'
			 },
			 
			 controller: function(){
				 
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
					
					
					$scope.flag = 0;
					$scope.inst = {};
					$scope.branch = {};
					$scope.classes = {};
					$scope.div = {};
					$scope.subject = {};

					$scope.flag = 0;

					traverseTillsubDivId(
							$scope.InstTreeStructureWithSubject,
							$scope.SubjectDivCompIDList.id);

					if ($scope.flag > 0) {
						$scope.SubjectDivCompIDList.inst = $scope.inst;
						$scope.SubjectDivCompIDList.branch = $scope.branch;
						$scope.SubjectDivCompIDList.classes = $scope.classes;
						$scope.SubjectDivCompIDList.div = $scope.div;
						$scope.SubjectDivCompIDList.subject = $scope.subject;
					}
					console.log("subject details");
					console.log($scope.SubjectDivCompIDList);
					
					
				 
			 }
		 }
		 
		 
	})
}())