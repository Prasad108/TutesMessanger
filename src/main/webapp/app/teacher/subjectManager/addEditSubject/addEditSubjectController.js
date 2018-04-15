	
 
   	      var app=angular.module("myApp");
		
 		  app.controller('addEditSubjectCtrl', ['$scope', '$http', '$filter','shairedDataService', function($scope,$http,$filter,shairedDataService) {
 			    $scope.subjectOfInstituteList=[];

 			   $scope.SubjectDeleteSuccess=false;
 			   $scope.SubjectDeleteError=false;
 			   $scope.SubjectUpdateSuccess=false;
 			 
 			   	$scope.teacher=shairedDataService.teacher;
	    		$scope.permissions=shairedDataService.permissions; 
	    		$scope.institute=shairedDataService.institute;

    			 $scope.subjectOfInstituteList=[];
    			 $scope.filteredTodos = []
    	     	  ,$scope.currentPage = 1
    	     	  ,$scope.numPerPage = 10
    	     	  ,$scope.maxSize = 3,
    	     	  
    	     	   $scope.totallenght=$scope.subjectOfInstituteList.length/$scope.numPerPage*10;
    			
    			console.log("teacher is "+$scope.teacher);
    			console.log("teacher id is "+$scope.teacher["id"]);
    					 	
    			   		//*********to get the subject list of institute ******
    			   		$scope.defaultFunction=function()
    			   		{
    			   		   $scope.SubjectDeleteSuccess=false;
    		 			   $scope.SubjectDeleteError=false;
    		 			   $scope.SubjectUpdateSuccess=false;
        			   		
    				   			 $http({
    				   	            url: "GetSubjectListofInstituteInJSON/"+$scope.institute.id,
    				   	         	contentType : 'application/json; charset=utf-8',
    				   	    	 	dataType : 'json',
    				   	            method: "POST" ,               
    				   	        })
    				   	        .then(function successCallback(response) {
    				   	                // if success   then generate subject table
    					   	                
    					   	                console.log("response came"); 
    					   	         	if(response.data.ErrorMessage)
    					   	         		{
    					   	         		 console.log("there is error or no subject in division");
    					   	 	
    					   	         		 $scope.ShowSubjectTable=false;    //do not show student table
    					   	         		}
    					   	         	else{
    					   	         	console.log("succesess subjects are there");
    					   	             $scope.ShowSubjectTable=true;    //show student table
    					   	        	 $scope.subjectOfInstituteList=response.data;	
    					   	        	 
    					   	             console.log($scope.subjectOfInstituteList);
    					   	   			
    					   	        	 for( i=$scope.subjectOfInstituteList.length-1; i>=0; i--) {
    							   	          console.log($scope.subjectOfInstituteList[i].name);    	
    							        		} 

    					   	        	$scope.totallenght=$scope.subjectOfInstituteList.length/$scope.numPerPage*10;
    							   	    
   					   	        	 
   					   	        	 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
   					        		    , end = begin + $scope.numPerPage;
   					        		    console.log("begin is "+begin+" end is "+end)
   					        		    $scope.filteredTodos = $scope.subjectOfInstituteList.slice(begin, end);
    					   	        	 
    					   	         	}
    				   	        }, 
    				   	    		 function errorCallback(response) {
    				   	                // failed
    				   	                console.log("error response came");    	          
    				   	        });
    			   		};
    			   		
    			   		$scope.defaultFunction();
 			//----------------------------watch function---------------------------------------------------------------------
				$scope.$watch('currentPage + numPerPage', function() {
	       		    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
	       		    , end = begin + $scope.numPerPage;
	       		    console.log("begin is "+begin+" end is "+end)
	       		    $scope.filteredTodos = $scope.subjectOfInstituteList.slice(begin, end);
	       		  });


				//------------------------------delete subject from institute-----------------------------------------------------
		   		
		   		 $scope.deleteSubject=function(subject)
			    { 
		   		   $scope.SubjectDeleteSuccess=false;
	 			   $scope.SubjectDeleteError=false;
	 			   $scope.SubjectUpdateSuccess=false;
			      console.log("hello from delete subject from institute function console");

			   
			        $http({
			            url: "deleteSubjectFromInstitute/"+subject.id+"/"+$scope.institute.id,
			            method: "POST",          
			        })
			        .then(function successCallback(response) {

		                // if success 
			             console.log(" Subject is deleted : "+subject.id);
			        	 console.log("Subject is deleted and response recieved is :"+response.data);
			        
			            $scope.subjectOfInstituteList=response.data;	
			            console.log($scope.subjectOfInstituteList);
			        	
			        	$scope.totallenght=$scope.subjectOfInstituteList.length/$scope.numPerPage*10;
    							   	    
   					   	        	 
   					   	        	 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
   					        		    , end = begin + $scope.numPerPage;
   					        		    console.log("begin is "+begin+" end is "+end)
   					        		    $scope.filteredTodos = $scope.subjectOfInstituteList.slice(begin, end);
			        	
			        	
   					     //delete the subject from array
			        	 for( i=$scope.filteredTodos.length-1; i>=0; i--) {
			        		    if( $scope.filteredTodos[i].id ==subject.id) $scope.filteredTodos.splice(i,1);
			        		} 

			        	  $scope.SubjectDeleteSuccess=true;
			        	  $scope.SubjectDeleteError=false;
			                  
			        }, 
			      function errorCallback(response) {
			                // failed
			                 $scope.message=data.message;
			        	 console.log(" subject deletion failed and response is "+data.message);  
			        	  $scope.SubjectDeleteSuccess=false;
			        	  $scope.SubjectDeleteError=true;
			            
			        });
              };
		   		
//-----------------------add subject to institute-----------------------------------------------------------

                $scope.addSubjectToInstitute=function()
			    { 
  			    console.log($scope.subjectName);
  			    console.log($scope.subjectDescription);
  			    $scope.SubjectDeleteSuccess=false;
  			    $scope.SubjectDeleteError=false;
  			    $scope.SubjectUpdateSuccess=false;
  			
  			  $http({
		            url: "addSubjectToInstitute/"+$scope.subjectName+"/"+$scope.subjectName+"/"+$scope.institute.id,
		            method: "POST",          
		        })
		        .then(function successCallback(response) {
		        	 console.log(" Subject is added : "+$scope.subjectName);
		        	 console.log("Subject is added and response recieved is :"+response.data.message);

		        	if(response.data.status=="success"){
		                // if success 
		             $scope.defaultFunction();
		        	 $scope.addmessage=response.data.message;
		        	}  
		        	          
		        },
		        function errorCallback(response) {
		                // failed
		                 $scope.message=data.message;
		        	 console.log(" subject adding failed and response is "+data.message);    
		        });
			    };

			  //------------------------------Load Selected Subject containts in Modal Form-----------------------------------------------------------------------	   		
		   		$scope.updateSubjectLoad=function(subject)
		   		{	
		   		   $scope.SubjectDeleteSuccess=false;
	 			   $scope.SubjectDeleteError=false;
	 			   $scope.SubjectUpdateSuccess=false;
	 			     			
		   			console.log("loading form data for subject "+subject.name);
		   			$scope.idEditsubject=subject.id;
		   			$scope.nameEditsubject=subject.name;
	   				$scope.descriptionEditsubject=subject.discription;	
		   		};


		   		
		   	//------------------------------Update Subject get values from modal-----------------------------------------------------------------------	   		
		   		   		$scope.UpdateSubject=function()
		   		   		{
		   		   	     $scope.SubjectDeleteSuccess=false;
		 			     $scope.SubjectDeleteError=false;
		   			   		
		   					console.log("Update Subject");			
		   					var UpdateSubject={};	
		   		   			UpdateSubject.id=$scope.idEditsubject;
		   		   			UpdateSubject.name=$scope.nameEditsubject;
		   		   			UpdateSubject.discription=$scope.descriptionEditsubject;
		   		   			
		   		   			
		   		   			console.log(UpdateSubject);
		   		   			
		   		   		 	 var data=JSON.stringify(UpdateSubject);

		   		   		 $http({
		 		            url: "UpdateSubject/"+$scope.institute.id,
		 		           contentType : 'application/json; charset=utf-8',
	   			   	    	 dataType : 'json', 
	   			             method: "POST",    
	   			             data :data          
		 		        })
		 		        .then(function successCallback(response) {
                           //if success
		 		        	 console.log("succcess"); 
	   			         	 console.log(response.data); 
	   	                 
	   			         	for( i=$scope.filteredTodos.length-1; i>=0; i--) {
	   		  		   	         if($scope.filteredTodos[i].id ==UpdateSubject.id)  
	   		  		   	 			   $scope.filteredTodos.splice(i,1);// remove the updating subject				  		   	   
	   		  		        		}
	   			         	$scope.filteredTodos.push(response.data);// add new modfied subject 

	   			           $scope.SubjectUpdateSuccess=true;
		 		        	          
		 		        },
		 		        function errorCallback(response) {
		 		                // failed
		 		              console.log(response.data);
		 		        	 console.log(" failed to save the subject"); 
		 		        	  $scope.SubjectUpdateSuccess=false;
		 		        });
		
		   		   		};

//----------------------------filter subject list----------------------------------------------
		   		   	$scope.filterSubject=function()
		   		   	{

		   		   	if(($scope.subject_filter.length) > 0 )
        			{
        
        			var searchFilter=$scope.subject_filter;
        			 console.log(searchFilter);
        			 
        			 $scope.filteredTodos= $filter('filter')($scope.subjectOfInstituteList,searchFilter);
        			 
        			 console.log($scope.filteredTodos.length);
        			 
        			 	$scope.totallenght=$scope.filteredTodos.length/$scope.numPerPage*10;
      
        			}
        		else
        			{
        		 	$scope.totallenght=$scope.subjectOfInstituteList.length/$scope.numPerPage*10;
        			
        			 
        			 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
	        		    , end = begin + $scope.numPerPage;
	        		    console.log("begin is "+begin+" end is "+end)
	        		    $scope.filteredTodos = $scope.subjectOfInstituteList.slice(begin, end);
        			}
			   		   	
		   		   	 $scope.SubjectDeleteSuccess=false;
	 			     $scope.SubjectDeleteError=false;
	 			     $scope.SubjectUpdateSuccess=false;
			    	};
		   		
 	   		}]);

	   		
  	   	     

   		
   		
		