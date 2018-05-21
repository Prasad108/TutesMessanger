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
		$stateProvider.state({name : 'existingInstituteStructure', url : '/existingInstituteStructure', templateUrl : '../app/teacher/instituteStructure/existingInstituteStructure/existingInstituteStructure.html', controller : 'existingInstituteStructureController', 
							resolve :{
										schedule :function(resolveService){return resolveService.schedule();}
									}
							});
		$stateProvider.state({name : 'studentRequest', url : '/studentRequest', component : 'studentRequestComponent'});	
		$stateProvider.state({name : 'teacherRequest', url : '/teacherRequest', component : 'teacherRequestComponent'});	
		$stateProvider.state({name : 'addStudentToDivision', url : '/addStudentToDivision',  templateUrl: '../app/teacher/appManger/addStudentToDivision/addStudentToDivision.html', controller: 'addStudentToDivisionController',
							resolve :{
										studentList :function(resolveService){return resolveService.studentList();	},
										branchList :function(resolveService){return resolveService.branchList();	}
									}
							});		
		$stateProvider.state({name : 'StudenInDivision', url : '/StudenInDivision',  templateUrl: '../app/teacher/appManger/divisionsStudent/divisionsStudent.html', controller: 'divisionsStudentController',							
							resolve :{
								branchList :function(resolveService){return resolveService.branchList();	}
										}
						});
		$stateProvider.state({name : 'schedule', url : '/schedule', templateUrl: '../app/teacher/schedule/schedule.html',  controller: 'scheduleController',
							resolve :{
								schedule :function(resolveService){return resolveService.schedule();}}
							});
		$stateProvider.state({name : 'Exams', url : '/exams', component : 'addEditExamComponent'	});		
		$stateProvider.state({name : 'addEditSubject', url : '/schedule', templateUrl: '../app/teacher/subjectManager/addEditSubject/addEditSubject.html',  controller: 'addEditSubjectController',	});
		$stateProvider.state({name : 'result', url : '/result', template: '<ui-view></ui-view>',	});
		$stateProvider.state({name : 'result.Exams', url : '/exams', templateUrl: '../app/teacher/result/exam/exams.html',  controller: 'ResultsExamsController',	});
		$stateProvider.state({name : 'subject', url : '/subject', template: '<ui-view></ui-view>',	});
		$stateProvider.state({name : 'subject.addEdit', url : '/addEdit', templateUrl: '../app/teacher/subjectManager/addEditSubject/addEditSubject.html',  controller: 'addEditSubjectCtrl',});
		$stateProvider.state({name : 'subject.divisionSubjects', url : '/divsionSubjects', templateUrl: '../app/teacher/subjectManager/divisionSubjects/divisionSubjects.html',  controller: 'divisionSubjectsCtrl',
							resolve :{
										branchList :function(resolveService){return resolveService.branchList();	}
									}	
							});		
		$stateProvider.state({name : 'profile', url : '/profile', template: '<ui-view></ui-view>',	});
		$stateProvider.state({name : 'profile.view', url : '/view', templateUrl: '../app/teacher/profile/viewProfile/viewProfile.html',  controller: 'viewProfileCtrl',});
		$stateProvider.state({name : 'profile.edit', url : '/edit', templateUrl: '../app/teacher/profile/editProfile/editProfile.html',  controller: 'editProfileCtrl',});
		$stateProvider.state({name : 'sns', url : '/sns', templateUrl: '../app/teacher/SNS/sns.html',  controller: 'snsCtrl',});
		$stateProvider.state({name : 'examSubjects', url : '/examSubjects/:id', templateUrl: '../app/teacher/result/examSubjects/examSubjects.html',  controller: 'examSubjectCtrl',
			resolve :{
				InstTreeStructureWithSubject :function(resolveService){return resolveService.InstTreeStructureWithSubject();	}
						}
		});		
		$stateProvider.state({name : 'examSubjectsStudents', url : '/examSubjects/:id/examSubjectsStudents/:subjectId', templateUrl: '../app/teacher/result/examSubjectStudents/examSubjectStudent.html',  controller: 'examSubjectStudentCtrl'});
		$stateProvider.state({name : 'paginationTest', url : '/paginationTest', templateUrl: '../app/teacher/paginationTest/pagination.html',  controller: 'paginationCtrl'});
		
		$stateProvider.state({name : 'ChangeUserNamePassowrd', url : '/ChangeUserNamePassowrd', templateUrl: '../app/teacher/profile/changePassword/changePassword.html',  controller: 'editUsernamePassword'});
		
		$stateProvider.state({name : 'ModifyInstituteStructure', url : '/ModifyInstituteStructure', templateUrl: '../app/teacher/instituteStructure/ModifyInstituteStructure/ModifyInstituteStructure.html',  controller: 'modifyInstStructCtrl',
							resolve :{
								branchList :function(resolveService){return resolveService.branchList();	}
							}		
		});
		$stateProvider.state({name : 'AddBranch', url : '/AddBranch' , templateUrl: '../app/teacher/instituteStructure/ModifyInstituteStructure/Branch/Add/AddBranch.html',  controller: 'addBranchCtrl', resolve :{branchList :function(resolveService){return resolveService.branchList();}}});
		
		   
		
		$stateProvider.state({name : 'ChangeUsernamePassword', url : '/ChangeUsernamePassword', templateUrl: '../app/teacher/profile/ChangeUsernamePassword/ChangeUsernamePassword.html',  controller: 'ChangeUsernamePasswordCtrl'});		
		$stateProvider.state({name : 'ChangePassword', url : '/ChangePassword', templateUrl: '../app/teacher/profile/ChangePassword/ChangePassword.html',  controller: 'ChangePasswordCtrl'});
		
		
	}]);
	
}())