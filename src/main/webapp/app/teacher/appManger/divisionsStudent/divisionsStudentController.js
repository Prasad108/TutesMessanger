 (function(){
 
 	angular.module('myApp').controller('divisionsStudentController', ['$scope', '$http', '$filter','branchList', function($scope,$http,$filter,branchList) {
   		
   			$scope.branchList=branchList;
   			//$scope.teacher=JSON.parse('${teacherJSON}');
   			//$scope.permissions=JSON.parse('${permissions}');
   			
   			//console.log("teacher is "+$scope.teacher);
   			//console.log("teacher id is "+$scope.teacher["id"]);
   			
   		//--------initialise arrayt for different list-----	
   			$scope.studentList=[];
   			$scope.divisionList=[];
   			$scope.selectedstudentList=[];

   			$scope.divisionListModal=[];
   			$scope.classListModal=[];
   			
   	//--------initialise variable to show/hide some division-----
   			$scope.NoStudentInDivision=false;
   			$scope.ShowStudentTable=false;
   			$scope.ShowSelectAll=true;
   			$scope.selectStudentFirstMessage=false;
   			$scope.deleteSucessStudent=false;

   			$scope.SelectErrorMessageModal=true;
   			$scope.StudentsMovedToDivsionSuccusfully=false;
   			
   			$scope.noneSelected=false;

   			$scope.selectedstudentList=[];
   			
   		 $scope.filteredTodos = []
      	  ,$scope.currentPage = 1
      	  ,$scope.numPerPage = 10
      	  ,$scope.maxSize = 3,
      	  
      	$scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
   			
   			console.log($scope.branchList);
   		
   			
//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
   			$scope.selectedBranch=function(){ //on change of branch
   				
   				$scope.NoStudentInDivision=false; //to remove error message	
   				$scope.ShowStudentTable=false;    //do not show student table
   				
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
   			} ;
   			
//--------------------------------------------- For getting dynamic division on change class angular js----------------------------   			
			$scope.selectedClass=function(){
	
				$scope.NoStudentInDivision=false; //to remove error message	
				$scope.ShowStudentTable=false;    //do not show student table
   				
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


   		//---------------------------------------------****Modal********* For getting dynamic Classes on change branch angular js----------------------------   			
   			$scope.selectedBranchModal=function(){ //on change of branch

   				$scope.SelectErrorMessageModal=true;
   				
   			 for( i=$scope.divisionListModal.length-1; i>=0; i--)
   			        { 
   				     //to clean the division list
   				     $scope.divisionListModal.splice(i,1);
	        		} 
   				
		   		console.log($scope.selectBranchModal.name); 
		   				
		   	//*********to get the class list of selected branch******
		   			 $http({            
		   	            url: "GetClassesListInJSON/"+$scope.selectBranchModal.id,
		   	         	contentType : 'application/json; charset=utf-8',
		   	    	 	 dataType : 'json',
		   	            method: "GET"       
		   	        })
		   	        .then(function successCallback(response) {
		   	                // if success   then generate classListModal dropdown
		   	                
		   	            console.log("response came"); 
		   	            $scope.classListModal=response.data;
		   	            
		   	         	for( i=$scope.classListModal.length-1; i>=0; i--) {
		   	          		console.log($scope.classListModal[i].name);    	
		        		}       
		   	        }, 
		   	    		 function errorCallback(response) {
		   	                // failed
		   	                console.log("error response came");    	             
		   	        });
   			} ;
   			
//---------------------------------------------****Modal********* For getting dynamic division on change class angular js----------------------------   			
			$scope.selectedClassModal=function(){

				$scope.SelectErrorMessageModal=true;
   				
		   		console.log($scope.selectedClassModal.name);
		   		
		   	  	//*********to get the Division list of selected class******
		   			 $http({
		   	            url: "GetDivisionListInJSON/"+$scope.selectClassModal.id,
		   	         	contentType : 'application/json; charset=utf-8',
		   	    	 	 dataType : 'json',
		   	            method: "GET" 
		   	               
		   	        })
		   	        .then(function successCallback(response) {
		   	                // if success   then generate divisionlistModal dropdown
		   	                
		   	                console.log("response came"); 
		   	            $scope.divisionListModal=response.data;
		   	            
		   	         for( i=$scope.divisionListModal.length-1; i>=0; i--) {
		   	          console.log($scope.divisionListModal[i].name);    	
		        		}    
		    
		   	        }, 
		   	    		 function errorCallback(response) {
		   	                // failed
		   	                 console.log("error response came");    	
		   	        });
   			};
   		

 //---------------------------------------------****Modal********* on change hide error message of selec----------------------------
   			$scope.selectedDivisionModal=function(){
   	   			
   				$scope.SelectErrorMessageModal=false;
   	   			};
   	   		
//--------------------------------------------- To get Student list on click button ----------------------------   			
   			$scope.getStudent=function(){
   				$scope.NoStudentInDivision=false; //to remove error message	
   				$scope.ShowStudentTable=false;    //do not show student table
   				
	   			if (!($scope.selectDivision === undefined || $scope.selectDivision === null))	
	   			{
			   			 var data = JSON.stringify({id:$scope.selectDivision.id,name:$scope.selectDivision.name});
			   			 	
			   		//*********to get the student list of selected division ******
				   			 $http({
				   	            url: "GetStudentOfDivisionInJSON",
				   	         	contentType : 'application/json; charset=utf-8',
				   	    	 	dataType : 'json',
				   	            method: "POST" ,        
				   	            data: data
				   	               
				   	        })
				   	        .then(function successCallback(response) {
				   	                // if success   then generate student table
					   	                
					   	                console.log("response came"); 
					   	         	if(response.data.ErrorMessage)
					   	         		{
					   	         		console.log("there is error or no student in division");
					   	         			$scope.NoStudentInDivision=true;      //to add error message	
					   	         		$scope.ShowStudentTable=false;    //do not show student table
					   	         		}
					   	         	else{
					   	         	console.log("succesess students are there");
					   	             $scope.ShowStudentTable=true;    //show student table
					   	        	 $scope.studentList=response.data;	
					   	        	 
					   	             console.log($scope.studentList);
					   	   			for (var i = 0; i < $scope.studentList.length; i++) {
					   	   				$scope.studentList[i].Selected=false;
					   	            };
					   	            
					   	     	$scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
					   	    
					   	            $scope.CheckUncheckHeader();
					   	        	 for( i=$scope.studentList.length-1; i>=0; i--) {
							   	          console.log($scope.studentList[i].fname);    	
							        		} 
					   	        	 
					   	        	 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
					        		    , end = begin + $scope.numPerPage;
					        		    console.log("begin is "+begin+" end is "+end)
					        		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
					   	        	 
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
   			
  //------------------------------- to hide student table on change division------------------------------------------  
   			$scope.selectedDivision=function()
   			{
   				$scope.ShowStudentTable=false;    //do not show student table
   			};
   			
	 			  			  			
   			$scope.CheckUncheckHeader = function () {
   				$scope.selectStudentFirstMessage=false;
   				$scope.deleteSucessStudent=false;
                $scope.IsAllChecked = true;
                
                for (var i = 0; i < $scope.studentList.length; i++) {
                    if (!$scope.studentList[i].Selected) {
                        $scope.IsAllChecked = false;
                        break;
                    }
                };
            };
            $scope.CheckUncheckHeader();
 
            $scope.CheckUncheckAll = function () {
            	$scope.selectStudentFirstMessage=false;
            	$scope.deleteSucessStudent=false;
            	
            	console.log("CheckUncheckAll :"+$scope.IsAllChecked)
            	
                for (var i = 0; i < $scope.studentList.length; i++) {
                	
                    $scope.studentList[i].Selected = $scope.IsAllChecked;
                }
                for (var i = 0; i < $scope.studentList.length; i++) {
                	console.log($scope.studentList[i].Selected)
                   
                }
            };
            
        	$scope.$watch('currentPage + numPerPage', function() {
       		    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
       		    , end = begin + $scope.numPerPage;
       		    console.log("begin is "+begin+" end is "+end)
       		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
       		  });
        	
        	$scope.filterStudent=function()
        	{

        		 
        		if(($scope.student_filter.length) > 0 )
        			{
        			 $scope.ShowSelectAll=false;
        			console.log(angular.isArray($scope.studentList));
        			var searchFilter=$scope.student_filter;
        			 console.log(searchFilter);
        			 
        			 $scope.filteredTodos= $filter('filter')($scope.studentList,searchFilter);
        			 
        			 console.log($scope.filteredTodos.length);
        			 
        			 	$scope.totallenght=$scope.filteredTodos.length/$scope.numPerPage*10;
        			 	
        				$scope.filteredCheckUncheckHeader();
        			}
        		else
        			{
        		 	$scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
        			
        			 $scope.ShowSelectAll=true;
        			 
        			 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
	        		    , end = begin + $scope.numPerPage;
	        		    console.log("begin is "+begin+" end is "+end)
	        		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
        			}
        	};
        	
        	$scope.filterCheckUncheckAll=function()
        	{
        		$scope.selectStudentFirstMessage=false;
        		$scope.deleteSucessStudent=false;
        		
        		 for (var i = 0; i < $scope.filteredTodos.length; i++) {
                     			 
        			 $scope.filteredTodos[i].Selected = $scope.IsFilteredAllChecked;
        			 
        			 for(var j=0;j< $scope.studentList.length; j++)
        				 {
        				 if( $scope.filteredTodos[i] == $scope.studentList[j] )
        					 {  
        					 $scope.studentList[j].Selected = $scope.IsFilteredAllChecked;
        					 break;
        					 }
        				 }
                 }
        	};
        	
        	$scope.filteredCheckUncheckHeader = function () {
                $scope.IsFilteredAllChecked = true;
                $scope.selectStudentFirstMessage=false;
                $scope.deleteSucessStudent=false;
                
                for (var i = 0; i < $scope.filteredTodos.length; i++) {
                    if (!$scope.filteredTodos[i].Selected) {
                        $scope.IsFilteredAllChecked = false;
                        break;
                    }
                };
            };
          	
      //------------------------- delete student from division -----------------------------------      
            $scope.deleteStudentFromDivision = function () {
            	 var index =[];
            	 $scope.deleteSucessStudent=false;      //------to show student delete success message                
            	 for (var i = 0; i < $scope.studentList.length; i++) {
                     if ($scope.studentList[i].Selected) {
                         console.log($scope.studentList[i].fname);
                         index.push(i);
                         $scope.selectedstudentList.push($scope.studentList[i]);  //--------push selected student in selectedStudentList array
                     }
                 }
            	
            	 for (var i = 0; i < $scope.studentList.length; i++){
            		 for (var j = 0; j < $scope.selectedstudentList.length; j++){
            			 if( $scope.studentList[i] == $scope.selectedstudentList[j])
            				 {
            				 $scope.studentList.splice(i,1);              //remove selected student from studentList
            				 }
            		 }
            	 }
       
            	 console.log($scope.studentList);
            		 
            		 $scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
            		 
            		 var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin + $scope.numPerPage;
	        		    console.log("begin is "+begin+" end is "+end)
	        		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
            
            	 if($scope.selectedstudentList.length != 0)           //----check selectedStudentList is empty or not
            		 {
            		 $scope.deleteSucessStudent=false; 
            		 $scope.selectStudentFirstMessage=false;
            		  console.log("selectedstudentList is not empty");
            		  
              //------- http post request to delete selected student-------
                    $http({
			   	            url: "DeleteSelectedStudentFromDivision",
			   	         	contentType : 'application/json; charset=utf-8',
			   	    	 	dataType : 'json',
			   	            method: "POST" ,        
			   	            data: JSON.stringify($scope.selectedstudentList)
			   	               
			   	        })
			   	        .then(function successCallback(response) {
			   	                // if success   
			   	        	$scope.deleteSucessStudent=true; 
			   	        }, 
			   	    		 function errorCallback(response) {
			   	                // failed
			   	                $scope.deleteSucessStudent=false;
			   	                 console.log("error response came");    	           
			   	        });  
            	 }
            	 else
                 {
            	  console.log("selectedstudentList is empty");
            	  $scope.selectStudentFirstMessage=true;
            	 }
            	 
            	 $scope.selectedstudentList.splice(0, $scope.selectedstudentList.length); //-----empty selectedStudentList array
            };	 	


            $scope.showModal=function(){
        	
         	   $scope.checkNoneSelected();
       	  
                if(!$scope.selectStudentFirstMessage)
                    { $('#myModal').modal({
                        show: 'true'
                    }); 
                };
            };	 	


          //--------------------- To check NoneSelected  ----------------------------  
             	   			$scope.checkNoneSelected=function(){
             	   				$scope.selectStudentFirstMessage=true;
          		   			 for (var i = 0; i < $scope.studentList.length; i++) {
          		                    if ($scope.studentList[i].Selected) {
          		                   	 $scope.noneSelected=false;
          		                   $scope.selectStudentFirstMessage=false;
          		                   	 break;                  
          		                    }
          		                }
             	   	   			};


             	     			
             	      			
//---------------------------- To Add Selected student to other division on click button ----------------------------   			
   	   			$scope.AddSelectedStudentToDivision=function(){

   	   				$scope.StudentsMovedToDivsionSuccusfully=false;  	   	             
   				
   	   	   			
		   	   		 	/* for (var i = 0; i < $scope.selectedstudentList.length; i++) {
		   	   				$scope.selectedstudentList.splice(i,1);
		   	   				i--;
		                } */
		         $scope.selectedstudentList.splice(0,$scope.selectedstudentList.length);      
		                for (var i = 0; i < $scope.studentList.length; i++) {
		                    if ($scope.studentList[i].Selected) {
		                    	$scope.selectedstudentList.push($scope.studentList[i]);                   
		                    }
		                }
		                var data=JSON.stringify($scope.selectedstudentList);

		   	   	        $http({
		   	   	     		url: "AddSelectedStudentToDivision/"+$scope.selectDivisionModal.id,
			   	         	contentType : 'application/json; charset=utf-8',
			   	    	 	dataType : 'json',
			   	            method: "POST" ,        
			   	            data: data				   	               
			   	        })
		   	   	        .then(function successCallback(response) {
		   	   	                // if success   then generate divisionlist dropdown
		   	   	                $scope.StudentsMovedToDivsionSuccusfully=true;

	   	   	                for (var i = 0; i < $scope.studentList.length; i++) {
		   	   	                if($scope.studentList[i].Selected)
			   	   	            {
					   	   				$scope.studentList.splice(i,1);
					   	   				i--;
			   	   	             }
		                	}
	   	   	          			$scope.PaginationInitialSetup();	
	   	   	          	  $scope.selectedstudentList.splice(0,$scope.selectedstudentList.length);
	   	   	          			
	   	   	          				   	   	               
		   	   	        }, 
		   	   	    		 function errorCallback(response) {
		   	   	                // failed		   	   	                
		   	   	                 console.log("error response came");    				   	   	                    
		   	   	        });
   	   	   	   			
   	   			};
             	   	   	   			
             	   	   	   		               
   	   	      $scope.PaginationInitialSetup=function(){
            	   $scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
            		$scope.CheckUncheckHeader();
                  	 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
           		    , end = begin + $scope.numPerPage;
           		    console.log("begin is "+begin+" end is "+end)
           		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
              			
                   };

                   $scope.disableSuccessMessage=function(){
                       $scope.StudentsMovedToDivsionSuccusfully=false;

                       };
               
            
   }]); 
   		
   	
 	
 
 }())
  		   		