<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="subjectCtrl" >
	<head>
 		<title>Teacher </title>
 		
 		
 		
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />
   		<%-- <jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />  --%>
   		
   		
   	    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 
        <script data-require="ui-bootstrap@*" data-semver="0.12.1" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.min.js"></script>
   		 
   		
   		<script>
   	      var app = angular.module('myApp',['ui.bootstrap']);
		
 		  app.controller('subjectCtrl', ['$scope', '$http', '$filter', function($scope,$http,$filter) {
 			    $scope.subjectOfInstituteList=[];

 			   $scope.SubjectDeleteSuccess=false;
 			   $scope.SubjectDeleteError=false;
 			   $scope.SubjectUpdateSuccess=false;
 			 
    			 $scope.teacher=JSON.parse('${teacherJSON}');
    			$scope.permissions=JSON.parse('${permissions}'); 
    			$scope.institute=JSON.parse('${institute}');

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

	   		
  	   	     

   		</script> 
   		
		
		
   	</head>
<body ng-cloak class="ng-cloak">

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" />  
<!-- <div ng-include="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp"></div> -->

 <section id="main-content">
          <section class="wrapper">
             <div class="row">
               <div class="col-lg-12"> 
               
                <!-- -----------------------------  Start :  Add subject to Institute  ---------------------------------->  
                <div><h2>Add</h2></div>
                   <section class="panel">
                      <div class="panel-group m-bot20" id="accordion">
                          <div class="panel panel-primary">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                          Add Subject to Institute <span class="menu-arrow arrow_carrot-down"></span>
                                      </a>
                                  </h4>
                              </div>
                              <div id="collapseOne" class="panel-collapse collapse">
                                  <div class="panel-body">
			                                  
			                          
			                                      <form name="AddSubjectForm" class="form-validate form-horizontal">
			                                  
					                                      <div class="form-group ">
					                                          <label for="cname" class="control-label col-lg-2">New Subject Name <span class="required">*</span></label>
					                                          <div class="col-lg-10">
					                                              <input class="form-control" ng-model="subjectName"  maxlength="50" type="text" required="required" />
					                                          </div>
					                                          <br></br>
					                                          <label for="cname" class="control-label col-lg-2">Subject Description<span class="required">*</span></label>
					                                          <div class="col-lg-10">
					                                              <input class="form-control" ng-model="subjectDescription" maxlength="500" type="text" required="required" />
					                                          </div>
					                                      </div>
					                                      
					                                      <div ng-show="!AddSubjectForm.$valid" class="alert alert-block alert-danger fade in">
														      <button data-dismiss="alert" class="close close-sm" type="button">
															    <i class="icon-remove"></i>
														      </button>
														      <strong>Add Subject and description</strong>
											              </div>
					                                     
					                                      <div class="form-group">
					                                          <div class="col-lg-offset-2 col-lg-10">
					                                              <button class="btn btn-primary" type="submit" ng-click="addSubjectToInstitute()">Add Subject</button>
					                                          </div>
					                                      </div>
			                                       </form>
			                                
                                  </div>
                              </div>
                          </div>
                     </div>
          </section> 
          
           <!-------------------------------------   End : Add subject to Institute  ---------------------------------->
           
           <!-----------------------------------  Start : Show subject to Institute  ---------------------------------->
               
               <section class="panel">
           
                       <div class="panel-body" ng-show="ShowSubjectTable">
                       
                        <div class="alert alert-info fade in" ng-show="SubjectDeleteSuccess">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                  <strong>Subject Delete Successfully</strong> 
							                              </div>
							                              
							                              
							                               <div class="alert alert-block alert-danger fade in " ng-show="SubjectDeleteError">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                <strong>Error in Deleting Subject</strong>
							                              </div>
							                              
							                              <div class="alert alert-info fade in" ng-show="SubjectUpdateSuccess">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                  <strong>Subject Updated Successfully</strong> 
							                              </div>
							                              
                       
                         <form class="form-horizontal" method="get"> 
                              <div class="form-group" ng-show="filteredTodos.length">
                                  <label class="control-label col-lg-2" for="inputSuccess">Search Subject</label>
                                     <div class="col-lg-10">
                                        <div class="row">
                                          <div class="col-lg-3">                                 
                                              <input type="text" class="form-control" placeholder="search"  ng-model="subject_filter" ng-change="filterSubject()">
                                          </div>
                                        </div>
                                      </div>
                               </div>
                        </form>
                       <br></br>
                         <table id="example" class="table  " ng-show="ShowSubjectTable"  ng-hide="!filteredTodos.length">
                           <tbody>
                             <tr>
							   <th><i class=""></i>Subject Name</th>                               
                               <th>Subject Description</th>                            
                               <th><i class="icon_cogs"></i> Action</th>
                             </tr>
                             <tr ng-repeat="subject in filteredTodos | filter : subject_filter | orderBy : 'name'" ng-class="{selectedrow:subject.Selected}">
									<td> {{ subject.name }}</td>
   							 		<td> {{ subject.discription }}</td>
   							 		<td>
   							 		 
   							 		    <a class="btn btn-primary tooltips" title="Update Subject" data-toggle="modal" data-placement="left" data-original-title="Update Subject"  ng-click="updateSubjectLoad(subject)" href="#updateSubjectModal"><i class="icon_plus_alt2"></i></a>
                                        <a class="btn btn-danger tooltips" title="Delete Subject" data-toggle="tooltip" data-placement="right" data-original-title="Delete Subject" ng-click="deleteSubject(subject)"><i class="icon_close_alt2"></i></a>
                                      <!-- <a class="btn btn-danger" ng-click="deleteSubject(subject)" style="margin-left: 10%"><i class="icon_close_alt2"></i></a> -->
                                        
                                         <!-- Modal Start-->
											                              <div class="modal fade" id="updateSubjectModal" tabindex="-1" role="dialog" aria-labelledby="updateSubjectModalLabel" aria-hidden="true">
											                                  <div class="modal-dialog">
											                                      <div class="modal-content">
											                                          <div class="modal-header">
											                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											                                              <h4 class="modal-title">Edit Subject</h4>
											                                          </div>
											                                          <div class="modal-body">
											
											                                              
											                                               <form class="form-horizontal " name="UpdateSubjectForm" method="get">
																                                  <div class="form-group" ng-show=false>
																                                      <label class="col-sm-2 control-label">Subject id<span class="required">*</span></label>
																                                      <div class="col-sm-10">
																                                          <input ng-model="$parent.idEditsubject" type="text" class="form-control" required="required">
																                                      </div>
																                                        
																                                  </div>
																                                 
																                                  <div class="form-group">
																                                      <label class="col-sm-2 control-label">Name<span class="required">*</span></label>
																                                      <div class="col-sm-10">
																                                          <input ng-model="$parent.nameEditsubject" type="text" class="form-control" required="required">
																                                      </div>
																                                        
																                                  </div>
																                                   <div class="form-group">
																                                      <label class="col-sm-2 control-label">Description<span class="required">*</span></label>
																                                      <div class="col-sm-10">
																                                          <input ng-model="$parent.descriptionEditsubject" type="text" class="form-control" required="required">
																                                      </div>
																                                  </div>
																                                 
																                                 <div class="form-group">
																                                      <div class="col-lg-offset-2 col-lg-10">
																                                          <button type="submit" data-dismiss="modal" class="btn btn-primary" ng-click="UpdateSubjectForm.$valid && UpdateSubject()" ng-disabled="!UpdateSubjectForm.$valid || !UpdateSubjectForm.$dirty">Update Subject</button>
																                                      </div>
																                                 </div>
																                           
																                              </form>
											
											                                          </div>
											                                          <div class="modal-footer">
											                                              <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
											                                             <!--  <button class="btn btn-success" type="button">Save changes</button> -->
											                                          </div>
											                                      </div>
											                                  </div>
											                              </div>
											                              <!-- modal End-->
                                        
                                    </td>
   							 </tr>
                          </tbody>
                  </table>
                  
            
                    <pagination ng-model="currentPage" total-items="totallenght" max-size="maxSize" boundary-links="true"
                    ng-show="ShowSubjectTable" ng-hide="!filteredTodos.length">
				</pagination> 
					                  
                  <div class="alert alert-block alert-danger fade in" ng-show="!subjectOfInstituteList.length">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>There is no subject in Institute</strong> 
                 </div>
   </div> 
  </section>
            </div>           
          </div>
          </section>
 </section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>