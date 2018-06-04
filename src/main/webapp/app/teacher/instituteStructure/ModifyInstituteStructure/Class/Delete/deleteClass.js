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
		$scope.selectClassMessage=false;
        $scope.selectBranchMessage=false;
		
		$scope.classList=[];
			
		$scope.selectedClass=function(){
			$scope.successMessage=false;
			$scope.errorMessage=false;
			$scope.selectClassMessage=false;
	        $scope.selectBranchMessage=false;
		};
			
			//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
			$scope.selectedBranch=function(){ //on change of branch
			
				$scope.successMessage=false;
				$scope.errorMessage=false;
				$scope.selectClassMessage=false;
		        $scope.selectBranchMessage=false;
		        
	   		    console.log($scope.selectBranch.name); 
	   		    
	   		    for( i=$scope.classList.length-1; i>=0; i--) {   //to clean the class list
					$scope.classList.splice(i,1);
		    		} 
	   				
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
		   		
		   	   if($scope.selectBranch === undefined || $scope.selectBranch === '' || $scope.selectBranch===null)
		        {
		         $scope.selectBranchMessage=true;
	        	 $scope.successMessage=false;
	        	 $scope.errorMessage=false;
	             $scope.selectClassMessage=false;
		        }
		        else if($scope.selectClass === undefined || $scope.selectClass === '' || $scope.selectClass===null)
		        { 
		         $scope.selectClassMessage=true;
		         $scope.selectBranchMessage=false;
		     	 $scope.successMessage=false;
		       	 $scope.errorMessage=false;
		        }
		        else
		        {
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
		   	            	 $scope.selectClassMessage=false;
		   	                 $scope.selectBranchMessage=false;
		   	            	 
		   	          	for (var i = 0; i < $scope.classList.length; i++) {
	   	            		if($scope.classList[i].id ==  $scope.selectClass.id){
	   	            			$scope.classList.splice(i,1);
	   	            			break;
	   	            		}
		                }
		                $scope.selectClass={};
		                $scope.selectClass=undefined;
		   	            	
		   	             }
		   	             else
		   	             {
		   	            	$scope.errorMessage=true;
		   	            	$scope.successMessage=false;
		   	            	$scope.selectClassMessage=false;
		   	                $scope.selectBranchMessage=false; 
		   	            	console.log("Class Not deleted Successfully"); 
		   	             }
		   	                  
		   	        }, 
		   	    		 function errorCallback(response) {
		   	                // failed
		   	        	     $scope.errorMessage=true;
		   	        	     $scope.successMessage=false;
		   	        	     $scope.selectClassMessage=false;
		   	                 $scope.selectBranchMessage=false;
		   	        	     console.log("error response came");    	
		   	             });
		        }		
		 };
	}
}())