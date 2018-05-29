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
		$scope.branchExistMessage=false;
		$scope.samebranchNameMessage=false;
		$scope.selectBranchMessage=false;
		$scope.branchShouldNotBlankMessage=false;
		
		$scope.selectedBranch=function(){
			$scope.selectBranchMessage=false;
			$scope.successMessage=false;
			$scope.errorMessage=false;
			$scope.branchExistMessage=false;
			$scope.samebranchNameMessage=false;
			$scope.branchShouldNotBlankMessage=false;
			$scope.newBranchName='';
		};
		
		$scope.renameBranch=function(){ //on click of rename branch button 
			
	   		console.log($scope.newBranchName); 
	        var data=JSON.stringify($scope.selectBranch);
	   		
	        if($scope.selectBranch === undefined || $scope.selectBranch === '' || $scope.selectBranch===null)
	        {
	         console.log("select valid branch");
	         $scope.selectBranchMessage=true;
	         $scope.successMessage=false;
	    	 $scope.errorMessage=false;
	    	 $scope.branchExistMessage=false;
	         $scope.samebranchNameMessage=false;
	         $scope.branchShouldNotBlankMessage=false;
	        }
	        else if($scope.selectBranch.name == $scope.newBranchName)
	        {
	        	$scope.selectBranchMessage=false;
	        	$scope.successMessage=false;
	    		$scope.errorMessage=false;
	    		$scope.branchExistMessage=false;
	        	$scope.samebranchNameMessage=true;
	        	$scope.branchShouldNotBlankMessage=false;
	        }
	        else if($scope.newBranchName == '' || $scope.newBranchName === null || $scope.newBranchName === undefined)
	        {
	        	$scope.successMessage=false;
	    		$scope.errorMessage=false;
	    		$scope.branchExistMessage=false;
	        	$scope.samebranchNameMessage=false;
	        	$scope.selectBranchMessage=false;
	            $scope.branchShouldNotBlankMessage=true;
	        }
	        else
	        {
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
	   	                 $scope.branchExistMessage=false;
	   	                 $scope.samebranchNameMessage=false;
	   	                 $scope.selectBranchMessage=false;
	   	                 $scope.branchShouldNotBlankMessage=false;
	   	                
	   	                 $scope.selectBranch.name=$scope.newBranchName;
	   	                 
	   	                for (var i = 0; i < $scope.branchList.length; i++) {
	   	            		if($scope.branchList[i].id ==  $scope.selectBranch.id){
	   	            			$scope.branchList[i]=$scope.selectBranch;
	   	            		}
		                }
	   	                 $scope.newBranchName='';
	   	             }
	   	             else if(response.data.status=="branchExist"){
	   	      		     $scope.branchExistMessage=true; 
	   	      		     $scope.successMessage=false;
   	            	     $scope.errorMessage=false;
   	            	     $scope.samebranchNameMessage=false;
   	            	     $scope.selectBranchMessage=false;
   	            	     $scope.branchShouldNotBlankMessage=false;
   	            	     console.log("Branch Not renamed Successfully, branch already exist with this name"); 
	   	             }
	   	             else
	   	             {
	   	                $scope.branchExistMessage=false;
	   	            	$scope.errorMessage=true;
	   	            	$scope.successMessage=false;
	   	            	$scope.samebranchNameMessage=false;
	   	                $scope.selectBranchMessage=false;
	   	            	$scope.branchShouldNotBlankMessage=false;
	   	            	console.log("Branch Not renamed Successfully"); 
	   	             }
	   	                  
	   	        }, 
	   	    		 function errorCallback(response) {
	   	                // failed
	   	        	     $scope.errorMessage=true;
	   	        	     $scope.successMessage=false;
	   	        	     $scope.samebranchNameMessage=false;
	   	        	     $scope.branchExistMessage=false;
	   	        	     $scope.selectBranchMessage=false;
	   	        	     $scope.branchShouldNotBlankMessage=false;
	   	        	     console.log("error response came");    	
	   	                    
	   	        });
	        }
			};
		
	}
}())