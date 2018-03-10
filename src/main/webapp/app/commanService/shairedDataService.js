(function(){
	
	angular.module('myApp').factory("shairedDataService",shairedDataService);
	shairedDataService.$inject=[];
	function shairedDataService()
	{
		var teacher={};
		var permissions={};
		var service={
				teacher :teacher,
				permissions :permissions,
				
		}
	}
}())