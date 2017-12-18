<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="myCtrl" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
 
<title>TeacherApprover</title>

 <script>

 var app = angular.module('myApp',[]);

 app.config(function($httpProvider) {
	 $httpProvider.defaults.headers.post['My-Header']='value' 
	}); 
 
  		
  		/* app.config(function($httpProvider) {
  		  $httpProvider.defaults.xsrfCookieName = 'XSRF-TOKEN';
  		  $httpProvider.defaults.xsrfHeaderName = 'X-XSRF-TOKEN';
  		}); */
  		/* /* app.config([
  		  "$httpProvider", function($httpProvider) {
  		    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  		  }
  		]);  */ 
  		
  		/*  app.config(['$httpProvider', function($httpProvider) {
  	  		 
  	  csrfToken = 
  	  $httpProvider.defaults.headers.post['X-CSRF-Token'] = csrfToken
  	  $httpProvider.defaults.headers.put['X-CSRF-Token'] = csrfToken
  	  $httpProvider.defaults.headers.patch['X-CSRF-Token'] = csrfToken
  	  $httpProvider.defaults.headers.delete['X-CSRF-Token'] = csrfToken
  		}]);  
 */
  		
   		app.controller('myCtrl', function($scope, $http) {

   		
   			$scope.teacherList=JSON.parse('${TeacherListJSON}');
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}'); 
   		 console.log("hello console");
   		 $scope.checkbox = {
   				authorise_student : false,
   				authorise_teacher :false,
   				fill_attendance :false,
   				fill_schedule :false,
   				mail_parent :false,
   				mail_student :false,
   				mail_teacher :false,
   				msg_parent :false,
   				msg_student : false,
   				msg_teacher :false,
   				set_exam :false,
   				update_results :false,
   				alter_institute_structure :false  				
   		     }; 	


   		
   		 $scope.resetPermissions=function()
   		    { 
   			 $scope.checkbox = {
   	   				authorise_student : false,
   	   				authorise_teacher :false,
   	   				fill_attendance :false,
   	   				fill_schedule :false,
   	   				mail_parent :false,
   	   				mail_student :false,
   	   				mail_teacher :false,
   	   				msg_parent :false,
   	   				msg_student : false,
   	   				msg_teacher :false,
   	   				set_exam :false,
   	   				update_results :false,
   	   				alter_institute_structure :false  				
   	   		     }; 

   		    };
   		

   		

   		/* //-------------Approve fucntion-------------------
   		    $scope.approve=function(teacher)
   		    { 

   		    	

   		    console.log("inside teacher approval request")

   		    	var data = JSON.stringify({authoriseStudent:$scope.checkbox.authorise_student,authoriseTeacher:$scope.checkbox.authorise_teacher,fillAttendance:$scope.checkbox.fill_attendance,fillSchedule:$scope.checkbox.fill_schedule,mailParent:$scope.checkbox.mail_parent,mailStudent:$scope.checkbox.mail_student,mailTeacher:$scope.checkbox.mail_teacher,msgParent:$scope.checkbox.msg_parent,msgStudent:$scope.checkbox.msg_student,msgTeacher:$scope.checkbox.msg_teacher,setExam:$scope.checkbox.set_exam,updateResults:$scope.checkbox.update_results,alterInstituteStructure:$scope.checkbox.alter_institute_structure});
   		 var csrf = $scope.csrf_token;
 	    console.log("csrf token is"+scrf)
   		 
   		  console.log("inside teacher approval request datat is :"+data);

   		
   		        $http({
   		            url: "TeacherRequestApprover/"+teacher.id,
   		         contentType : 'application/json; charset=utf-8',
   		      dataType : 'json',
   		            method: "POST",  
   		         data  :data  ,
   		      headers: {'X-CSRFToken' : csrf }
   		     
   		        })
   		        .then(function successCallback(response) {
   		                // if success   
   		                
   		                console.log("response came");    	
   		        	
				var status=response.data.status;
				if(response.data.status=="success"){

					 console.log(" teacher is approved : "+teacher.id);
   		        	 console.log("teacher is deleted and response recieved is :"+response.data.message);
   		 			
   		        	 $scope.deletemessage=response.data.message;
   		        	//delete the role from array
   		        	 for( i=$scope.teacherList.length-1; i>=0; i--) {
   		        		    if( $scope.teacherList[i].id == teacher.id) $scope.teacherList.splice(i,1);
   		        		}    

				}          
   		        }, 
   		     function errorCallback(response) {
   		                // failed
   		                
   		                 console.log("error response came");    	
   		                 $scope.deletemessage=response.data.message;
   		        	 console.log(" teacher is deletion failed and response is "+data.message);      
   		        });

   		    };
 */


//-------------Approve fucntion-------------------
    $scope.approve=function(teacher)
    { 

	 var parameters = {};

	
	 
	 parameters.authoriseStudent=$scope.checkbox.authorise_student;
	 parameters.authoriseTeacher=$scope.checkbox.authorise_teacher;
	 parameters.fillAttendance=$scope.checkbox.fill_attendance;
	 parameters.fillSchedule=$scope.checkbox.fill_schedule;
	 parameters.mailParent=$scope.checkbox.mail_parent;
	 parameters.mailStudent=$scope.checkbox.mail_student;
	 parameters.mailTeacher=$scope.checkbox.mail_teacher;
	 parameters.msgParent=$scope.checkbox.msg_parent;
	 parameters.msgStudent=$scope.checkbox.msg_student;
	 parameters.msgTeacher=$scope.checkbox.msg_teacher;
	 parameters.setExam=$scope.checkbox.set_exam;
	 parameters.updateResults=$scope.checkbox.update_results;
	 parameters.alterInstituteStructure=$scope.checkbox.alter_institute_structure
	 

    console.log("inside teacher approval request")

    	var data = JSON.stringify({});

  console.log("inside teacher approval request datat is :"+data);


        $http({
            url: "TeacherRequestApprover/"+teacher.id,
         contentType : 'application/json; charset=utf-8',
      dataType : 'json',
            method: "GET",  
            params :parameters      
        })
        .then(function successCallback(response) {
                // if success   
                
                console.log("response came");    	
        	
		var status=response.data.status;
		if(response.data.status=="success"){

			 console.log(" teacher is approved : "+teacher.id);
        	 console.log("teacher is deleted and response recieved is :"+response.data.message);
 			
        	 $scope.deletemessage=response.data.message;
        	//delete the role from array
        	 for( i=$scope.teacherList.length-1; i>=0; i--) {
        		    if( $scope.teacherList[i].id == teacher.id) $scope.teacherList.splice(i,1);
        		}    

		}          
        }, 
     function errorCallback(response) {
                // failed
                
                 console.log("error response came");    	
                 $scope.deletemessage=response.data.message;
        	 console.log(" teacher is deletion failed and response is "+data.message);      
        });

    };




      		 //-------------delete fucntion-------------------
      		    $scope.deleteTeacher=function(teacher)
      		    { 

      		      console.log("hello from delete function console");
      		        $http({
      		            url: "deleteTeacherApprovalRequest/"+teacher.id,
      		            method: "GET",          
      		        })
      		        .then(function successCallback(response) {

      		        
      		        	 console.log(" teacher is deleted : "+teacher.id);
      		        	 console.log("teacher is deleted and response recieved is :"+response.data.message);

      		        	if(response.data.status=="success"){
      		                // if success       	
      		        	

      		 			
      		        	 $scope.deletemessage=response.data.message;
      		        	//delete the role from array
      		        	 for( i=$scope.teacherList.length-1; i>=0; i--) {
      		        		    if( $scope.teacherList[i].id == teacher.id) $scope.teacherList.splice(i,1);
      		        		}  
      		        	}            
      		        }, 
      		      function errorCallback(response) {
      		                // failed
      		                 $scope.message=data.message;
      		        	 console.log(" teacher deletion failed and response is "+data.message);      
      		        });

      		    };

      		    
   			  			   			  			 			  			
   		}); 
   		  		
   		</script>
</head>
<body  ng-cloak class="ng-cloak">
  <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 

 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" />  

 <section id="main-content">
          <section class="wrapper">
               
           
              <label class="control-label col-lg-2" for="inputSuccess">Find Teacher</label>
               <div class="row">
                <div class="col-lg-3">
                   <input type="text" class="form-control"  ng-model="test">
                </div>
               </div>
           </div>
          
          <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              Teacher Request Pending for Approval
                          </header>
                          
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><i class="icon_profile"></i> Full Name</th>                               
                                 <th><i class="icon_mail_alt"></i> Email</th>                            
                                 <th><i class="icon_mobile"></i> Mobile</th>
                                 <th><i class="icon_cogs"></i> Action</th>
                              </tr>
                              <tr ng-repeat="teacher in teacherList | filter : test | orderBy:'fname'" ">
    								<td>{{ teacher.fname }}  {{ teacher.lname }}</td>
   							 		<td>{{ teacher.email }}</td>
   							 		<td>{{ teacher.contactno }}</td>
   							 		<td>
                                  <div class="btn-group">
                                    
                                      <a class="btn btn-success"  data-toggle="modal" ng-click="resetPermissions()" href="#myModal"><i class="icon_check_alt2"></i></a>
                                      <a class="btn btn-danger" ng-click="deleteTeacher(teacher)"><i class="icon_close_alt2"></i></a>
                                      
                                      
                                       <!-- Modal -->
                              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog">
                                      <div class="modal-content">
                                          <div class="modal-header">
                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                              <h4 class="modal-title">Modal Tittle</h4>
                                          </div>
                                          <div class="modal-body">

                                              Give Permissions To Teacher  
                                               <section class="panel">
                          <div class="panel-body">
                              <form class="form-horizontal " method="get">
                                  <div class="form-group">
                                      <label class="control-label col-lg-2" for="inputSuccess">Checkboxes and radios</label>
                                      <div class="col-lg-10">
                                          <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="" ng-model="checkbox.authorise_student">
                                                 Authorize Student
                                              </label>
                                          </div>
                                          <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="" ng-model="checkbox.authorise_teacher">
                                                 Authorize Teacher 
                                              </label>
                                          </div>

                                           <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="" ng-model="checkbox.fill_attendance">
                                                Fill Attendance
                                              </label>
                                          </div>
                                           <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="" ng-model="checkbox.fill_schedule">
                                                Fill Schedule
                                              </label>
                                          </div>
                                           <div class="checkbox">
                                              <label>
                                               <input type="checkbox" value="" ng-model="checkbox.mail_parent">
                                                Mail Parent
                                              </label>
                                          </div>
                                           <div class="checkbox">
                                              <label>
                                             <input type="checkbox" value="" ng-model="checkbox.mail_student">
                                                 Mail Student
                                              </label>
                                          </div>
                                           <div class="checkbox">
                                              <label>
                                                 <input type="checkbox" value="" ng-model="checkbox.mail_teacher">
                                                Mail Teacher
                                              </label>
                                          </div>
                                           <div class="checkbox">
                                              <label>
                                               <input type="checkbox" value="" ng-model="checkbox.msg_parent">
                                                 Message Parent
                                              </label>
                                          </div>
                                           <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="" ng-model="checkbox.msg_student">
                                                Message Student
                                              </label>
                                          </div>
                                           <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="" ng-model="checkbox.msg_teacher">
                                                 Message Teacher
                                              </label>
                                          </div>
                                           <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="" ng-model="checkbox.set_exam">
                                                Set Exam
                                              </label>
                                          </div>
                                           <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="" ng-model="checkbox.update_results">
                                                Update Results
                                              </label>
                                          </div>
                                         
                                           <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="" ng-model="checkbox.alter_institute_structure">
                                                Alter Institute Structure 
                                              </label>
                                          </div>

                                         
                                      </div>
                                  </div>                               
                              </form>
                          </div>
                      </section>

                                          </div>
                                          <div class="modal-footer">
                                              <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                                              <button data-dismiss="modal" class="btn btn-success" type="button" ng-click="approve(teacher)">Approve Teacher</button>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <!-- modal -->
                                                                  
                                  </div>
                                  </td>
  							</tr>
                             
                                                    
                           </tbody>
                        </table>
                               
                              <div ng-show="!teacherList.length" class="alert alert-info fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>No pending request for approval</strong>
                              </div>
                      </section>
                  </div>
              </div>
                            
 

   </section>
    <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
</body>
</html>