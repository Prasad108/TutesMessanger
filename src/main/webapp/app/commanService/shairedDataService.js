(function(){
	
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