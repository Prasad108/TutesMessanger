 (function(){
	var app=angular.module('myApp').controller("addBranchCtrl",addBranchCtrl);
	addBranchCtrl.$inject=['$scope','$http','shairedDataService','branchList'];
	function addBranchCtrl($scope,$http,shairedDataService,branchList){
		console.log("this is addBranchCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;
		
		$scope.successMessage=false;
		$scope.errorMessage=false;
		$scope.branchExistMessage=false;
	   	$scope.branchShouldNotBlankMessage=false;
	   	
	   	$scope.clearMessage=function(){
	   	$scope.successMessage=false;
		$scope.errorMessage=false;
		$scope.branchExistMessage=false;
		$scope.branchShouldNotBlankMessage=false;
	   	};
		
		$scope.addNewBranch=function(){ //on click of add branch button 
				
	   	console.log($scope.newBranchName); 
	   		
	   	if($scope.newBranchName == '' || $scope.newBranchName === null || $scope.newBranchName === undefined)
	   	{
	   	 $scope.branchShouldNotBlankMessage=true;			
	   	}
	   	else{
	   	 	//*********to add new branch in institute******
  			 $http({            
  	            url: "AddNewBranch/"+$scope.newBranchName,
  	         	contentType : 'application/json; charset=utf-8',
  	    	 	 dataType : 'json',
  	            method: "POST" 
  	               
  	        })
  	        .then(function successCallback(response) {
  	                // if success   then generate classlist dropdown
  	                
  	                console.log("response came"); 
  	             if(response.data.status=="success"){
  	            	 console.log("Branch Added Successfully");
  	            	 $scope.successMessage=true;
  	            	 $scope.errorMessage=false;
  	                 $scope.branchExistMessage=false;
  	                 $scope.branchShouldNotBlankMessage=false;
  	                 $scope.newBranchName='';
  	             }
  	             else if(response.data.status=="branchExist"){
  	      		     $scope.branchExistMessage=true; 
  	      		     $scope.successMessage=false;
	            	 $scope.errorMessage=false;
	            	 $scope.branchShouldNotBlankMessage=false;
	            	 console.log("Branch Not Added Successfully, branch exist"); 
  	             }
  	             else
  	             {
  	                 $scope.branchExistMessage=false;
  	            	 $scope.errorMessage=true;
  	            	 $scope.successMessage=false;
  	            	 $scope.branchShouldNotBlankMessage=false;
  	            	 console.log("Branch Not Added Successfully"); 
  	             }
  	                  
  	        }, 
  	    		 function errorCallback(response) {
  	                // failed
  	                 $scope.branchExistMessage=false;
  	        	     $scope.errorMessage=true;
  	        	     $scope.successMessage=false;
  	        	     $scope.branchShouldNotBlankMessage=false;
  	        	     console.log("error response came");    	
  	                    
  	        });
	   	}			
	  
			};
		
	}
}())