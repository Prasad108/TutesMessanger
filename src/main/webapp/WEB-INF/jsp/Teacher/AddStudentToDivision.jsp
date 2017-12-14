<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<title>StudentManager</title>
 <jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 

    <script data-require="ui-bootstrap@*" data-semver="0.12.1" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.min.js"></script>

<style> 
		  .selectedrow {	  
		  
		    background-color:aqua;   
			}    
			
			tr:hover {
		  background-color: none;
			}
			
			tr:hover td {
			  color: blue;
					}
					
</style>
   
  <script>
  		var app = angular.module('myApp',  ['ui.bootstrap']);
  		
  		
  		
   		app.controller('studentCtrl', ['$scope', '$http', '$filter', function($scope,$http,$filter) {
   			
   			
   			$scope.branchList=JSON.parse('${branchListJSON}');
   			$scope.studentList=JSON.parse('${StudentListJSON}');
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}');  				
   			console.log("teacher is "+$scope.teacher);
   			console.log("teacher id is "+$scope.teacher["id"]); 
   		
   			
   			$scope.divisionList=[];
   			
   			$scope.selectedstudentList=[];

   			
   			$scope.StudentsMovedToDivsionSuccusfully=false;
   			
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
   			
   			
   			
//--------------- To Add Selected student to division on click button ----------------------------   			
   			$scope.AddSelectedStudentToDivision=function(){

   				$scope.StudentsMovedToDivsionSuccusfully=false;
		
			var noneSelected=true;
			 for (var i = 0; i < $scope.studentList.length; i++) {
                 if ($scope.studentList[i].Selected) {
                	 noneSelected=false;
                	 break;                  
                 }
             }
             
			if(!(noneSelected)){  // if at least one student is selected
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
               
        
   			
   }]); 
   		
   	 </script>



</head>

<body  ng-app="myApp" ng-controller="studentCtrl" >

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" /> 

<aside>
  <section id="main-content">
          <section class="wrapper">  
          		  <div class="row">
          		  
          		  <div class="panel-body" ng-show="studentList.length">
		                              <form class="form-horizontal " method="get"  > 
		                                     <div class="form-group" >
		                                      <label class="control-label col-lg-2" for="inputSuccess">Search Student</label>
		                                      <div class="col-lg-10">
		                                          <div class="row">
		                                          <div class="col-lg-3">
		                                              <input type="text" class="form-control" placeholder="search"  ng-model="student_filter" ng-change="filterStudent()">
		                                          </div>
		                                          
		                                          <div class="col-lg-2">
		                                               <button class="btn btn-primary"  id="aStudentSubmitBTN" type="submit" data-toggle="modal" href="#myModal">Add Selected Students to Division</button>
		                                               <!-- Modal -->
								                              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								                                  <div class="modal-dialog">
								                                      <div class="modal-content">
								                                          <div class="modal-header">
								                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								                                              <h4 class="modal-title"> Select Branch, Class and Division to show Students</h4>
								                                          </div>
								                                          <div class="modal-body">
								
								                                            
																					<form name="SelectDivisionForm" class="form-validate form-horizontal " id="SelectDivisionToShowStudents" >
																						<div class="form-group ">
																						
																							<label for="fullname" class="control-label col-lg-2">Select The Branch 
																							 <span class="required">*</span>
																							</label>
																							<div class="col-lg-10">
																							
																							  <select class="form-control input-lg m-bot15 " ng-model="selectBranch" ng-options="branch.name for (x,branch) in branchList" ng-change="selectedBranch()" required="required"></select>
																							</div>
																							<br></br>
																							<label for="fullname" class="control-label col-lg-2">Select The Class 
																							 <span class="required">*</span>
																							</label>
																							
																							<div class="col-lg-10">
																							  <select class="form-control input-lg m-bot15 " ng-model="selectClass" ng-options="class.name for (x,class) in classList" ng-change="selectedClass()" required="required"></select>
																					     	</div>
																					     	
																					     	<br></br>
																						
																	 					<label for="fullname" class="control-label col-lg-2">Select The Division 
																							 <span class="required">*</span>
																						</label>
																							
																							<div class="col-lg-10">
																							  <select class="form-control input-lg m-bot15 " ng-model="selectDivision" ng-options="division.name for (x,division) in divisionList" ng-change="selectedDivision()" required="required" ></select>
																							</div>
																							<br></br>
																					</div>
																						
																						  <div ng-show="SelectErrorMessage" class="alert alert-block alert-danger fade in">
																									<button data-dismiss="alert" class="close close-sm"
																										type="button">
																										<i class="icon-remove"></i>
																									</button>
																									<strong>Select Branch, Classes and Division</strong>
																						  </div>
																						  
																						<div class="form-group">
														                                          <div class="col-lg-offset-2 col-lg-10">
														                                              <button class="btn btn-primary" data-dismiss="modal" ng-click="AddSelectedStudentToDivision()" id="showStudentSubmitBTN" type="submit">Add Selected Students To Division</button>
														                     					 </div>
														                                </div>
																					</form>
																				
																				
																					
								
								                                          </div>
								                                          <div class="modal-footer">
								                                              <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
								                                              
								                                          </div>
								                                      </div>
								                                  </div>
								                              </div>
                            						  <!-- modal -->
		                                          </div>
		                                          </div>
		                                      </div>
		                                      
		                                      
		                                      <div class="col-lg-10">
		                                          <div class="row">
		                                          
		                                          <div class="alert alert-success fade in" ng-show="StudentsMovedToDivsionSuccusfully">
					                                  <button data-dismiss="alert" class="close close-sm" type="button">
					                                      <i class="icon-remove"></i>
					                                  </button>
					                                  <strong>Students Successfully moved to Division</strong> 
					                              </div>
		                                          </div>
		                                          </div> 
		                                        
		                                  </div>
		
		                              </form>
		              </div>
          		  
          		  
          		  
          		  
          		   <div class="panel-body"  ng-show="studentList.length">
				                      <table id="example" class="table  " ng-show="ShowStudentTable">
				                       <tbody>
				                          
				                              <tr>
												<th ><label ng-show="ShowSelectAll">
							                       <input type="checkbox" ng-model="IsAllChecked" ng-change="CheckUncheckAll()" /> Select All</label>
							                       <label ng-show="!ShowSelectAll">
							                       <input type="checkbox" ng-model="IsFilteredAllChecked" ng-change="filterCheckUncheckAll()" /> Select Filtered All</label>
							                    </th>
												
												<th><i class="icon_profile"></i> Full Name</th>                               
				                            	<th><i class="icon_mail_alt"></i> Email</th>                            
				                                <th><i class="icon_mobile"></i> Mobile</th>
				                               
				                              </tr>
				                              <tr ng-repeat="student in filteredTodos | filter : student_filter" ng-class="{selectedrow:student.Selected}"  >
												
												 
													<td><input  type="checkbox" ng-model="student.Selected" ng-change="CheckUncheckHeader();filteredCheckUncheckHeader()" /></td>
													<td>{{ student.fname }} {{ student.father }} {{ student.lname }}</td>
				   							 		<td>{{ student.email }}</td>
				   							 		<td>{{ student.contactno }}</td>		   						   
				  							</tr>			                                                    
				                           </tbody>
										</table>
										      <pagination  ng-show="ShowStudentTable"
											      ng-model="currentPage"
											      total-items="totallenght"
											      max-size="maxSize"  
											      boundary-links="true">
										    </pagination> 
				</div>    
				
				<div class="alert alert-block alert-danger fade in" ng-show="!studentList.length">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>There are no student who do not have Division</strong> 
                              </div>
          
        		</div>
  		</section>   
   </section> 
</aside>  
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->                    


</body>
</html>