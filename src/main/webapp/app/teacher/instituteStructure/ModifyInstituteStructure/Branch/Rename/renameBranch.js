 (function(){
	var app=angular.module('myApp').controller("renameBranchCtrl",renameBranchCtrl);
	renameBranchCtrl.$inject=['$scope','$state','$timeout','$http','shairedDataService','branchList'];
	function renameBranchCtrl($scope,$state,$timeout,$http,shairedDataService,branchList){
		console.log("this is renameBranchCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;
		
		$scope.successMessage=false;
		$scope.errorMessage=false;
		
		$scope.renameBranch=function(){ //on click of rename branch button 
			
	   		console.log($scope.newBranchName); 
	        var data=JSON.stringify($scope.selectBranch);
	   				
	   	//*********to rename selected branch******
	   			 $http({            
	   	            url: "RenameBranch/"+$scope.newBranchName,
	   	         	contentType : 'application/json; charset=utf-8',
	   	    	 	dataType : 'json',
	   	            method : "POST",
	   	            data : data       
	   	        })
	   	        .then(function successCallback(response) {
	   	                // if success   then generate classlist dropdown
	   	                
	   	                console.log("response came"); 
	   	             if(response.data.status=="success"){
	   	            	 console.log("Branch renamed Successfully");
	   	            	 $scope.successMessage=true;
	   	            	 $scope.errorMessage=false;
	   	            	 
	   	            	 $timeout(function(){
	   	            		 $state.reload();
	   	                 }, 10000);
	   	             }
	   	             else
	   	             {
	   	            	$scope.errorMessage=true;
	   	            	$scope.successMessage=false;
	   	            	 console.log("Branch Not renamed Successfully"); 
	   	             }
	   	                  
	   	        }, 
	   	    		 function errorCallback(response) {
	   	                // failed
	   	        	     $scope.errorMessage=true;
	   	        	     $scope.successMessage=false;
	   	                 console.log("error response came");    	
	   	                    
	   	        });
			};
		
	}
}())