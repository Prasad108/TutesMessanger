(function() {
	var app=angular.module("myApp",['ui.router',"ngSanitize",'ui.bootstrap']);
	
	app.config(['$stateProvider','$urlRouterProvider',function($stateProvider,$urlRouterProvider) {
		  
		$urlRouterProvider.otherwise('/Home');
		
		
		$stateProvider.state({name : 'Home', url : '/Home',	component : 'homeComponet'});		
		$stateProvider.state({name : 'existingInstituteStructure', url : '/existingInstituteStructure', component : 'existingInstituteStructureComponent'});
		$stateProvider.state({name : 'studentRequest', url : '/studentRequest', component : 'studentRequestComponent'});	
		$stateProvider.state({name : 'teacherRequest', url : '/teacherRequest', component : 'teacherRequestComponent'});	
		$stateProvider.state({name : 'addStudentToDivision', url : '/addStudentToDivision', component : 'addStudentToDivisionComponent',
										resolve :{
											studentList :($http) => { 
																return $http.get("TeacherRequestForApprovalListJSON") .then(function successCallback(response) {				 
																console.log("we got response of TeacherRequestForApprovalListJSON" +response.data);
																//return response.data;       	         
																}, 
															      function errorCallback(response) {              
													                 $scope.message=data.message;
													        	 console.log(" failed to get the studentlist for approval with message : "+data.message);      
													        });
														},
											branchList :($http) => {
																return $http.get("BranchListOfInstitute") .then(function successCallback(response) {			 
																	 console.log("we got response of BranchListOfInstitute" +response.data);
																	// return response.data;       	         
														        }, 
														      function errorCallback(response) {              
														                 $scope.message=data.message;
														        	 console.log(" failed to get the BranchListOfInstitute for teacher approval with message : "+data.message);      
														        });
														}
													}
								});
		
		
				
			
	}]);
	
}())