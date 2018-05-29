 (function(){
	var app=angular.module('myApp').controller("deleteDivisionCtrl",deleteDivisionCtrl);
	deleteDivisionCtrl.$inject=['$scope','$http','shairedDataService','branchList'];
	function deleteDivisionCtrl($scope,$http,shairedDataService,branchList){
		console.log("this is deleteDivisionCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;
		
		$scope.successMessage=false;
		$scope.errorMessage=false;
		$scope.selectClassMessage=false;
        $scope.selectBranchMessage=false;
        $scope.selectDivisionMessage=false;
		
		$scope.divisionList=[];
        $scope.classList=[];
        
        $scope.selectedDivision=function(){
        	$scope.successMessage=false;
    		$scope.errorMessage=false;
    		$scope.selectClassMessage=false;
            $scope.selectBranchMessage=false;
            $scope.selectDivisionMessage=false;
		};
		
		//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
		$scope.selectedBranch=function(){ //on change of branch
			
		$scope.successMessage=false;
		$scope.errorMessage=false;
		$scope.selectClassMessage=false;
        $scope.selectBranchMessage=false;
        $scope.selectDivisionMessage=false;
			
		 for( i=$scope.divisionList.length-1; i>=0; i--) {   //to clean the division list
			$scope.divisionList.splice(i,1);
    		} 
			
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
		
		
		
		//--------------------------------------------- For getting dynamic division on change class angular js----------------------------   			
				$scope.selectedClass=function(){

					$scope.successMessage=false;
					$scope.errorMessage=false;
					$scope.selectClassMessage=false;
			        $scope.selectBranchMessage=false;
			        $scope.selectDivisionMessage=false;
					
					if(!!$scope.selectClass){	
						
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
					
					}
					};
		
					
					//--------------------------------------------- For delete division from Class---------------------------- 
								$scope.deleteDivision=function(){ //on click of delete division button 
										
							   		console.log($scope.selectDivision); 
							   		var data = JSON.stringify($scope.selectDivision);
							   		
							   		if($scope.selectBranch === undefined || $scope.selectBranch === '' || $scope.selectBranch===null)
							        {
							   			$scope.successMessage=false;
							   			$scope.errorMessage=false;
							   			$scope.selectClassMessage=false;
							   	        $scope.selectBranchMessage=true;
							   	        $scope.selectDivisionMessage=false;
							        }
							        else if($scope.selectClass === undefined || $scope.selectClass === '' || $scope.selectClass===null)
							        { 
							        	$scope.successMessage=false;
							    		$scope.errorMessage=false;
							    		$scope.selectClassMessage=true;
							            $scope.selectBranchMessage=false;
							            $scope.selectDivisionMessage=false;
							        }
							        else if($scope.selectDivision === undefined || $scope.selectDivision === '' || $scope.selectDivision===null)
							        { 
							        	$scope.successMessage=false;
							    		$scope.errorMessage=false;
							    		$scope.selectClassMessage=false;
							            $scope.selectBranchMessage=false;
							            $scope.selectDivisionMessage=true;
							        }
							        else
							        {
							   	     //*********to delete division from class******
							   			 $http({            
							   	            url: "DeleteDivision",
							   	         	contentType : 'application/json; charset=utf-8',
							   	    	 	 dataType : 'json',
							   	            method: "POST",
							   	            data : data
							   	               
							   	        })
							   	        .then(function successCallback(response) {
							   	                // if success  
							   	                
							   	                console.log("response came"); 
							   	             if(response.data.status=="success"){
							   	            	 console.log("Division deleted Successfully");
							   	            	 $scope.successMessage=true;
							   	            	 $scope.errorMessage=false;
							   	            	 $scope.selectClassMessage=false;
									             $scope.selectBranchMessage=false;
									             $scope.selectDivisionMessage=false;
							   	            	 
							   	          	for (var i = 0; i < $scope.divisionList.length; i++) {
						   	            		if($scope.divisionList[i].id ==  $scope.selectDivision.id){
						   	            			$scope.divisionList.splice(i,1);
						   	            			break;
						   	            		}
							                }
							                $scope.selectDivision={};
							                $scope.selectDivision=undefined;	
							   	             }
							   	             else
							   	             {
							   	            	$scope.errorMessage=true;
							   	            	$scope.successMessage=false;
							   	            	$scope.selectClassMessage=false;
									            $scope.selectBranchMessage=false;
									            $scope.selectDivisionMessage=false;
							   	            	console.log("Division Not deleted Successfully"); 
							   	             }
							   	                  
							   	        }, 
							   	    		 function errorCallback(response) {
							   	                // failed
							   	        	     $scope.errorMessage=true;
							   	        	     $scope.successMessage=false;
							   	        	     $scope.selectClassMessage=false;
									             $scope.selectBranchMessage=false;
									             $scope.selectDivisionMessage=false;
							   	        	     console.log("error response came");    	
							   	        });
							     }			
						};
		 }
}())