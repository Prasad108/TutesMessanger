(function(){
	
	angular.module("myApp").directive("tsModifyExamSubjects",function(){
		return {
		
		 templateUrl: '../app/teacher/Exam/addEdit/modifyExamSubjects/modifyExamSubjects.html',	
		 controller: function($scope, $http, $interval, $filter,ivhTreeviewMgr,shairedDataService){
			 	
			 $scope.DeleteSubjectsFromExam=false;
			 $scope.selectedSubjectForDelete=[];
			 
			 
			 
			 
			 
			 
			//------------------------------Tree Traverlsal and Add the selected Items in respective array ----------------------------------------------------- 		   				
				$scope.TreeTraversalForSelectedItems = function(
						o) {
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
				
				
				$scope.ExamChanged = function() {
					console.log("exam changed");

					ivhTreeviewMgr.deselectAll($scope.InstTreeStructureWithSubject);
					$scope.selectedSubject.splice(0,$scope.selectedSubject.length);
				}
				
				$scope.ShowTreeAddNewSubjects = function() {
					$scope.GetTreeStructSubjectsNotInExam($scope.institute.id,$scope.selectedExamForAddSubject.id);
					$scope.selectedSubject.splice(0,$scope.selectedSubject.length);
					$scope.HideMessages();
					$scope.deleteMessageHide();
					$scope.ShowTreeStructAddNewSubjetcs = true;
					$scope.ShowSubjectListVarAddNewSubjetcs = false;
					$scope.ShowAddSubjectTable = false;
				};
				
				$scope.BackToShowTreeAddNewSubjects=function(){
					$scope.ShowTreeStructAddNewSubjetcs = true;
					$scope.ShowSubjectListVarAddNewSubjetcs = false;
					$scope.ShowAddSubjectTable = false;
					
				}
				
				
				$scope.ShowTreeDeleteSubjects=function(){
					$scope.GetTreeStructSubjectsOfExam($scope.institute.id,$scope.selectedExamForAddSubject.id);
					$scope.selectedSubjectForDelete.splice(0,$scope.selectedSubjectForDelete.length);
					$scope.ShowTreeAddDeleteSubjects();
					$scope.HideTreeAddSubjectTree();
					$scope.HideMessages();
					$scope.deleteMessageHide();
					$scope.DeleteSubjectsFromExam=true;
				}
				
				$scope.HideTreeDeleteSubjects=function(){
					 $scope.DeleteSubjectsFromExam=false;
				}

				$scope.ShowSubjectList = function() {

					$scope.ShowTreeStructAddNewSubjetcs = false;
					$scope.ShowSubjectListVarAddNewSubjetcs = true;
					$scope.ShowAddSubjectTable = false;

				};
				
				$scope.HideTreeAddSubjectTree=function(){
					$scope.ShowTreeStructAddNewSubjetcs = false;
					$scope.ShowSubjectListVarAddNewSubjetcs = false;
					$scope.ShowAddSubjectTable = false;
					
				}
				
				

				$scope.inst = {};
				$scope.branch = {};
				$scope.classes = {};
				$scope.div = {};
				$scope.subject = {};

				$scope.flag = 0;

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
				}
				;

				$scope.ShowSubjectTable = function() {
					$scope.ShowTreeStructAddNewSubjetcs = false;
					$scope.ShowSubjectListVarAddNewSubjetcs = false;
					$scope.ShowAddSubjectTable = true;
				};

				//------------------------------------To show selected subject for exam----------------------------------------------------
				$scope.ShowSelectedSubject = function() {
					console.log($scope.selectedExamForAddStudent.id);

					//*************************http post request to get subDiv composit id of selected exam***************** 
					$http(
							{
								url : "GetSubjectDivCompID/"
										+ $scope.selectedExamForAddStudent.id,
								method : "POST",
							})
							.then(
									function(response) { // if success       	
										console.log("WE got ids");

										$scope.SubjectDivCompIDList = response.data;
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
											console
													.log($scope.SubjectDivCompIDList[j]);
										}
									},
									function(data) { // optional // if failed
										$scope.subjectNotInExam = true;
										$scope.ShowSelectedSubjectTable = false;
										console
												.log(" failed to get the ids");
									});
				};
				
				
				

				//------------------------------on change function after changing exam in dropdown select-----------------------		   		  			 			  			
				$scope.selectExam = function() {
					$scope.subjectNotInExam = false;
					$scope.ShowSelectedSubjectTable = false;

				};
				
				$scope.datepickerActivate = function() {
					$('.datepicker').pikaday({
						firstDay : 1
					});
				};

				



		 },
	}
		 
		 
	})
}())