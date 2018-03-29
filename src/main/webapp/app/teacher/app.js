(function() {
	var app=angular.module("myApp",['ui.router',"ngSanitize",'ui.bootstrap','ivh.treeview']);
	
	app
	.config(function(ivhTreeviewOptionsProvider) {
		ivhTreeviewOptionsProvider
				.set({
					defaultSelectedState : false,
					validate : true,
					// Twisties can be images, custom html, or plain text
					twistieCollapsedTpl : ' <span class="menu-arrow arrow_carrot-right"></span>',
					twistieExpandedTpl : ' <span class="menu-arrow arrow_carrot-down"></span>',
					twistieLeafTpl : ' <i class="icon_document_alt"></i>'
				});
	});
	
	app.config(['$stateProvider','$urlRouterProvider',function($stateProvider,$urlRouterProvider) {
		
	
		  
		$urlRouterProvider.otherwise('/Home');
		
		
		$stateProvider.state({name : 'Home', url : '/Home',	component : 'homeComponet'});		
		$stateProvider.state({name : 'existingInstituteStructure', url : '/existingInstituteStructure', component : 'existingInstituteStructureComponent'});
		$stateProvider.state({name : 'studentRequest', url : '/studentRequest', component : 'studentRequestComponent'});	
		$stateProvider.state({name : 'teacherRequest', url : '/teacherRequest', component : 'teacherRequestComponent'});	
		$stateProvider.state({name : 'addStudentToDivision', url : '/addStudentToDivision',  templateUrl: '../app/teacher/appManger/addStudentToDivision/addStudentToDivision.html',
			 controller: 'addStudentToDivisionController',
										resolve :{
											studentList :($http) => { 
																return $http.get("AddStudentToDivisionGetStuendNotInAnyDivision") .then(function successCallback(response) {				 
																console.log("we got response of TeacherRequestForApprovalListJSON" +response.data);
																return response.data;       	         
																}, 
															      function errorCallback(response) {              
													                
													        	 console.log(" failed to get the studentlist for approval with message : "+response);      
													        });
														},
											branchList :($http) => {
																return $http.get("BranchListOfInstitute") .then(function successCallback(response) {			 
																	 console.log("we got response of BranchListOfInstitute" +response.data);
																	return response.data;       	         
														        }, 
														      function errorCallback(response) {              
														        	 console.log(" failed to get the BranchListOfInstitute for teacher approval with message : "+response);      
														        });
														}
													}
								});
		
		$stateProvider.state({name : 'StudenInDivision', url : '/StudenInDivision',  templateUrl: '../app/teacher/appManger/divisionsStudent/divisionsStudent.html', controller: 'divisionsStudentController',
							
			resolve :{
				branchList :($http) => {
									return $http.get("BranchListOfInstitute") .then(function successCallback(response) {			 
										 console.log("we got response of BranchListOfInstitute" +response.data);
										return response.data;       	         
							        }, 
							      function errorCallback(response) {              
							        	 console.log(" failed to get the BranchListOfInstitute for teacher approval with message : "+response);      
							        });
							}
						}
		});
		$stateProvider.state({name : 'schedule', url : '/schedule', templateUrl: '../app/teacher/schedule/schedule.html',  controller: 'scheduleController',
			resolve :{
				schedule :($http) => {
									return $http.get("scheduletreeJSON") .then(function successCallback(response) {			 
										 console.log("we got response of scheduletreeJSON" +response.data);
										return response.data;       	         
							        }, 
							      function errorCallback(response) {              
							        	 console.log(" failed to get the scheduletreeJSON for teacher approval with message : "+response);      
							        });
							}
						}
			
		});
		
		$stateProvider.state({name : 'Exams', url : '/exams', component : 'addEditExamComponent'	});
		
		$stateProvider.state({name : 'addEditSubject', url : '/schedule', templateUrl: '../app/teacher/subjectManager/addEditSubject/addEditSubject.html',  controller: 'addEditSubjectController',	});
		$stateProvider.state({name : 'result', url : '/result', template: '<ui-view></ui-view>',	});
		$stateProvider.state({name : 'result.Exams', url : '/exams', templateUrl: '../app/teacher/result/exam/exams.html',  controller: 'ResultsExamsController',	});
		
	
		
			
	}]);
	
}())