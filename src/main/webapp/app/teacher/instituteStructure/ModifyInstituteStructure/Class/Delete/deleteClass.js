 (function(){
	var app=angular.module('myApp').controller("deleteClassCtrl",deleteClassCtrl);
	deleteClassCtrl.$inject=['$scope','$state','$timeout','$http','shairedDataService','branchList'];
	function deleteClassCtrl($scope,$state,$timeout,$http,shairedDataService,branchList){
		console.log("this is deleteClassCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;
		
		$scope.successMessage=false;
		$scope.errorMessage=false;
		
		$scope.classList=[];
			
			
			//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
			$scope.selectedBranch=function(){ //on change of branch
				
			$scope.SelectErrorMessage=true;   // show error message select branch, class and Division 
				
	   		console.log($scope.selectBranch.name); 
	   				
	   	//*********to get the class list of selected branch******
	   			 $http({            
	   	            url: "GetClassesListInJSON/"+$scope.selectBranch.id,
	   	         	contentType : 'application/json; charset=utf-8',
	   	    	 	 dataType : 'json',
	   	            method: "GET" 
	   	               
	   	        })
	   	        .then(function successCallback(response) {
	   	                // if success   then generate classlist dropdown
	   	                
	   	                console.log("response came"); 
	   	            $scope.classList=response.data;
	   	            
	   	         for( i=$scope.classList.length-1; i>=0; i--) {
	   	          console.log($scope.classList[i].name);    	
	        		}       
	   	        }, 
	   	    		 function errorCallback(response) {
	   	                // failed
	   	                
	   	                 console.log("error response came");    	
	   	                    
	   	        });
			};
			
			
//--------------------------------------------- For delete class from Branch---------------------------- 
			$scope.deleteClass=function(){ //on click of delete class button 
					
		   		console.log($scope.selectClass); 
		   		var data = JSON.stringify($scope.selectClass);
		   				
		   	//*********to delete class from branch******
		   			 $http({            
		   	            url: "DeleteClass",
		   	         	contentType : 'application/json; charset=utf-8',
		   	    	 	 dataType : 'json',
		   	            method: "POST",
		   	            data : data
		   	               
		   	        })
		   	        .then(function successCallback(response) {
		   	                // if success  
		   	                
		   	                console.log("response came"); 
		   	             if(response.data.status=="success"){
		   	            	 console.log("Class deleted Successfully");
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
		   	            	 console.log("Class Not deleted Successfully"); 
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