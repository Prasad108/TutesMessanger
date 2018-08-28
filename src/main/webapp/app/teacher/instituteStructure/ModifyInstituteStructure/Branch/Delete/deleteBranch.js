 (function(){
	var app=angular.module('myApp').controller("deleteBranchCtrl",deleteBranchCtrl);
	deleteBranchCtrl.$inject=['$scope','$state','$timeout','$http','shairedDataService','branchList'];
	function deleteBranchCtrl($scope,$state,$timeout,$http,shairedDataService,branchList){
		console.log("this is deleteBranchCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;
		
		$scope.successMessage=false;
		$scope.errorMessage=false;
		
		$scope.selectedBranch=function(){
			$scope.successMessage=false;
			$scope.errorMessage=false;	
			$scope.selectBranchMessage=false;
		};
		
		$scope.deleteBranch=function(){ //on click of delete branch button 
				
	   		console.log($scope.selectBranch); 
	   		var data = JSON.stringify($scope.selectBranch);
	   				
	   		if($scope.selectBranch === undefined || $scope.selectBranch === '' || $scope.selectBranch === null)
	   		{
	   			$scope.selectBranchMessage=true;
	   			$scope.successMessage=false;
	   			$scope.errorMessage=false;
	   		}
	   		else
	   	    {
	   	     //*********to delete branch from institute******
	   			 $http({            
	   	            url: "DeleteBranch",
	   	         	contentType : 'application/json; charset=utf-8',
	   	    	 	 dataType : 'json',
	   	            method: "POST",
	   	            data : data
	   	               
	   	        })
	   	        .then(function successCallback(response) {
	   	                // if success
	   	                
	   	                console.log("response came"); 
	   	             if(response.data.status=="success"){
	   	            	 console.log("Branch deleted Successfully");
	   	            	 $scope.successMessage=true;
	   	            	 $scope.errorMessage=false;
	   	            	 $scope.selectBranchMessage=false;
	   	            	 
	   	            	for (var i = 0; i < $scope.branchList.length; i++) {
	   	            		if($scope.branchList[i].id ==  $scope.selectBranch.id){
	   	            			$scope.branchList.splice(i,1);
	   	            			break;
	   	            		}
		                }
		                $scope.selectBranch={};
		                
		                $scope.selectBranch=undefined;
	   	             }
	   	             else
	   	             {
	   	            	$scope.errorMessage=true;
	   	            	$scope.successMessage=false;
	   	            	$scope.selectBranchMessage=false;
	   	            	console.log("Branch Not deleted Successfully"); 
	   	             }
	   	                  
	   	        }, 
	   	    		 function errorCallback(response) {
	   	                // failed
	   	        	     $scope.errorMessage=true;
	   	        	     $scope.successMessage=false;
	   	        	     $scope.selectBranchMessage=false;
	   	                 console.log("error response came");    	
	   	                    
	   	        });
	   	    }
			};
		
	}
}())