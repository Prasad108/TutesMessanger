 (function(){
	var app=angular.module('myApp').controller("renameDivisionCtrl",renameDivisionCtrl);
	renameDivisionCtrl.$inject=['$scope','$http','shairedDataService','branchList'];
	function renameDivisionCtrl($scope,$http,shairedDataService,branchList){
		console.log("this is renameDivisionCtrl ");
		
		$scope.teacher=shairedDataService.teacher;
		$scope.permissions=shairedDataService.permissions; 
		$scope.institute=shairedDataService.institute;
		$scope.branchList=branchList;
		
		$scope.successMessage=false;
    	$scope.errorMessage=false;
        $scope.divisionExistMessage=false; 
	    $scope.sameDivisionNameMessage=false;
	    $scope.selectClassMessage=false;
	    $scope.selectBranchMessage=false;
	    $scope.selectDivisionMessage=false;
	    $scope.divisionShouldNotBlankMessage=false;
		
		$scope.divisionList=[];
        $scope.classList=[];
        
        $scope.selectedDivision=function(){
        	$scope.successMessage=false;
        	$scope.errorMessage=false;
        	$scope.divisionExistMessage=false; 
        	$scope.sameDivisionNameMessage=false;
        	$scope.selectClassMessage=false;
        	$scope.selectBranchMessage=false;
        	$scope.selectDivisionMessage=false;
        	$scope.divisionShouldNotBlankMessage=false;
        };
		
        $scope.clearMessage=function(){
            $scope.successMessage=false;
            $scope.errorMessage=false;
            $scope.divisionExistMessage=false; 
            $scope.sameDivisionNameMessage=false;
            $scope.selectClassMessage=false;
            $scope.selectBranchMessage=false;
            $scope.selectDivisionMessage=false;
            $scope.divisionShouldNotBlankMessage=false;
            };
		//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
		$scope.selectedBranch=function(){ //on change of branch
			
		$scope.successMessage=false;
	    $scope.errorMessage=false;
	    $scope.divisionExistMessage=false; 
	   	$scope.sameDivisionNameMessage=false;
	   	$scope.selectClassMessage=false;
	    $scope.selectBranchMessage=false;
	    $scope.selectDivisionMessage=false;
	    $scope.divisionShouldNotBlankMessage=false;
	   	
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
				
		$scope.selectedClass=function(){ //on change of class
              if(!!$scope.selectClass){
            	  console.log($scope.selectClass.name);
            	  $scope.successMessage=false;
             	  $scope.errorMessage=false;
                  $scope.divisionExistMessage=false; 
         	      $scope.sameDivisionNameMessage=false;
         	      $scope.selectClassMessage=false;
         	      $scope.selectBranchMessage=false;
         	      $scope.selectDivisionMessage=false;
         	      $scope.divisionShouldNotBlankMessage=false;
         	      
         	     for( i=$scope.divisionList.length-1; i>=0; i--) {   //to clean the division list
         			$scope.divisionList.splice(i,1);
             		}
			   		
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
		
		
		//--------------------------------------------- AJAX call for rename division----------------------------
		$scope.renameDivision=function(){ //on click of rename division button 
			
	   		console.log($scope.newDivisionName);
	        var division=JSON.stringify($scope.selectDivision);
	   		
	        if($scope.selectBranch === undefined || $scope.selectBranch === '' || $scope.selectBranch===null)
	        {
	          $scope.successMessage=false;
           	  $scope.errorMessage=false;
              $scope.divisionExistMessage=false; 
       	      $scope.sameDivisionNameMessage=false;
       	      $scope.selectClassMessage=false;
       	      $scope.selectBranchMessage=true;
       	      $scope.selectDivisionMessage=false;
       	      $scope.divisionShouldNotBlankMessage=false;
	        }
	        else if($scope.selectClass === undefined || $scope.selectClass === '' || $scope.selectClass===null)
	        { 
	          $scope.successMessage=false;
	          $scope.errorMessage=false;
	          $scope.divisionExistMessage=false; 
	       	  $scope.sameDivisionNameMessage=false;
	       	  $scope.selectClassMessage=true;
	       	  $scope.selectBranchMessage=false;
	       	  $scope.selectDivisionMessage=false;
	       	  $scope.divisionShouldNotBlankMessage=false;
	        }
	        else if($scope.selectDivision === undefined || $scope.selectDivision === '' || $scope.selectDivision===null)
	        { 
	          $scope.successMessage=false;
	          $scope.errorMessage=false;
	          $scope.divisionExistMessage=false; 
	       	  $scope.sameDivisionNameMessage=false;
	       	  $scope.selectClassMessage=false;
	       	  $scope.selectBranchMessage=false;
	       	  $scope.selectDivisionMessage=true;
	       	  $scope.divisionShouldNotBlankMessage=false;
	        }
	        else if($scope.newDivisionName == '' || $scope.newDivisionName === null || $scope.newDivisionName === undefined)
	        {
	         $scope.successMessage=false;
		     $scope.errorMessage=false;
		     $scope.divisionExistMessage=false; 
		 	 $scope.sameDivisionNameMessage=false;
		     $scope.selectClassMessage=false;
		     $scope.selectBranchMessage=false;
		     $scope.selectDivisionMessage=false;
		     $scope.divisionShouldNotBlankMessage=true;
	        }
	        else if($scope.selectDivision.name == $scope.newDivisionName)
	        {
	         $scope.successMessage=false;
			 $scope.errorMessage=false;
			 $scope.divisionExistMessage=false; 
			 $scope.sameDivisionNameMessage=true;
			 $scope.selectClassMessage=false;
			 $scope.selectBranchMessage=false;
			 $scope.selectDivisionMessage=false;
			 $scope.divisionShouldNotBlankMessage=false;
	        }
	        else
	        {
	      	//*********to rename selected division******
	   			 $http({            
	   	            url: "RenameDivision/"+$scope.newDivisionName+"/"+$scope.selectClass.id,
	   	         	contentType : 'application/json; charset=utf-8',
	   	    	 	dataType : 'json',
	   	            method : "POST",
	   	            data : division       
	   	        })
	   	        .then(function successCallback(response) {
	   	                // if success  
	   	                
	   	                console.log("response came"); 
	   	             if(response.data.status=="success"){
	   	            	 console.log("Division renamed Successfully");
	   	            	 $scope.successMessage=true;
	   	            	 $scope.errorMessage=false;
	   	                 $scope.divisionExistMessage=false; 
   	            	     $scope.sameDivisionNameMessage=false;
   	            	     $scope.selectClassMessage=false;
   	  			         $scope.selectBranchMessage=false;
   	  			         $scope.selectDivisionMessage=false;
   	  			         $scope.divisionShouldNotBlankMessage=false;
	   	            	 
   	            	     $scope.selectDivision.name=$scope.newDivisionName;
	   	                 
	   	                for (var i = 0; i < $scope.divisionList.length; i++) {
	   	            		if($scope.divisionList[i].id ==  $scope.selectDivision.id){
	   	            			$scope.divisionList[i]=$scope.selectDivision;
	   	            		}
		                }
	   	                 $scope.newDivisionName='';
	   	             }
	   	          else if(response.data.status=="divisionExist"){
	   	      		     $scope.divisionExistMessage=true; 
	   	      		     $scope.successMessage=false;
   	            	     $scope.errorMessage=false;
   	            	     $scope.sameDivisionNameMessage=false;
   	            	     $scope.selectClassMessage=false;
  	  			         $scope.selectBranchMessage=false;
  	  			         $scope.selectDivisionMessage=false;
  	  			         $scope.divisionShouldNotBlankMessage=false;
   	            	     console.log("Division Not renamed Successfully, division already exist with this name"); 
	   	             }
	   	             else
	   	             {
	   	            	$scope.errorMessage=true;
	   	            	$scope.successMessage=false;
	   	                $scope.divisionExistMessage=false; 
   	            	    $scope.sameDivisionNameMessage=false;
   	            	    $scope.selectClassMessage=false;
  	  			        $scope.selectBranchMessage=false;
  	  			        $scope.selectDivisionMessage=false;
  	  			        $scope.divisionShouldNotBlankMessage=false;
   	            	    console.log("Division Not renamed Successfully"); 
	   	             }
	   	                  
	   	        }, 
	   	    		 function errorCallback(response) {
	   	                // failed
	   	        	     $scope.errorMessage=true;
	   	        	     $scope.successMessage=false;
	   	        	     $scope.divisionExistMessage=false;
   	            	     $scope.sameDivisionNameMessage=false;
   	            	     $scope.selectClassMessage=false;
  	  			         $scope.selectBranchMessage=false;
  	  			         $scope.selectDivisionMessage=false;
  	  			         $scope.divisionShouldNotBlankMessage=false;
   	            	     console.log("error response came");    	
	   	                    
	   	        });
	        }
	   };			
		
	}
}())