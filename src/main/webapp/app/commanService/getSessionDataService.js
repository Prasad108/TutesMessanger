(function() {
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
}())