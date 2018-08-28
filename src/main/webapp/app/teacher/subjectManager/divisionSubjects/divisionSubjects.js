 

        var app = angular.module('myApp');
  		
   		app.controller('divisionSubjectsCtrl', ['$scope', '$http', '$filter','shairedDataService','branchList', function($scope,$http,$filter,shairedDataService,branchList) {
   			
   			$scope.branchList=branchList;
   			
   				$scope.teacher=shairedDataService.teacher;
	    		$scope.permissions=shairedDataService.permissions; 
	    		$scope.institute=shairedDataService.institute;
   			
   			console.log("teacher is "+$scope.teacher);
   			console.log("teacher id is "+$scope.teacher["id"]);
   			
   		//--------initialise arrayt for different list-----	
   			$scope.subjectList=[];
   			$scope.classList=[];
   			$scope.divisionList=[];
   			$scope.subjectNotInDivisionList=[];

   	   	   $scope.filteredTodos = []
     	  ,$scope.currentPage = 1
     	  ,$scope.numPerPage = 10
     	  ,$scope.maxSize = 3,
     	  
     	   $scope.totallenght=$scope.subjectNotInDivisionList.length/$scope.numPerPage*10;
   	
   		
   			
   	//--------initialise variable to show/hide some division-----
   			$scope.NoSubjectInDivision=false;
   			$scope.ShowSubjectTable=false;
   		    $scope.DivisionContainAllSubject=false;
   		    $scope.ShowSubjectNotInDivisionTable=false;
   	
   			console.log($scope.branchList);
   		
   			
//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
   			$scope.selectedBranch=function(){ //on change of branch
   				
   				$scope.NoSubjectInDivision=false; //to remove error message	
   				$scope.ShowSubjectTable=false;    //do not show student table
   			    $scope.DivisionContainAllSubject=false;
   			    $scope.ShowSubjectNotInDivisionTable=false;
   				
   			 for( i=$scope.divisionList.length-1; i>=0; i--)
   			        { 
   				     //to clean the division list
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
	
				$scope.NoSubjectInDivision=false; //to remove error message	
				$scope.ShowSubjectTable=false;    //do not show student table
				$scope.DivisionContainAllSubject=false;
			    $scope.ShowSubjectNotInDivisionTable=false;
   				
		   		console.log($scope.selectedClass.name);
		   		
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


 //---------------------------------------------on change division functionality--------------------------------
 
           $scope.selectedDivision=function()
           {
        	 $scope.NoSubjectInDivision=false;
      	     $scope.ShowSubjectTable=false;
      		 $scope.DivisionContainAllSubject=false;
      		 $scope.ShowSubjectNotInDivisionTable=false;
           };
 

//--------------------------------------------- To get Subject list on click button ----------------------------   			
   			$scope.getSubject=function(){
   				$scope.NoSubjectInDivision=false; //to remove error message	
   				$scope.ShowSubjectTable=false;    //do not show student table
   			    $scope.DivisionContainAllSubject=false;
   			    $scope.ShowSubjectNotInDivisionTable=false;
   				
	   			if (!($scope.selectDivision === undefined || $scope.selectDivision === null))	
	   			{
			   			 var data = JSON.stringify({id:$scope.selectDivision.id,name:$scope.selectDivision.name});
			   			 	
			   		//*********to get the subject list of selected division ******
				   			 $http({
				   	            url: "GetSubjectOfDivisionInJSON",
				   	         	contentType : 'application/json; charset=utf-8',
				   	    	 	dataType : 'json',
				   	            method: "POST" ,        
				   	            data: data
				   	               
				   	        })
				   	        .then(function successCallback(response) {
				   	                // if success   then generate subject table
					   	                
					   	                console.log("response came"); 
					   	         	if(response.data.ErrorMessage)
					   	         		{
					   	         		 console.log("there is error or no subject in division");
					   	         		 $scope.NoSubjectInDivision=true;      //to add error message	
					   	         		 $scope.ShowSubjectTable=false;    //do not show student table
					   	         		}
					   	         	else{
					   	         	console.log("succesess subjects are there");
					   	             $scope.ShowSubjectTable=true;    //show student table
					   	        	 $scope.subjectList=response.data;	
					   	        	 
					   	             console.log($scope.subjectList);
					   	   			
					   	        	 for( i=$scope.subjectList.length-1; i>=0; i--) {
							   	          console.log($scope.subjectList[i].name);    	
							        		} 
					   	        	 
					   	         	}
				   	        }, 
				   	    		 function errorCallback(response) {
				   	                // failed
				   	                console.log("error response came");    	          
				   	        });
	   				
	   				}
	   			else
	   				{
	   						console.log("division not selected");
	   				}	
   			};


   		//-------------delete subject from division function-------------------
		    $scope.deleteSubject=function(subject)
		    { 
		      $scope.DivisionContainAllSubject=false;
		      $scope.ShowSubjectNotInDivisionTable=false;
		      console.log("hello from delete subject from division function console");

		      if (!($scope.selectDivision === undefined || $scope.selectDivision === null))	
	   			{
		        $http({
		            url: "deleteSubjectFromDivision/"+subject.id+"/"+$scope.selectDivision.id,
		            method: "GET",          
		        })
		        .then(function successCallback(response) {

		        
		        	 console.log(" Subject is deleted : "+subject.id);
		        	 console.log("Subject is deleted and response recieved is :"+response.data.message);

		        	if(response.data.status=="success"){
		                // if success       	
		        	

		 			
		        	 $scope.deletemessage=response.data.message;
		        	//delete the subject from array
		        	 for( i=$scope.subjectList.length-1; i>=0; i--) {
		        		    if( $scope.subjectList[i].id ==subject.id) $scope.subjectList.splice(i,1);
		        		}  
		        	}            
		        }, 
		      function errorCallback(response) {
		                // failed
		                 $scope.message=data.message;
		        	 console.log(" subject deletion failed and response is "+data.message);      
		        });

	   			}
		      else
 				{
 						console.log("division not selected");
 				}

		    };


	 //------------------------------------- show subject not in division------------------------------------
	 
			$scope.showSubjectNotInDivision=function(){
				$scope.NoSubjectInDivision=false; //to remove error message	
   				$scope.ShowSubjectTable=false;    //do not show student table
   			    $scope.DivisionContainAllSubject=false;
   			    $scope.ShowSubjectNotInDivisionTable=false;
   				if (!($scope.selectDivision === undefined || $scope.selectDivision === null))	
	   			{
			   			 var data = JSON.stringify({id:$scope.selectDivision.id,name:$scope.selectDivision.name});
			   			 	
			   		//*********to get the subject list not in selected division ******
				   			 $http({
				   	            url: "GetSubjectNotInDivisionInJSON",
				   	         	contentType : 'application/json; charset=utf-8',
				   	    	 	dataType : 'json',
				   	            method: "POST" ,        
				   	            data: data
				   	               
				   	        })
				   	        .then(function successCallback(response) {
				   	                // if success then generate subject table
					   	                
					   	                console.log("response came"); 
					   	         	if(response.data.ErrorMessage)
					   	         		{
					   	         		 console.log("there is error or division contain all subject");
					   	         		 $scope.DivisionContainAllSubject=true;      //to add error message	
					   	         		 $scope.ShowSubjectNotInDivisionTable=false;    //do not show subject table
					   	         		}
					   	         	else{
					   	         	console.log("succesess subjects are there");
					   	            $scope.DivisionContainAllSubject=false;
					   	            $scope.ShowSubjectNotInDivisionTable=true;    //show subject table
					   	        	$scope.subjectNotInDivisionList=response.data;	
					   	        	 
					   	             console.log($scope.subjectNotInDivisionList);
					   	   			
					   	        	 for( i=$scope.subjectNotInDivisionList.length-1; i>=0; i--) {
							   	          console.log($scope.subjectNotInDivisionList[i].name);    	
							        		}

					   	        	$scope.totallenght=$scope.subjectNotInDivisionList.length/$scope.numPerPage*10;
							   	    
					   	        	 
					   	        	 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
					        		    , end = begin + $scope.numPerPage;
					        		    console.log("begin is "+begin+" end is "+end)
					        		    $scope.filteredTodos = $scope.subjectNotInDivisionList.slice(begin, end); 
					   	        	 
					   	         	}
				   	        }, 
				   	    		 function errorCallback(response) {
				   	                // failed
				   	                console.log("error response came");    	          
				   	        });
	   				
	   				}
	   			else
	   				{
	   						console.log("division not selected");
	   				}	
	
				};


//----------------------------watch function---------------------------------------------------------------------
				$scope.$watch('currentPage + numPerPage', function() {
	       		    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
	       		    , end = begin + $scope.numPerPage;
	       		    console.log("begin is "+begin+" end is "+end)
	       		    $scope.filteredTodos = $scope.subjectNotInDivisionList.slice(begin, end);
	       		  });
     

  //----------------------------------add subject to particular division-----------------------------------------

				$scope.addSubjectTodivision=function(subject)
			    { 
			      $scope.DivisionContainAllSubject=false;
			     
			      console.log("hello from add subject to division function console");

			      if (!($scope.selectDivision === undefined || $scope.selectDivision === null))	
		   			{
			        $http({
			            url: "addSubjectToDivision/"+subject.id+"/"+$scope.selectDivision.id+"/"+$scope.institute.id,
			            method: "POST",          
			        })
			        .then(function successCallback(response) {

			        
			        	 console.log(" Subject is added : "+subject.id);
			        	 console.log("Subject is added and response recieved is :"+response.data);
			                // if success       	
			        	
			             $scope.subjectNotInDivisionList=response.data;	
					   	 console.log($scope.subjectNotInDivisionList);

					     $scope.totallenght=$scope.subjectNotInDivisionList.length/$scope.numPerPage*10;

					   	  var begin = (($scope.currentPage - 1) * $scope.numPerPage)
		        		  , end = begin + $scope.numPerPage;
		        		  console.log("begin is "+begin+" end is "+end)
		        		  $scope.filteredTodos = $scope.subjectNotInDivisionList.slice(begin, end); 	
			  
			        	//delete the subject from array
			        	
			        	 for( i=$scope.filteredTodos.length-1; i>=0; i--) {
			        		    if( $scope.filteredTodos[i].id ==subject.id) $scope.filteredTodos.splice(i,1);
			        		}
	            
			        }, 
			      function errorCallback(response) {
			                // failed
			                 $scope.message=data.message;
			        	 console.log(" subject add failed and response is "+data.message);      
			        });

		   			}
			      else
	 				{
	 						console.log("division not selected");
	 				}

			    };


//-------------------------------------filter for subject-----------------------------------------------------

			    $scope.filterSubjectNotInDivision=function()
	        	{

	        		 
	        		if(($scope.subject_filter.length) > 0 )
	        			{
	        			
	        			console.log(angular.isArray($scope.subjectNotInDivisionList));
	        			var searchFilter=$scope.subject_filter;
	        			 console.log(searchFilter);
	        			 
	        			 $scope.filteredTodos= $filter('filter')($scope.subjectNotInDivisionList,searchFilter);
	        			 
	        			 console.log($scope.filteredTodos.length);
	        			 
	        			 $scope.totallenght=$scope.filteredTodos.length/$scope.numPerPage*10;
	        		
	        			 }
	        		else
	        			{
	        			$scope.totallenght=$scope.subjectNotInDivisionList.length/$scope.numPerPage*10;
	        			 
	        			 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
		        		    , end = begin + $scope.numPerPage;
		        		    console.log("begin is "+begin+" end is "+end)
		        		    $scope.filteredTodos = $scope.subjectNotInDivisionList.slice(begin, end);
	        			}
	        	};


	        	
		
   		}]);

   			
   		