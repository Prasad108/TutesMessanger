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

							$scope.totallenght = $scope.studentNotInExamList.length
									/ $scope.numPerPage * 10;

					$scope.examList = [];
					$scope.examMode = [];
					$scope.examType = [];
					$scope.selectedSubject = [];
					$scope.selectedstudentList = [];
					//this.inst=[{"label":"Vidya", "value":50,"type":"Institute","children": [{"label":"Pune", "value":15,"type":"Branch","children":[{"label":"10th ", "value":18,"type":"Class","children":[{"label":"A", "value":19,"type":"Division"},{"label":"B", "value":20,"type":"Division"},{"label":"C", "value":21,"type":"Division"}]},{"label":"11th", "value":19,"type":"Class","children":[{"label":"PCM", "value":22,"type":"Division","children":[{"label":"English", "value":1,"type":"Subject","SubjectId":1},{"label":"Marathi", "value":2,"type":"Subject","SubjectId":2}]},{"label":"PCB", "value":23,"type":"Division","children":[{"label":"English", "value":3,"type":"Subject","SubjectId":1}]}]}]},{"label":"Mumbai", "value":16,"type":"Branch"}]}];

					
					//------------------------------Tree Traverlsal and Add the selected Items in respective array ----------------------------------------------------- 		   				
					$scope.TreeTraversalForSelectedItems = function(
							o) {
						for ( var i in o) {

							if (o[i] !== null
									&& typeof (o[i]) == "object") {

								if (o[i].type == "Institute"
										&& o[i].selected == true) {
									//console.log("Selected Institute is "+o[i].label);
									$scope.selectedInstitute
											.push(o[i]);
								}

								if (o[i].type == "Branch"
										&& o[i].selected == true) {
									//console.log("Selected Branch is "+o[i].label);
									$scope.selectedBranch
											.push(o[i]);
								}

								if (o[i].type == "Class"
										&& o[i].selected == true) {
									//console.log("Selected Class is "+o[i].label);
									$scope.selectedClass
											.push(o[i]);
								}

								if (o[i].type == "Division"
										&& o[i].selected == true) {
									//console.log("Selected Division is "+o[i].label);
									$scope.selectedDivision
											.push(o[i]);
								}

								if (o[i].type == "Subject"
										&& o[i].selected == true) {
									//console.log("Selected subject is "+o[i].label);
									$scope.selectedSubject
											.push(o[i]);
								}
								//going one step down in the object tree!!
								$scope
										.TreeTraversalForSelectedItems(o[i]);
							}
						}
					}

					this.awesomeCallback = function(node, tree) {
						// Do something with node or tree
						console.log("#");
					};
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

						console.log("Total Institute Selected are  "
										+ $scope.selectedInstitute.length);
						console.log("Total Branch Selected are  "
										+ $scope.selectedBranch.length);
						console.log("Total Class Selected are  "
										+ $scope.selectedClass.length);
						console.log("Total Division Selected are  "
										+ $scope.selectedDivision.length);
						console.log("Total Subjects Selected are  "
										+ $scope.selectedSubject.length);
						console.log($scope.selectedSubject);
						console.log("*************************************************************************");

					}

					//------------------------------Get the Exam List for Institute ----------------------------------------------------- 	   				
					$http(
							{
								url : "GetExamsOFInstitute/"
										+ $scope.institute.id,
								method : "POST",
							})
							.then(
									function(response) {
										// if success       	
										console.log("WE got exams of this institute ");
										$scope.examList = response.data;

										/* for( i=$scope.examList.length-1; i>=0; i--) {
										        console.log($scope.examList[i].id + $scope.examList[i].discription);    	
											}      */
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
										console.log("WE got examsModes");
										$scope.examMode = response.data;
									},
									function(data) { // optional
										// failed
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
									url : "SaveExam/"
											+ $scope.institute.id,
									contentType : 'application/json; charset=utf-8',
									dataType : 'json',
									method : "POST",
									data : data
								})
								.then(
										function(response) {
											// if success       	
											console.log("succcess  var data=JSON.stringify($scope.selectedstudentList);");

											$scope.examList
													.push(response.data); //add created exam to exam list

											$scope.selectedExamMode = null;
											$scope.selectedExamType = null;
											/* exam.institute=$scope.institute; */
											$scope.discription = null;
											$scope.outOf = null;
											$scope.passingMarks = null;
											$scope.selectedRegular.id = null;

											$scope.ExamCreateSuccess = true;

										},
										function(data) { // optional
											// failed

											console
													.log(" failed to save the exam");
											$scope.ExamCreateError = true;
										});

					};

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
											// if success       	
											console
													.log("succcess ");
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
												console
														.log("delettion failed");
												$scope.ExamDeleteError = true;
											}

										},
										function(data) { // optional
											// failed

											console
													.log(" failed to delete the exam");
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
						console
								.log($scope.passingMarksEditExam);
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
													$scope.examList
															.splice(
																	i,
																	1);// remove the updating exam 				  		   	   
											}
											$scope.examList
													.push(response.data);// add new modfied exam

											$scope.ExamUpdateSuccess = true;

										},
										function(data) { // optional
											// failed		                 
											console
													.log(" failed to save the exam");
										});

					};

					$scope.ShowTree = function() {

						$scope.ShowTreeStruct = true;
						$scope.ShowSubjectListVar = false;
						$scope.ShowAddSubjectTable = false;
					};

					$scope.ShowSubjectList = function() {

						$scope.ShowTreeStruct = false;
						$scope.ShowSubjectListVar = true;
						$scope.ShowAddSubjectTable = false;

					};

					

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
											console
													.log($scope.inst.label);
										}

										if (o[i].type == "Branch") {
											$scope.branch.label = o[i].label;
											console
													.log($scope.branch.label);
										}

										if (o[i].type == "Class") {
											$scope.classes.label = o[i].label;
											console
													.log($scope.classes.label);
										}

										if (o[i].type == "Division") {
											$scope.div.label = o[i].label;
											$scope.div.value = o[i].value;
											console
													.log($scope.div.label);
											console
													.log($scope.div.value);
										}

										if (o[i].type == "Subject"
												&& o[i].value == subDivId) {
											$scope.subject.label = o[i].label;
											console
													.log($scope.subject.label);
											$scope.flag = 2;
											console
													.log("break **************************");
											break;
										}

										//going one step down in the object tree!!
										traverseTillsubDivId(
												o[i], subDivId);
									}
								}
							}
						}
					}
					;

					$scope.ShowSubjectTable = function() {
						$scope.ShowTreeStruct = false;
						$scope.ShowSubjectListVar = false;
						$scope.ShowAddSubjectTable = true;
					};

					//------------------------------------To show selected subject for exam----------------------------------------------------
					$scope.ShowSelectedSubject = function() {
						console
								.log($scope.selectedExamForAddStudent.id);

						//*************************http post request to get subDiv composit id of selected exam***************** 
						$http(
								{
									url : "GetSubjectDivCompID/"
											+ $scope.selectedExamForAddStudent.id,
									method : "POST",
								})
								.then(
										function(response) { // if success       	
											console
													.log("WE got ids");

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

					$scope.datepickerActivate = function() {
						$('.datepicker').pikaday({
							firstDay : 1
						});
					};

					$scope.AddSubjectToExam = function() {

						$scope.ExamSubjectList = [];
						console.log($scope.selectedSubject);

						for (var i = 0; i < $scope.selectedSubject.length; i++) {
							var ExamSubject = {};
							ExamSubject.exam = {};
							ExamSubject.subjectDivComposit = {};

							ExamSubject.exam.id = $scope.selectedExamForAddSubject.id;
							ExamSubject.subjectDivComposit.id = $scope.selectedSubject[i].value;
							ExamSubject.dateTime = new Date(
									$scope.selectedSubject[i].ExamDate);
							ExamSubject.durationInMinutes = $scope.selectedSubject[i].DurationInMinutes;
							ExamSubject.outOfMarks = $scope.selectedSubject[i].OutOF;
							ExamSubject.passingMarks = $scope.selectedSubject[i].PassingMarks;
							$scope.ExamSubjectList
									.push(ExamSubject);

						}

						console.log($scope.ExamSubjectList);

						var data = JSON
								.stringify($scope.ExamSubjectList);

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
											console
													.log("succcess");
											var resp = response.data;

											if (resp.message = "success") {// subjecte added to exam 
												$scope.SubjectAddedSuccess = true;
												$scope.SubjectAddedFailed = false;

											} else {// failed to add subject to exam
												$scope.SubjectAddedFailed = true;
												$scope.SubjectAddedSuccess = false;
											}
										},
										function(data) { // optional
											// failed		                 
											console
													.log(" failed to AddSubjectToExam the exam");
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

					//------------------------------on change function after changing exam in dropdown select-----------------------		   		  			 			  			
					$scope.selectExam = function() {
						$scope.subjectNotInExam = false;
						$scope.ShowSelectedSubjectTable = false;

					};

					//---------------------------To show students not added in exam of perticular subject------------------------
					$scope.OpenAdd = function(sub,
							SubjectDivCompIDList) {
						$scope.selectStudentFirstMessage = false;
						$scope.ShowSelectAll = true;
						sub.student_filter = "";
						for (var i = 0; i < SubjectDivCompIDList.length; i++) {

							if (SubjectDivCompIDList[i].id == sub.id) {

								$("#add" + sub.id).collapse(
										'show');
								$("#show" + sub.id).collapse(
										'hide');

							} else {

								$(
										"#add"
												+ SubjectDivCompIDList[i].id)
										.collapse('hide');
								$(
										"#show"
												+ SubjectDivCompIDList[i].id)
										.collapse('hide');
							}
						}

						console.log(sub.div.value);
						console.log(sub.id);

						//********************* http post request to get student not added in exam ************************
						$http(
								{
									url : "GetStudentListNotInExamJSON/"
											+ sub.id
											+ "/"
											+ sub.div.value
											+ "/"
											+ $scope.selectedExamForAddStudent.id,
									contentType : 'application/json; charset=utf-8',
									dataType : 'json',
									method : "POST",
								})
								.then(
										function successCallback(
												response) {
											// if success   then generate student table

											console
													.log("response came");
											if (response.data.ErrorMessage) {
												console
														.log("there is error no students");

												$scope.studentNotInExamList
														.splice(
																0,
																$scope.studentNotInExamList.length);
												$scope.filteredTodos = $scope.studentNotInExamList;
												//$scope.ShowStudentNotInExam=false;    //do not show student table
												// $scope.NoStudentInDivision=true;
											} else {
												console
														.log("succesess students are there");
												// $scope.ShowStudentNotInExam=true; //show student table
												//$scope.studentNotInExamList.splice(0,$scope.studentNotInExamList.length);
												//$scope.filteredTodos.splice(0,$scope.filteredTodos.length);

												$scope.NoStudentInDivision = false;
												$scope.studentNotInExamList = response.data;

												console
														.log($scope.studentNotInExamList);

												for (var i = 0; i < $scope.studentNotInExamList.length; i++) {
													$scope.studentNotInExamList[i].Selected = false;
												}
												;

												$scope.totallenght = $scope.studentNotInExamList.length
														/ $scope.numPerPage
														* 10;

												$scope
														.CheckUncheckHeader(sub);
												for (i = $scope.studentNotInExamList.length - 1; i >= 0; i--) {
													console
															.log($scope.studentNotInExamList[i].fname);
												}
												console
														.log("current page: "
																+ $scope.currentPage);
												var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin
														+ $scope.numPerPage;
												console
														.log("begin is "
																+ begin
																+ " end is "
																+ end)
												$scope.filteredTodos = $scope.studentNotInExamList
														.slice(
																begin,
																end);
											}
										},
										function errorCallback(
												response) {
											// failed
											console
													.log("error response came");
										});

					};

					//---------------------------To show students added in exam for perticular subject------------------------	
					$scope.OpenShow = function(sub,
							SubjectDivCompIDList) {
						console.log(sub.id);
						$scope.selectStudentFirstMessage = false;
						$scope.ShowSelectAll1 = true;
						sub.student_filter1 = "";
						for (var i = 0; i < SubjectDivCompIDList.length; i++) {
							console
									.log("in for loop : "
											+ SubjectDivCompIDList[i].id);

							if (SubjectDivCompIDList[i].id == sub.id) {
								console.log("in if condition");
								console.log($("#add" + sub.id));
								$("#add" + sub.id).collapse(
										'hide');
								$("#show" + sub.id).collapse(
										'show');

							} else {

								console
										.log("in else condition");
								console
										.log($("#add"
												+ SubjectDivCompIDList[i].id));
								$(
										"#add"
												+ SubjectDivCompIDList[i].id)
										.collapse('hide');
								$(
										"#show"
												+ SubjectDivCompIDList[i].id)
										.collapse('hide');
							}
						}

						//****************************** http post request to get student added in exam ************************
						$http(
								{
									url : "GetStudentListOfExamJSON/"
											+ sub.id
											+ "/"
											+ $scope.selectedExamForAddStudent.id,
									contentType : 'application/json; charset=utf-8',
									dataType : 'json',
									method : "POST",
								})
								.then(
										function successCallback(
												response) {
											// if success   then generate student table

											console
													.log("response came");
											if (response.data.ErrorMessage) {
												console
														.log("there is error no students");

												$scope.studentInExamList
														.splice(
																0,
																$scope.studentInExamList.length);
												$scope.filteredTodos1 = $scope.studentInExamList;
												//$scope.ShowStudentNotInExam=false;    //do not show student table
												// $scope.NoStudentInDivision=true;
											} else {
												console
														.log("succesess students are there");
												// $scope.ShowStudentNotInExam=true; //show student table
												//$scope.studentNotInExamList.splice(0,$scope.studentNotInExamList.length);
												//$scope.filteredTodos.splice(0,$scope.filteredTodos.length);

												//$scope.NoStudentInDivision=false;   
												$scope.studentInExamList = response.data;

												console
														.log($scope.studentInExamList);

												for (var i = 0; i < $scope.studentInExamList.length; i++) {
													$scope.studentInExamList[i].Selected = false;
												}
												;

												$scope.totallenght = $scope.studentInExamList.length
														/ $scope.numPerPage
														* 10;

												$scope
														.CheckUncheckHeader1(sub);
												for (i = $scope.studentInExamList.length - 1; i >= 0; i--) {
													console
															.log($scope.studentInExamList[i].fname);
												}
												console
														.log("current page: "
																+ $scope.currentPage);
												var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin
														+ $scope.numPerPage;
												console
														.log("begin is "
																+ begin
																+ " end is "
																+ end)
												$scope.filteredTodos1 = $scope.studentInExamList
														.slice(
																begin,
																end);
											}
										},
										function errorCallback(
												response) {
											// failed
											console
													.log("error response came");
										});

					};

					//------------------------check uncheck function on chekbox at table header for add student------------------------
					$scope.CheckUncheckHeader = function(sub) {
						sub.IsAllChecked = true;

						for (var i = 0; i < $scope.studentNotInExamList.length; i++) {
							console
									.log($scope.studentNotInExamList[i].Selected);
							if (!$scope.studentNotInExamList[i].Selected) {
								sub.IsAllChecked = false;
								break;
							}
						}
						;
					};

					//------------------------check uncheck function on chekbox at table header for show student------------------------
					$scope.CheckUncheckHeader1 = function(sub) {
						sub.IsAllChecked1 = true;

						for (var i = 0; i < $scope.studentInExamList.length; i++) {
							console
									.log($scope.studentInExamList[i].Selected1);
							if (!$scope.studentInExamList[i].Selected1) {
								sub.IsAllChecked1 = false;
								break;
							}
						}
						;
					};

					// $scope.CheckUncheckHeader();
					//------------------------check uncheck all function on chekbox in table for add student------------------------
					$scope.CheckUncheckAll = function(sub) {
						$scope.selectStudentFirstMessage = false;
						//$scope.deleteSucessStudent=false;

						console.log("CheckUncheckAll :"
								+ sub.IsAllChecked)

						for (var i = 0; i < $scope.studentNotInExamList.length; i++) {
							$scope.studentNotInExamList[i].Selected = sub.IsAllChecked;
						}

						for (var i = 0; i < $scope.studentNotInExamList.length; i++) {
							console
									.log($scope.studentNotInExamList[i].Selected);
						}
					};

					//------------------------check uncheck all function on chekbox in table for show student------------------------
					$scope.CheckUncheckAll1 = function(sub) {
						$scope.selectStudentFirstMessage = false;
						//$scope.deleteSucessStudent=false;

						console.log("CheckUncheckAll :"
								+ sub.IsAllChecked1)

						for (var i = 0; i < $scope.studentInExamList.length; i++) {
							$scope.studentInExamList[i].Selected1 = sub.IsAllChecked1;
						}
						for (var i = 0; i < $scope.studentInExamList.length; i++) {
							console
									.log($scope.studentInExamList[i].Selected1);
						}
					};

					//---------------------------watch function for add student table------------------------------------------
					$scope
							.$watch(
									'currentPage + numPerPage',
									function() {
										console
												.log("current page: "
														+ $scope.currentPage);
										var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin
												+ $scope.numPerPage;
										console.log("begin is "
												+ begin
												+ " end is "
												+ end);
										$scope.filteredTodos = $scope.studentNotInExamList
												.slice(begin,
														end);
									});

					//---------------------------watch function for show student table------------------------------------------
					$scope
							.$watch(
									'currentPage + numPerPage',
									function() {
										console
												.log("current page: "
														+ $scope.currentPage);
										var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin
												+ $scope.numPerPage;
										console.log("begin is "
												+ begin
												+ " end is "
												+ end);
										$scope.filteredTodos1 = $scope.studentInExamList
												.slice(begin,
														end);
									});

					//----------------------------filter student on add student table to add in exam--------------------------------------------
					$scope.filterStudent = function(sub) {
						if ((sub.student_filter.length) > 0) {
							$scope.ShowSelectAll = false;
							var searchFilter = sub.student_filter;
							console.log(searchFilter);

							$scope.filteredTodos = $filter(
									'filter')
									(
											$scope.studentNotInExamList,
											searchFilter);
							console
									.log($scope.filteredTodos.length);

							$scope.totallenght = $scope.filteredTodos.length
									/ $scope.numPerPage * 10;

							$scope
									.filteredCheckUncheckHeader(sub);
						} else {
							$scope.totallenght = $scope.studentNotInExamList.length
									/ $scope.numPerPage * 10;
							$scope.ShowSelectAll = true;

							var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin
									+ $scope.numPerPage;
							console.log("begin is " + begin
									+ " end is " + end);
							$scope.filteredTodos = $scope.studentNotInExamList
									.slice(begin, end);
						}
					};

					//----------------------------filter student on show student table delete from exam--------------------------------------------
					$scope.filterStudent1 = function(sub) {
						if ((sub.student_filter1.length) > 0) {
							$scope.ShowSelectAll1 = false;
							var searchFilter = sub.student_filter1;
							console.log(searchFilter);

							$scope.filteredTodos1 = $filter(
									'filter')(
									$scope.studentInExamList,
									searchFilter);
							console
									.log($scope.filteredTodos1.length);

							$scope.totallenght = $scope.filteredTodos1.length
									/ $scope.numPerPage * 10;

							$scope
									.filteredCheckUncheckHeader1(sub);
						} else {
							$scope.totallenght = $scope.studentInExamList.length
									/ $scope.numPerPage * 10;
							$scope.ShowSelectAll1 = true;

							var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin
									+ $scope.numPerPage;
							console.log("begin is " + begin
									+ " end is " + end)
							$scope.filteredTodos1 = $scope.studentInExamList
									.slice(begin, end);
						}
					};

					//-----------------------------	check uncheck all function on chekbox on filtered table for add student-----------------				        	
					$scope.filterCheckUncheckAll = function(sub) {
						$scope.selectStudentFirstMessage = false;
						//$scope.deleteSucessStudent=false;

						for (var i = 0; i < $scope.filteredTodos.length; i++) {

							$scope.filteredTodos[i].Selected = sub.IsFilteredAllChecked;

							for (var j = 0; j < $scope.studentNotInExamList.length; j++) {
								if ($scope.filteredTodos[i] == $scope.studentNotInExamList[j]) {
									$scope.studentNotInExamList[j].Selected = sub.IsFilteredAllChecked;
									break;
								}
							}
						}
					};

					//-----------------------------	check uncheck all function on chekbox on filtered table for show student-----------------				        	
					$scope.filterCheckUncheckAll1 = function(
							sub) {
						$scope.selectStudentFirstMessage = false;
						//$scope.deleteSucessStudent=false;

						for (var i = 0; i < $scope.filteredTodos1.length; i++) {

							$scope.filteredTodos1[i].Selected1 = sub.IsFilteredAllChecked1;

							for (var j = 0; j < $scope.studentInExamList.length; j++) {
								if ($scope.filteredTodos1[i] == $scope.studentInExamList[j]) {
									$scope.studentInExamList[j].Selected1 = sub.IsFilteredAllChecked1;
									break;
								}
							}
						}
					};

					//------------------------check uncheck function on chekbox at filtered table header for add student------------------------	        	
					$scope.filteredCheckUncheckHeader = function(
							sub) {
						sub.IsFilteredAllChecked = true;
						$scope.selectStudentFirstMessage = false;
						// $scope.deleteSucessStudent=false;

						for (var i = 0; i < $scope.filteredTodos.length; i++) {
							if (!$scope.filteredTodos[i].Selected) {
								sub.IsFilteredAllChecked = false;
								break;
							}
						}
						;
					};

					//------------------------check uncheck function on chekbox at filtered table header for show student------------------------
					$scope.filteredCheckUncheckHeader1 = function(
							sub) {
						sub.IsFilteredAllChecked1 = true;
						$scope.selectStudentFirstMessage = false;
						// $scope.deleteSucessStudent=false;

						for (var i = 0; i < $scope.filteredTodos1.length; i++) {
							if (!$scope.filteredTodos1[i].Selected1) {
								sub.IsFilteredAllChecked1 = false;
								break;
							}
						}
						;
					};

					//----------------------------------add selected students to exam ---------------------------------      
					$scope.addStudentToExam = function(sub) {
						var index = [];
						sub.student_filter = "";
						for (var i = 0; i < $scope.studentNotInExamList.length; i++) {
							if ($scope.studentNotInExamList[i].Selected) {
								console
										.log($scope.studentNotInExamList[i].fname);
								index.push(i);
								$scope.selectedstudentList
										.push($scope.studentNotInExamList[i]); //--------push selected student in selectedStudentList array
							}
						}

						for (var i = 0; i < $scope.studentNotInExamList.length; i++) {
							for (var j = 0; j < $scope.selectedstudentList.length; j++) {
								if ($scope.studentNotInExamList[i] == $scope.selectedstudentList[j]) {
									$scope.studentNotInExamList
											.splice(i, 1); //remove selected student from studentList
								}
							}
						}

						console
								.log($scope.studentNotInExamList);

						$scope.totallenght = $scope.studentNotInExamList.length
								/ $scope.numPerPage * 10;
						console.log("current page: "
								+ $scope.currentPage);
						var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin
								+ $scope.numPerPage;
						console.log("begin is " + begin
								+ " end is " + end);
						$scope.filteredTodos = $scope.studentNotInExamList
								.slice(begin, end);

						if ($scope.selectedstudentList.length != 0) //----check selectedStudentList is empty or not
						{
							// $scope.deleteSucessStudent=false; 
							$scope.selectStudentFirstMessage = false;
							console
									.log("selectedstudentList is not empty");

							//****************** http post request to add selected student *******************
							$http(
									{
										url : "addSelectedStudentToExam/"
												+ sub.id
												+ "/"
												+ $scope.selectedExamForAddStudent.id
												+ "/"
												+ sub.div.value,
										contentType : 'application/json; charset=utf-8',
										dataType : 'json',
										method : "POST",
										data : JSON
												.stringify($scope.selectedstudentList)
									})
									.then(
											function successCallback(
													response) {
												// if success   
												//$scope.deleteSucessStudent=true; 
												console
														.log("success response came");
												$scope.ShowSelectAll = true;
												$scope
														.PaginationInitialSetup(sub);
											},
											function errorCallback(
													response) {
												// failed
												//  $scope.deleteSucessStudent=false;
												console
														.log("error response came");
											});
						} else {
							console
									.log("selectedstudentList is empty");
							$scope.selectStudentFirstMessage = true;
						}
						$scope.selectedstudentList
								.splice(
										0,
										$scope.selectedstudentList.length); //-----empty selectedStudentList array
					};

					//---------------------------------------------delete selected students from exam -----------------------------------   

					$scope.deleteStudentFromExam = function(sub) {
						var index = [];
						sub.student_filter1 = "";
						console.log($scope.studentInExamList);
						for (var i = 0; i < $scope.studentInExamList.length; i++) {
							if ($scope.studentInExamList[i].Selected1) {
								console
										.log($scope.studentInExamList[i].fname);
								index.push(i);
								$scope.selectedstudentList
										.push($scope.studentInExamList[i]); //--------push selected student in selectedStudentList array
							}
						}

						for (var i = 0; i < $scope.studentInExamList.length; i++) {
							for (var j = 0; j < $scope.selectedstudentList.length; j++) {
								if ($scope.studentInExamList[i] == $scope.selectedstudentList[j]) {
									$scope.studentInExamList
											.splice(i, 1); //remove selected student from studentList
								}
							}
						}

						console.log($scope.studentInExamList);

						$scope.totallenght = $scope.studentInExamList.length
								/ $scope.numPerPage * 10;
						console.log("current page: "
								+ $scope.currentPage);
						var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin
								+ $scope.numPerPage;
						console.log("begin is " + begin
								+ " end is " + end)
						$scope.filteredTodos1 = $scope.studentInExamList
								.slice(begin, end);

						if ($scope.selectedstudentList.length != 0) //----check selectedStudentList is empty or not
						{
							// $scope.deleteSucessStudent=false; 
							$scope.selectStudentFirstMessage = false;
							console
									.log("selectedstudentList is not empty");

							//************************ http post request to delete selected student**********************
							$http(
									{
										url : "deleteSelectedStudentFromExam/"
												+ sub.id
												+ "/"
												+ $scope.selectedExamForAddStudent.id
												+ "/"
												+ sub.div.value,
										contentType : 'application/json; charset=utf-8',
										dataType : 'json',
										method : "POST",
										data : JSON
												.stringify($scope.selectedstudentList)

									})
									.then(
											function successCallback(
													response) {
												// if success   
												//$scope.deleteSucessStudent=true; 
												console
														.log("success response came");
												$scope.ShowSelectAll1 = true;
												$scope
														.PaginationInitialSetup1(sub);
											},
											function errorCallback(
													response) {
												// failed
												//  $scope.deleteSucessStudent=false;
												console
														.log("error response came");
											});
						} else {
							console
									.log("selectedstudentList is empty");
							$scope.selectStudentFirstMessage = true;
						}
						$scope.selectedstudentList
								.splice(
										0,
										$scope.selectedstudentList.length); //-----empty selectedStudentList array
					};

					$scope.PaginationInitialSetup = function(
							sub) {
						$scope.totallenght = $scope.studentNotInExamList.length
								/ $scope.numPerPage * 10;
						$scope.CheckUncheckHeader(sub);
						$scope.filteredCheckUncheckHeader(sub);
						console.log("current page: "
								+ $scope.currentPage);
						var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin
								+ $scope.numPerPage;
						console.log("begin is " + begin
								+ " end is " + end);
						$scope.filteredTodos = $scope.studentNotInExamList
								.slice(begin, end);
					};

					$scope.PaginationInitialSetup1 = function(
							sub) {
						$scope.totallenght = $scope.studentInExamList.length
								/ $scope.numPerPage * 10;
						$scope.CheckUncheckHeader1(sub);
						$scope.filteredCheckUncheckHeader(sub);
						console.log("current page: "
								+ $scope.currentPage);
						var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin
								+ $scope.numPerPage;
						console.log("begin is " + begin
								+ " end is " + end);
						$scope.filteredTodos1 = $scope.studentInExamList
								.slice(begin, end);
					};

					/*   $scope.expand=function($event){
					console.log("in expand function");
					   if($($event.target).find('.collapse').hasClass('in')){
						   console.log("if condition");
						   $($event.target).find('.collapse').removeClass('in')
					   }else{
						   console.log("else condition");
					        $($event.target).find('.collapse').addClass('in')
					   }
					};  */

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

					$scope.ExamChanged = function() {
						console.log("exam changed");

						ivhTreeviewMgr
								.deselectAll($scope.InstTreeStructureWithSubject);
						$scope.selectedSubject.splice(0,
								$scope.selectedSubject.length);
					}
				}]);
	
	
	

	
}())
		 