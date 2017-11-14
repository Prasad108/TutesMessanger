<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<title>StudentManager</title>
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



   		$scope.idSelectedRow = [];

   		$scope.selectRow = function(name){
   		     if( $scope.idSelectedRow.indexOf(name) > -1 )
   		        $scope.idSelectedRow.splice($scope.idSelectedRow.indexOf(name), 1);
   		     else
   		        $scope.idSelectedRow.push( name );

   		};

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

   		 
     		  			  			   			  			 			  			
   		}); 
   		
   		  		
   		</script>

   		
   		

</head>
<body ng-app="myApp" ng-controller="myCtrl">

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" /> 

<aside>
  <section id="main-content">
          <section class="wrapper">  
          
          
          <h1>Add Student to Division</h1>
          
            <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                             Student who are not in any Division
                          </header>
                          
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><i class="icon_profile"></i> Full Name</th>                               
                                 <th><i class="icon_mail_alt"></i> Email</th>                            
                                 <th><i class="icon_mobile"></i> Mobile</th>
                               
                              </tr>
                              <tr class="list-group-item listroleitem" ng-click="selectRow(student)"  ng-class="{selectedRole: isSelected( student ) }" ng-repeat="student in studentList | filter : test | orderBy:'fname'" ">
    								<td>{{ student.fname }}  {{ student.lname }}</td>
   							 		<td>{{ student.email }}</td>
   							 		<td>{{ student.contactno }}</td>
   							 		
                                 
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