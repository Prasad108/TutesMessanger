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
		$scope.classExistMessage=false;
  	    $scope.sameClassNameMessage=false;
  	    $scope.selectClassMessage=false;
        $scope.selectBranchMessage=false;
        $scope.classShouldNotBlankMessage=false;
        
		$scope.classList=[];
			
		
		$scope.selectedClass=function(){
			$scope.successMessage=false;
			$scope.errorMessage=false;
			$scope.classExistMessage=false;
	  	    $scope.sameClassNameMessage=false;
	  	    $scope.selectClassMessage=false;
	        $scope.selectBranchMessage=false;
	        $scope.classShouldNotBlankMessage=false;
		};
		
		$scope.clearMessage=function(){
			$scope.successMessage=false;
			$scope.errorMessage=false;
			$scope.classExistMessage=false;
	  	    $scope.sameClassNameMessage=false;
	  	    $scope.selectClassMessage=false;
	        $scope.selectBranchMessage=false;
	        $scope.classShouldNotBlankMessage=false;
		};
			
//-----------------------------------------For getting dynamic Classes on change branch angular js----------------------------   			
			$scope.selectedBranch=function(){ //on change of branch
				
	   		console.log($scope.selectBranch.name); 
	   	    $scope.successMessage=false;
       	    $scope.errorMessage=false;
            $scope.classExistMessage=false; 
   	        $scope.sameClassNameMessage=false;
   	  	    $scope.selectClassMessage=false;
   	        $scope.selectBranchMessage=false;
   	        $scope.classShouldNotBlankMessage=false;
	   				 
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
		   		
		        if($scope.selectBranch === undefined || $scope.selectBranch === '' || $scope.selectBranch===null)
		        {
		         $scope.selectBranchMessage=true;
		         $scope.sameClassNameMessage=false;
	        	 $scope.successMessage=false;
	        	 $scope.errorMessage=false;
	             $scope.classExistMessage=false;
	             $scope.selectClassMessage=false;
	             $scope.classShouldNotBlankMessage=false;
		        }
		        else if($scope.selectClass === undefined || $scope.selectClass === '' || $scope.selectClass===null)
		        { 
		         $scope.selectClassMessage=true;
		         $scope.selectBranchMessage=false;
			     $scope.sameClassNameMessage=false;
		     	 $scope.successMessage=false;
		       	 $scope.errorMessage=false;
	             $scope.classExistMessage=false;
	             $scope.classShouldNotBlankMessage=false;
		        }
		        else if($scope.newClassName == '' || $scope.newClassName === null || $scope.newClassName === undefined)
		        {
		        $scope.classShouldNotBlankMessage=true;
		        $scope.selectClassMessage=false;
			    $scope.selectBranchMessage=false;
			    $scope.sameClassNameMessage=false;
			    $scope.successMessage=false;
			    $scope.errorMessage=false;
		        $scope.classExistMessage=false;
		        }
		        else if($scope.selectClass.name == $scope.newClassName)
		        {
		        $scope.sameClassNameMessage=true;
		     	$scope.successMessage=false;
		      	$scope.errorMessage=false;
		        $scope.classExistMessage=false;
		        $scope.selectClassMessage=false;
		        $scope.selectBranchMessage=false;
		        $scope.classShouldNotBlankMessage=false;
		        }
		        else
		        {
		      	//*********to rename selected class******
		   			 $http({            
		   	            url: "RenameClass/"+$scope.newClassName+"/"+$scope.selectBranch.id,
		   	         	contentType : 'application/json; charset=utf-8',
		   	    	 	dataType : 'json',
		   	            method : "POST",
		   	            data : classes       
		   	        })
		   	        .then(function successCallback(response) {
		   	                // if success  
		   	                
		   	                console.log("response came"); 
		   	             if(response.data.status=="success"){
		   	            	 console.log("Class renamed Successfully");
		   	            	 $scope.successMessage=true;
		   	            	 $scope.errorMessage=false;
		   	                 $scope.classExistMessage=false; 
	   	            	     $scope.sameClassNameMessage=false;
	   	            	     $scope.selectClassMessage=false;
	   			             $scope.selectBranchMessage=false;
	   			             $scope.classShouldNotBlankMessage=false;
	   			        
	   	            	     $scope.selectClass.name=$scope.newClassName;
		   	                 
		   	                 for (var i = 0; i < $scope.classList.length; i++) {
		   	            		if($scope.classList[i].id ==  $scope.selectClass.id){
		   	            			$scope.classList[i]=$scope.selectClass;
		   	            		}
			                }
		   	                 $scope.newClassName='';
		   	             }
		   	          else if(response.data.status=="classExist"){
		   	      		     $scope.classExistMessage=true; 
		   	      		     $scope.successMessage=false;
	   	            	     $scope.errorMessage=false;
	   	            	     $scope.sameClassNameMessage=false;
	   	            	     $scope.selectClassMessage=false;
	   			             $scope.selectBranchMessage=false;
	   			             $scope.classShouldNotBlankMessage=false;
	   	            	     console.log("Class Not renamed Successfully, class already exist with this name"); 
		   	             }
		   	             else
		   	             {
		   	            	$scope.errorMessage=true;
		   	            	$scope.successMessage=false;
		   	                $scope.classExistMessage=false; 
	   	            	    $scope.sameClassNameMessage=false;
	   	            	    $scope.selectClassMessage=false;
	   			            $scope.selectBranchMessage=false;
	   			            $scope.classShouldNotBlankMessage=false;
	   	            	    console.log("Class Not renamed Successfully"); 
		   	             }
		   	                  
		   	        }, 
		   	    		 function errorCallback(response) {
		   	                // failed
		   	        	     $scope.errorMessage=true;
		   	        	     $scope.successMessage=false;
		   	        	     $scope.classExistMessage=false;
	   	            	     $scope.sameClassNameMessage=false;
	   	            	     $scope.selectClassMessage=false;
	   			             $scope.selectBranchMessage=false;
	   			             $scope.classShouldNotBlankMessage=false;
	   	            	     console.log("error response came");    	
		   	                    
		   	        });
		        }
		  };			
	}
}())