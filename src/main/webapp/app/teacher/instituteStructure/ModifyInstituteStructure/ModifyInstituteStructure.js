(function(){
	var app=angular.module('myApp').controller("modifyInstStructCtrl",modifyInstStructCtrl);
	modifyInstStructCtrl.$inject=['$scope','$http','shairedDataService','branchList'];
	function modifyInstStructCtrl($scope,$http,shairedDataService,branchList){
		console.log("this is modifyInstStructCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;
		
	}
}())