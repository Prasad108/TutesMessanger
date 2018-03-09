(function(){
	angular.module("myApp").controller("addStudentToDivisionController",addStudentToDivisionController)
	
	addStudentToDivisionController.$inject= ['$scope', '$http', '$filter','$timeout'];
	
	function addStudentToDivisionController($scope,$http,$filter,$timeout){
		
		 console.log("********addStudentToDivisionController***********");
		 $scope.studentList=[];
		 $scope.branchList=[];
		 
		 
		// $scope.studentList=studentList;
		// $scope.branchList=branchList;
		 $http.get("TeacherRequestForApprovalListJSON") .then(function successCallback(response) {			 
			 console.log("we got response of TeacherRequestForApprovalListJSON" +response.data);
			 $scope.studentList=response.data;       	         
        }, 
      function errorCallback(response) {              
                 $scope.message=data.message;
        	 console.log(" failed to get the studentlist for approval with message : "+data.message);      
        });
		 
		 
		 $http.get("BranchListOfInstitute") .then(function successCallback(response) {			 
			 console.log("we got response of BranchListOfInstitute" +response.data);
			 $scope.branchList=response.data;       	         
        }, 
      function errorCallback(response) {              
                 $scope.message=data.message;
        	 console.log(" failed to get the BranchListOfInstitute for teacher approval with message : "+data.message);      
        });
		
			$timeout(function() { 
				
				 
			}, 2000);
		 
		 $timeout(function() { 
			
				 
			}, 2000);
		 
			 
			 
			 
		 
		
			//$scope.branchList=JSON.parse('${branchListJSON}');
			//$scope.studentList=JSON.parse('${StudentListJSON}');
			
			
			/*$scope.teacher=JSON.parse('${teacherJSON}');
			$scope.permissions=JSON.parse('${permissions}');  				
			console.log("teacher is "+$scope.teacher);
			console.log("teacher id is "+$scope.teacher["id"]); */
			
		
			
			$scope.divisionList=[];
			
			$scope.selectedstudentList=[];

			
			$scope.StudentsMovedToDivsionSuccusfully=false;
			$scope.noneSelected=false;
			$scope.ShowSelectAll=true;

			$scope.SelectErrorMessage=true;   // show error message select branch, class and Division
			
		 $scope.filteredTodos = []
  	  ,$scope.currentPage = 1
  	  ,$scope.numPerPage = 10
  	  ,$scope.maxSize = 3;

  	for (var i = 0; i < $scope.studentList.length; i++) {
			$scope.studentList[i].Selected=false;
			
   };
  	  
 
		
			
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
			} ;
			
//--------------------------------------------- For getting dynamic division on change class angular js----------------------------   			
		$scope.selectedClass=function(){

			$scope.SelectErrorMessage=true;   // show error message select branch, class and Division	
				
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
//--------------------- To get the onchange Selected devsion and to hide SelectErrorMessage ----------------------------   	
			$scope.selectedDivision=function(){
	   			
				$scope.SelectErrorMessage=false;

				console.log("division selected is :"+$scope.selectDivision.name);
	   			};

//--------------------- To check NoneSelected  ----------------------------  
	   			$scope.checkNoneSelected=function(){
	   				$scope.noneSelected=true;
	   			 for (var i = 0; i < $scope.studentList.length; i++) {
	                    if ($scope.studentList[i].Selected) {
	                   	 $scope.noneSelected=false;
	                   	 break;                  
	                    }
	                }
	   	   			};
			
			
			
//--------------- To Add Selected student to division on click button ----------------------------   			
			$scope.AddSelectedStudentToDivision=function(){

				$scope.StudentsMovedToDivsionSuccusfully=false;
				$scope.checkNoneSelected();
			
         
		if(!($scope.noneSelected)){  // if at least one student is selected
	   			if(!($scope.selectDivision === undefined || $scope.selectDivision === null))
	   	   			{
		   	   		 	for (var i = 0; i < $scope.selectedstudentList.length; i++) {
		   	   				$scope.selectedstudentList.splice(i,1);
		   	   				i--;
		                }
		                
		                for (var i = 0; i < $scope.studentList.length; i++) {
		                    if ($scope.studentList[i].Selected) {
		                    	$scope.selectedstudentList.push($scope.studentList[i]);                   
		                    }
		                }
		                var data=JSON.stringify($scope.selectedstudentList);

		   	   	        $http({
		   	   	     		url: "AddSelectedStudentToDivision/"+$scope.selectDivision.id,
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
	   	   	          			
	   	   	          				   	   	               
		   	   	        }, 
		   	   	    		 function errorCallback(response) {
		   	   	                // failed		   	   	                
		   	   	                 console.log("error response came");    				   	   	                    
		   	   	        });
	   	   			}else{ // if no division is selected
				console.log("no division is selected ");
	   	   	   		}

		}else
			{
				console.log("no student is selected");
			}

			
   				
			};
			
		    

//------------------------------- to hide student table on change division------------------------------------------  
		
 			  			  			
			$scope.CheckUncheckHeader = function () {
			
            $scope.IsAllChecked = true;
            for (var i = 0; i < $scope.studentList.length; i++) {
                if (!$scope.studentList[i].Selected) {
                    $scope.IsAllChecked = false;
                    break;
                }
            };
        };
        $scope.CheckUncheckHeader();
//----------------checkUncheckALL-------------------------------------------------------------------
        $scope.CheckUncheckAll = function () {
        	
        	
        	console.log("CheckUncheckAll :"+$scope.IsAllChecked)
        	
            for (var i = 0; i < $scope.studentList.length; i++) {
            	
                $scope.studentList[i].Selected = $scope.IsAllChecked;
            }
            for (var i = 0; i < $scope.studentList.length; i++) {
            	console.log($scope.studentList[i].Selected)
               
            }
        };
//-----------------------------------For Pagination Watch-----------------------------------------           
    	$scope.$watch('currentPage + numPerPage', function() {
   		    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
   		    , end = begin + $scope.numPerPage;
   		    console.log("begin is "+begin+" end is "+end)
   		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
   		  });
    	
//---------------------Filter Sudents by search Facility ------------------------------------------
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

    	
//----------------------------- if search is applid then for select all or disselect all Filtered ----------------------------------------        	
    	$scope.filterCheckUncheckAll=function()
    	{
    		
    		 
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
//-----------------------------To check Select Filtered All ----------------------------------------        	
    	$scope.filteredCheckUncheckHeader = function () {
    		
            $scope.IsFilteredAllChecked = true;
            for (var i = 0; i < $scope.filteredTodos.length; i++) {
                if (!$scope.filteredTodos[i].Selected) {
                    $scope.IsFilteredAllChecked = false;
                    break;
                }
            };
        };
      	
			
   		
//----------------initial setUp for Pagination-------------------------------------------------
           $scope.PaginationInitialSetup=function(){
        	   $scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
        		$scope.CheckUncheckHeader();
              	 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
       		    , end = begin + $scope.numPerPage;
       		    console.log("begin is "+begin+" end is "+end)
       		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
          			
               };
             
               $scope.PaginationInitialSetup();


               $scope.showModal=function(){

            	   console.log("before"+$scope.noneSelected);
            	   $scope.checkNoneSelected();
            	   console.log("after"+$scope.noneSelected);
                   if(!$scope.noneSelected)
                       { $('#myModal').modal({
                           show: 'true'
                       }); 
                   };
               };

               $scope.disableSuccessMessage=function(){
                   $scope.StudentsMovedToDivsionSuccusfully=false;

                   };
		
	}
}())