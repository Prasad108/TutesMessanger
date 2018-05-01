(function(){
	
	angular.module('myApp').controller(
				'ExamController',["$scope","$http", "$interval", "$filter","ivhTreeviewMgr","shairedDataService",function($scope, $http, $interval, $filter,ivhTreeviewMgr,shairedDataService) {
				
					$scope.teacher=shairedDataService.teacher;
		    		$scope.permissions=shairedDataService.permissions; 
		    		$scope.institute=shairedDataService.institute;

					$scope.ExamCreateSuccess = false;
					$scope.ExamCreateError = false;
					$scope.ExamDeleteSuccess = false;
					$scope.ExamDeleteError = false;
					$scope.ExamUpdateSuccess = false;

					$scope.EditExamid = null;

					$scope.ShowTreeStruct = false;
					$scope.ShowSubjectListVar = false;
					$scope.ShowAddSubjectTable = false;
					$scope.ShowSelectedSubjectTable = false;
					$scope.noneSelected = false;
					// $scope.ShowSelectAll=true;

					$scope.ExamRegularArray = [ {
						id : 0,
						discription : 'Regular'
					}, {
						id : 1,
						discription : 'Repeat'
					} ];

					$scope.studentNotInExamList = [];
					$scope.studentInExamList = [];
							$scope.filteredTodos = [],
							$scope.filteredTodos1 = [],
							$scope.currentPage = 1,
							$scope.numPerPage = 10,
							$scope.maxSize = 3,

							$scope.totallenght = $scope.studentNotInExamList.length / $scope.numPerPage * 10;

					$scope.examList = [];
					$scope.examMode = [];
					$scope.examType = [];
					$scope.selectedSubject = [];
					$scope.selectedstudentList = [];
					//this.inst=[{"label":"Vidya", "value":50,"type":"Institute","children": [{"label":"Pune", "value":15,"type":"Branch","children":[{"label":"10th ", "value":18,"type":"Class","children":[{"label":"A", "value":19,"type":"Division"},{"label":"B", "value":20,"type":"Division"},{"label":"C", "value":21,"type":"Division"}]},{"label":"11th", "value":19,"type":"Class","children":[{"label":"PCM", "value":22,"type":"Division","children":[{"label":"English", "value":1,"type":"Subject","SubjectId":1},{"label":"Marathi", "value":2,"type":"Subject","SubjectId":2}]},{"label":"PCB", "value":23,"type":"Division","children":[{"label":"English", "value":3,"type":"Subject","SubjectId":1}]}]}]},{"label":"Mumbai", "value":16,"type":"Branch"}]}];

					//------------------------------Get the Exam List for Institute -----------------------------------------------------	 
					$http({
						url : "GetExamsOFInstitute/"+ $scope.institute.id,
						method : "POST",
					})
					.then(
							function(response) {
								console.log("WE got exams of this institute ");
								$scope.examList = response.data;
							},
							function(data) { 
								console.log(" failed to get the exam of institute");
							});
		
					
					
					this.awesomeCallback = function(node, tree) {
						// Do something with node or tree
						console.log("#");
					};
					
					
					
					//------------------------------Tree Traverlsal and Add the selected Items in respective array ----------------------------------------------------- 		   				
					$scope.TreeTraversalForSelectedItems = function(o) {
						for ( var i in o) {

							if (o[i] !== null
									&& typeof (o[i]) == "object") {

								if (o[i].type == "Institute"
										&& o[i].selected == true) {
									//console.log("Selected Institute is "+o[i].label);
									$scope.selectedInstitute.push(o[i]);
								}

								if (o[i].type == "Branch"
										&& o[i].selected == true) {
									//console.log("Selected Branch is "+o[i].label);
									$scope.selectedBranch.push(o[i]);
								}

								if (o[i].type == "Class"
										&& o[i].selected == true) {
									//console.log("Selected Class is "+o[i].label);
									$scope.selectedClass.push(o[i]);
								}

								if (o[i].type == "Division"
										&& o[i].selected == true) {
									//console.log("Selected Division is "+o[i].label);
									$scope.selectedDivision.push(o[i]);
								}

								if (o[i].type == "Subject"
										&& o[i].selected == true) {
									//console.log("Selected subject is "+o[i].label);
									$scope.selectedSubject.push(o[i]);
								}
								//going one step down in the object tree!!
								$scope.TreeTraversalForSelectedItems(o[i]);
							}
						}
					}
					
					
					
					
					//------------------------------Callback Function on select of any tree node -----------------------------------------------------
					$scope.OnSelectCallback = function(node,
							isSelected, tree) {

						// initially make all the arrays empty
						$scope.selectedInstitute = [];
						$scope.selectedBranch = [];
						$scope.selectedClass = [];
						$scope.selectedDivision = [];
						$scope.selectedSubject = [];

						$scope.SubjectDivCompIDList = [];

						// call tree traversal function to get the selected itmes in arrays
						$scope.TreeTraversalForSelectedItems(tree);

						console.log("Total Institute Selected are  "+ $scope.selectedInstitute.length);
						console.log("Total Branch Selected are  "+ $scope.selectedBranch.length);
						console.log("Total Class Selected are  "+ $scope.selectedClass.length);
						console.log("Total Division Selected are  "+ $scope.selectedDivision.length);
						console.log("Total Subjects Selected are  "+ $scope.selectedSubject.length);
						console.log($scope.selectedSubject);
						console.log("*************************************************************************");

					}

					 	   				
					

					//------------------------------Get the Exam Modes -----------------------------------------------------------------------
					$http({
						url : "GetExamsMode/",
						method : "POST",
					})
							.then(
									function(response) {
									
										console.log("WE got examsModes");
										$scope.examMode = response.data;
									},
									function(data) { 
										console.log(" failed to get the examMode");
									});

					//------------------------------Get the Exam Types -----------------------------------------------------------------------
					$http({
						url : "GetExamsType/",
						method : "POST",
					})
							.then(
									function(response) {
										// if success       	
										console.log("WE got examType");
										$scope.examType = response.data;
									},
									function(data) { // optional
										// failed

										console.log(" failed to get the examType");
									});

					//------------------------------Get Subject Tree Struct -----------------------------------------------------------------------	         
					console.log($scope.institute.id);

					$http(
							{
								url : "GetSubjectTreeStruct/"
										+ $scope.institute.id,
								method : "POST",
							})
							.then(
									function(response) {
										// if success       	
										console.log("WE got SubjectTreeStruct");
										console.log(response.data);
										$scope.InstTreeStructureWithSubject = response.data;
									},
									function(data) { // optional
										// failed

										console.log(" failed to get the SubjectTreeStruct");
									});

					
					

					
				}]);
	
	
	

	
}())
		 