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
<title>Student Request Manager</title>
 <jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 

<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />

   	   <script>

  		var app = angular.module('myApp', []);
  		app.config(['$httpProvider', function($httpProvider) {
  			 $httpProvider.defaults.withCredentials = true;		    
  		    $httpProvider.defaults.xsrfCookieName = 'CSRF-TOKEN'; 
  		    $httpProvider.defaults.xsrfHeaderName = 'X-CSRF-TOKEN'; 
  		}]);
   		app.controller('myCtrl', function($scope, $http) {

   		
   			$scope.studentList=JSON.parse('${StudentListJSON}');
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}'); 
   		 console.log("hello console");



   		 //-------------delete fucntion-------------------
		    $scope.deleteStudent=function(student)
		    { 

		      console.log("hello from delete function console");
		        $http({
		            url: "deleteStudentApprovalRequest/"+student.id,
		            method: "GET",          
		        })
		        .then(function successCallback(response) {

		        
		        	 console.log(" Student is deleted : "+student.id);
		        	 console.log("Student is deleted and response recieved is :"+response.data.message);

		        	if(response.data.status=="success"){
		                // if success       	
		        	

		 			
		        	 $scope.deletemessage=response.data.message;
		        	//delete the role from array
		        	 for( i=$scope.studentList.length-1; i>=0; i--) {
		        		    if( $scope.studentList[i].id ==student.id) $scope.studentList.splice(i,1);
		        		}  
		        	}            
		        }, 
		      function errorCallback(response) {
		                // failed
		                 $scope.message=data.message;
		        	 console.log(" teacher deletion failed and response is "+data.message);      
		        });

		    };





		    //-------------Approve fucntion-------------------//
		    $scope.approve=function(student)
		    { 

		    console.log("inside student approval request")

		    

		 


		        $http({
		            url: "StudentRequestApprover/"+student.id,
		         contentType : 'application/json; charset=utf-8',
		      dataType : 'json',
		            method: "GET",  		              
		        })
		        .then(function successCallback(response) {
		                // if success   
		                
		                console.log("response came");    	
		        	
				var status=response.data.status;
				if(response.data.status=="success"){

					 console.log(" student is approved : "+student.id);
		        	 console.log("student is deleted and response recieved is :"+response.data.message);
		 			
		        	 $scope.deletemessage=response.data.message;
		        	//delete the role from array
		        	 for( i=$scope.studentList.length-1; i>=0; i--) {
		        		    if( $scope.studentList[i].id == student.id) $scope.studentList.splice(i,1);
		        		}    

				}          
		        }, 
		     function errorCallback(response) {
		                // failed
		                
		                 console.log("error response came");    	
		                 $scope.deletemessage=response.data.message;
		        	 console.log(" student is deletion failed and response is "+data.message);      
		        });

		    };
	 
   		 
     		  			  			   			  			 			  			
   		}); 
   		
   		  		
   		</script>

   		
   		

</head>
<body ng-app="myApp" ng-controller="myCtrl" ng-cloak class="ng-cloak">

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" /> 

<aside>
  <section id="main-content">
          <section class="wrapper">  
          
          
          <h1>this is Student Request Manager</h1>
          
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
                              <tr ng-repeat="student in studentList | filter : test | orderBy:'fname'" ">
    								<td>{{ student.fname }}  {{ student.lname }}</td>
   							 		<td>{{ student.email }}</td>
   							 		<td>{{ student.contactno }}</td>
   							 		<td>
                                  <div class="btn-group">
                                    
                                      <a class="btn btn-success" ng-click="approve(student)" ><i class="icon_check_alt2"></i></a>
                                      <a class="btn btn-danger" ng-click="deleteStudent(student)" ><i class="icon_close_alt2"></i></a>
                                                                                                                                                                                
                                  </div>
                                  </td>
  							</tr>
                             
                                                    
                           </tbody>
                        </table>
                               
                              <div ng-show="!studentList.length" class="alert alert-info fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>No pending request for approval</strong>
                              </div>
                      </section>
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