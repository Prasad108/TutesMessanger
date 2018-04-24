(function(){
	
	angular.module("myApp").component("tmPagination",{
		 templateUrl: '../app/components/pagination/pagination.html',
		
		 controller: function() {
			 
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
	})
}())