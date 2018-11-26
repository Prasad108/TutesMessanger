(function(){
	
	angular.module("myApp").directive("tsAddRemoveStudentFromExamSubjects",function(){
		return { 
		
		 templateUrl: '../app/teacher/Exam/addEdit/addRemoveStudent/addRemoveStudent.html',	
		 
		 controller: function($scope, $http, $interval, $filter,ivhTreeviewMgr,shairedDataService){
			//---------------------------To show students not added in exam of perticular subject------------------------
				$scope.OpenAdd = function(sub,
						SubjectDivCompIDList) {
					$scope.selectStudentFirstMessage = false;
					$scope.ShowSelectAll = true;
					sub.student_filter = "";
					for (var i = 0; i < SubjectDivCompIDList.length; i++) {

						if (SubjectDivCompIDList[i].id == sub.id) {

							$("#add" + sub.id).collapse('show');
							$("#show" + sub.id).collapse('hide');

						} else {

							$("#add"+ SubjectDivCompIDList[i].id).collapse('hide');
							$("#show"+ SubjectDivCompIDList[i].id).collapse('hide');
						}
					}

					console.log(sub.div.value);
					console.log(sub.id);
					
					
					
					//------------------------------------To show selected subject for exam----------------------------------------------------
					$scope.ShowSelectedSubject = function() {
						//console.log($scope.selectedExamForAddStudent.id);

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

//											for (var j = 0; j < $scope.SubjectDivCompIDList.length; j++) {
//												$scope.flag = 0;
//												$scope.inst = {};
//												$scope.branch = {};
//												$scope.classes = {};
//												$scope.div = {};
//												$scope.subject = {};
//
//												$scope.flag = 0;
//
//												traverseTillsubDivId(
//														$scope.InstTreeStructureWithSubject,
//														$scope.SubjectDivCompIDList[j].id);
//
//												if ($scope.flag > 0) {
//													$scope.SubjectDivCompIDList[j].inst = $scope.inst;
//													$scope.SubjectDivCompIDList[j].branch = $scope.branch;
//													$scope.SubjectDivCompIDList[j].classes = $scope.classes;
//													$scope.SubjectDivCompIDList[j].div = $scope.div;
//													$scope.SubjectDivCompIDList[j].subject = $scope.subject;
//												}
//												//console.log($scope.SubjectDivCompIDList[j]);
//											}
										},
										function(data) { // optional // if failed
											$scope.subjectNotInExam = true;
											$scope.ShowSelectedSubjectTable = false;
											console.log(" failed to get the ids");
										});
					};
					
					
					
					
					
					

					
					
					

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
			 
		 },
	}
		 
		 
	})
}())