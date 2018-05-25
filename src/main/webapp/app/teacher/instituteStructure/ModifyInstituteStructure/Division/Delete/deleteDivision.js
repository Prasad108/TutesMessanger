 (function(){
	var app=angular.module('myApp').controller("deleteDivisionCtrl",deleteDivisionCtrl);
	deleteDivisionCtrl.$inject=['$scope','$http','shairedDataService','branchList'];
	function deleteDivisionCtrl($scope,$http,shairedDataService,branchList){
		console.log("this is deleteDivisionCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;
		
		$scope.divisionList=[];
        $scope.classList=[];
		
		
		//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
		$scope.selectedBranch=function(){ //on change of branch
			
		$scope.SelectErrorMessage=true;   // show error message select branch, class and Division
			
		 for( i=$scope.divisionList.length-1; i>=0; i--) {   //to clean the division list
			$scope.divisionList.splice(i,1);
    		} 
			
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
		
		
		
		//--------------------------------------------- For getting dynamic division on change class angular js----------------------------   			
				$scope.selectedClass=function(){

					$scope.SelectErrorMessage=true;   // show error message select branch, class and Division	
						
			   		console.log($scope.selectClass.name);
			   		
			   	  	//*********to get the Division list of selected class******
			   			 $http({
			   	            url: "GetDivisionListInJSON/"+$scope.selectClass.id,
			   	         	contentType : 'application/json; charset=utf-8',
			   	    	 	 dataType : 'json',
			   	            method: "GET" 
			   	               
			   	        })
			   	        .then(function successCallback(response) {
			   	                // if success   then generate divisionlist dropdown
			   	                
			   	                console.log("response came"); 
			   	            $scope.divisionList=response.data;
			   	            
			   	         for( i=$scope.divisionList.length-1; i>=0; i--) {
			   	          console.log($scope.divisionList[i].name);    	
			        		}    
			    
			   	        }, 
			   	    		 function errorCallback(response) {
			   	                // failed
			   	                
			   	                 console.log("error response came");    	
			   	                    
			   	        });
					};
		
		
	}
}())