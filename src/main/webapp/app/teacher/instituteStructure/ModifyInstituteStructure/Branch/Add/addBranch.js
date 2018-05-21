 (function(){
	var app=angular.module('myApp').controller("addBranchCtrl",addBranchCtrl);
	addBranchCtrl.$inject=['$scope','$http','shairedDataService','branchList'];
	function addBranchCtrl($scope,$http,shairedDataService,branchList){
		console.log("this is addBranchCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;
		
	}
}())