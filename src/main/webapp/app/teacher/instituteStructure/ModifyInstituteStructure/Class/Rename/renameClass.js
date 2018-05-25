 (function(){
	var app=angular.module('myApp').controller("renameClassCtrl",renameClassCtrl);
	renameClassCtrl.$inject=['$scope','$http','$state','$timeout','shairedDataService','branchList'];
	function renameClassCtrl($scope,$http,$state,$timeout,shairedDataService,branchList){
		console.log("this is renameClassCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;
		
		$scope.successMessage=false;
		$scope.errorMessage=false;
		
		/* $scope.divisionList=[];*/
		 $scope.classList=[];
			
			
			//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
			$scope.selectedBranch=function(){ //on change of branch
				
			$scope.SelectErrorMessage=true;   // show error message select branch, class and Division
				
			/* for( i=$scope.divisionList.length-1; i>=0; i--) {   //to clean the division list
				$scope.divisionList.splice(i,1);
	    		} */
				
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
			
			//--------------------------------------------- AJAX call for rename class----------------------------
			$scope.renameClass=function(){ //on click of rename class button 
				
		   		console.log($scope.newClassName);
		        var classes=JSON.stringify($scope.selectClass);
		   				
		   	//*********to rename selected class******
		   			 $http({            
		   	            url: "RenameClass/"+$scope.newClassName+"/"+$scope.selectBranch.id,
		   	         	contentType : 'application/json; charset=utf-8',
		   	    	 	dataType : 'json',
		   	            method : "POST",
		   	            data : classes       
		   	        })
		   	        .then(function successCallback(response) {
		   	                // if success   then generate classlist dropdown
		   	                
		   	                console.log("response came"); 
		   	             if(response.data.status=="success"){
		   	            	 console.log("Class renamed Successfully");
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
		   	            	 console.log("Class Not renamed Successfully"); 
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