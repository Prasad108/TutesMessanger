 (function(){
	var app=angular.module('myApp').controller("addDivisionCtrl",addDivisionCtrl);
	addDivisionCtrl.$inject=['$scope','$http','shairedDataService','branchList'];
	function addDivisionCtrl($scope,$http,shairedDataService,branchList){
		console.log("this is addDivisionCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;
		
		$scope.divisionExistMessage=false;
   	    $scope.errorMessage=false;
   	    $scope.successMessage=false;
   	    $scope.selectBranchMessage=false;
   	    $scope.selectClassMessage=false;
		$scope.divisionShouldNotBlankMessage=false;
		
        $scope.divisionList=[];
        $scope.classList=[];
        
    	$scope.clearMessage=function(){
			$scope.successMessage=false;
			$scope.errorMessage=false;
			$scope.divisionExistMessage=false;
			$scope.selectBranchMessage=false;
			$scope.divisionShouldNotBlankMessage=false;
			$scope.selectClassMessage=false;
		   	};
		
		$scope.selectedClass=function(){
			$scope.successMessage=false;
			$scope.errorMessage=false;
			$scope.divisionExistMessage=false;
			$scope.selectBranchMessage=false;
			$scope.divisionShouldNotBlankMessage=false;
			$scope.selectClassMessage=false;
			$scope.newDivisionName='';
		}
		
		
		//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
		$scope.selectedBranch=function(){ //on change of branch
			
		 $scope.divisionExistMessage=false;
       	 $scope.errorMessage=false;
       	 $scope.successMessage=false;
         $scope.selectBranchMessage=false;
   	     $scope.selectClassMessage=false;
		 $scope.divisionShouldNotBlankMessage=false;
       	 
		 for( i=$scope.classList.length-1; i>=0; i--) {   //to clean the class list
			$scope.classList.splice(i,1);
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
		
	//---------To add new division in class---------------------------	
		$scope.addNewDivision=function(){ //on click of add division button 
			
	   		console.log($scope.newDivisionName); 
	   		var data=JSON.stringify($scope.selectClass);
	   		   
	   		
	   		if($scope.selectBranch === undefined || $scope.selectBranch === '' || $scope.selectBranch === null)
	   		{
	   			$scope.selectBranchMessage=true;
	   			$scope.successMessage=false;
	   			$scope.errorMessage=false;
	   			$scope.divisionExistMessage=false;
	   			$scope.selectClassMessage=false;
	   			$scope.divisionShouldNotBlankMessage=false;
	   		}
	   		else if($scope.selectClass === undefined || $scope.selectClass === '' || $scope.selectClass === null)
	   		{
	   			$scope.selectBranchMessage=false;
	   			$scope.successMessage=false;
	   			$scope.errorMessage=false;
	   			$scope.divisionExistMessage=false;
	   			$scope.selectClassMessage=true;
	   			$scope.divisionShouldNotBlankMessage=false;
	   		}
	   		else if($scope.newDivisionName == '' || $scope.newDivisionName === null || $scope.newDivisionName === undefined)
	   		{
	   			$scope.divisionShouldNotBlankMessage=true;
	   			$scope.selectBranchMessage=false;
	   			$scope.selectClassMessage=false;
	   			$scope.successMessage=false;
	   			$scope.errorMessage=false;
	   			$scope.divisionExistMessage=false;
	   		}
	   		else
	   		{
	         	//*********to add new division in class******
	   			 $http({            
	   	            url: "AddNewDivision/"+$scope.newDivisionName,
	   	         	contentType : 'application/json; charset=utf-8',
	   	    	 	 dataType : 'json',
	   	             method: "POST",
	   	             data : data
	   	               
	   	        })
	   	        .then(function successCallback(response) {
	   	                // if success   
	   	                
	   	                console.log("response came"); 
	   	             if(response.data.status=="success"){
	   	            	 console.log("Division Added Successfully");
	   	            	 $scope.successMessage=true;
	   	            	 $scope.errorMessage=false;
	   	                 $scope.divisionExistMessage=false;
	   	                 $scope.selectBranchMessage=false;
	   	      	         $scope.selectClassMessage=false;
	   	   		         $scope.divisionShouldNotBlankMessage=false
	   	                 $scope.newDivisionName='';
	   	             }
	   	             else if(response.data.status=="divisionExist"){
	   	      		     $scope.divisionExistMessage=true; 
	   	      		     $scope.successMessage=false;
   	            	     $scope.errorMessage=false;
   	            	     $scope.selectBranchMessage=false;
   	          	         $scope.selectClassMessage=false;
   	       		         $scope.divisionShouldNotBlankMessage=false
   	            	     console.log("Division Not Added Successfully, division exist"); 
	   	             }
	   	             else
	   	             {
	   	                $scope.divisionExistMessage=false;
	   	            	$scope.errorMessage=true;
	   	            	$scope.successMessage=false;
	   	                $scope.selectBranchMessage=false;
	   	     	        $scope.selectClassMessage=false;
	   	  		        $scope.divisionShouldNotBlankMessage=false
	   	            	console.log("Division Not Added Successfully"); 
	   	             }
	   	                  
	   	        }, 
	   	    		 function errorCallback(response) {
	   	                // failed
	   	                 $scope.divisionExistMessage=false;
	   	        	     $scope.errorMessage=true;
	   	        	     $scope.successMessage=false;
	   	        	     $scope.selectBranchMessage=false;
	   	      	         $scope.selectClassMessage=false;
	   	   		         $scope.divisionShouldNotBlankMessage=false
	   	        	     console.log("error response came");    	
	   	                    
	   	        });
	   		}	
	   	};
	}
}())