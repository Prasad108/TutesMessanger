 (function(){
	var app=angular.module('myApp').controller("addClassCtrl",addClassCtrl);
	addClassCtrl.$inject=['$scope','$http','shairedDataService','branchList'];
	function addClassCtrl($scope,$http,shairedDataService,branchList){
		console.log("this is addClassCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;	
		
		$scope.successMessage=false;
		$scope.errorMessage=false;
		$scope.classExistMessage=false;
		
		$scope.selectedBranch=function(){
			$scope.newClassName='';
		}
		
		$scope.addNewClass=function(){ //on click of add class button 
				
	   		console.log($scope.newClassName); 
	   		var data=JSON.stringify($scope.selectBranch);
	   				
	   	//*********to add new class in branch******
	   			 $http({            
	   	            url: "AddNewClass/"+$scope.newClassName,
	   	         	contentType : 'application/json; charset=utf-8',
	   	    	 	 dataType : 'json',
	   	             method: "POST",
	   	             data : data
	   	               
	   	        })
	   	        .then(function successCallback(response) {
	   	                // if success   then generate classlist dropdown
	   	                
	   	                console.log("response came"); 
	   	             if(response.data.status=="success"){
	   	            	 console.log("Class Added Successfully");
	   	            	 $scope.successMessage=true;
	   	            	 $scope.errorMessage=false;
	   	                 $scope.classExistMessage=false;
	   	             }
	   	             else if(response.data.status=="classExist"){
	   	      		     $scope.classExistMessage=true; 
	   	      		     $scope.successMessage=false;
   	            	     $scope.errorMessage=false;
   	            	     console.log("Class Not Added Successfully, class exist"); 
	   	             }
	   	             else
	   	             {
	   	                $scope.classExistMessage=false;
	   	            	$scope.errorMessage=true;
	   	            	$scope.successMessage=false;
	   	            	console.log("Class Not Added Successfully"); 
	   	             }
	   	                  
	   	        }, 
	   	    		 function errorCallback(response) {
	   	                // failed
	   	                 $scope.classExistMessage=false;
	   	        	     $scope.errorMessage=true;
	   	        	     $scope.successMessage=false;
	   	                 console.log("error response came");    	
	   	                    
	   	        });
			};
	}
}())