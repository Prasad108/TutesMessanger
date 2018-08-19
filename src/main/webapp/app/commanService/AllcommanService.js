(function(){

	angular.module('myApp').constant('constants',{
		 APP_TITLE_FIRST_NAME :'TUTES',
		 APP_TITLE_SECOND_NAME :'MESSANGER',
		 
		
	});
}());(function(){
	angular.module('myApp').factory("resolveService",resolveService);
	
	function resolveService($http,shairedDataService){
		
		var service={
				schedule :InstituteTreeStruct,
				studentList: StudentNotInAnyDevision,
				branchList: BranchListOfInstitute,
				InstTreeStructureWithSubject: InstTreeStructureWithSubject,
		}
		return service;
		

		function InstituteTreeStruct() {
			return $http(
					{url : "GetInstituteTreeStruct/"+ shairedDataService.institute.id,
						method : "POST",
					})
					.then(function successCallback(response) {
								console.log("we got response of GetInstituteTreeStruct"+ response.data);
								return response.data;
							},
							function errorCallback(response) {
								console.log(" failed to get the GetInstituteTreeStruct with message : "+ response);
							});
		}
		
		function StudentNotInAnyDevision(){ 
			return $http.get("AddStudentToDivisionGetStuendNotInAnyDivision") .then(function successCallback(response) {				 
				console.log("we got response of TeacherRequestForApprovalListJSON" +response.data);
				return response.data;       	         
				}, 
			      function errorCallback(response) {              
	                
	        	 console.log(" failed to get the studentlist for approval with message : "+response);      
	        });
		}
		
		function BranchListOfInstitute(){
				return $http.get("BranchListOfInstitute") .then(function successCallback(response) {			 
					 console.log("we got response of BranchListOfInstitute" +response.data);
					return response.data;       	         
		        }, 
		      function errorCallback(response) {              
		        	 console.log(" failed to get the BranchListOfInstitute for teacher approval with message : "+response);      
		        });
		}

		function InstTreeStructureWithSubject(){
				return $http(
						{url : "GetSubjectTreeStruct/"+ shairedDataService.institute.id,
							method : "POST",
						}) .then(function successCallback(response) {			 
					 console.log("we got response of GetSubjectTreeStruct" +response.data);
					return response.data;       	         
		        }, 
		      function errorCallback(response) {              
		        	 console.log(" failed to get the GetSubjectTreeStruct with message : "+response);      
		        });
		}
				
	
		
		
	};
}());(function() {
	angular.module("myApp").factory("getSessionDataService",getSessionDataService);
	getSessionDataService.$inject=["$http"];
	function getSessionDataService($http)
	{
		var service={
				getTeacherSessionData:getTeacherSessionData
		}
		
		return service;
		function getTeacherSessionData()
		{
			return $http.get("getSessionVariables");
			
		}
	}
}());(function(){
	
	angular.module('myApp').factory("shairedDataService",shairedDataService);
	shairedDataService.$inject=[];
	function shairedDataService()
	{
		var teacher={};
		var permissions={};
		var institute={};
		var student={}
		var service={
				teacher :teacher,
				permissions :permissions,
				institute :institute,
				student :student,
				
		}
		
		return service;
	}
}())