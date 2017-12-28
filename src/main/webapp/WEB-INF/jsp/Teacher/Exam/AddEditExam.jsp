<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl" >
	<head>
 		<title>Add/Edit Exam</title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />
   		<%-- <jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />  --%>
   		
   		 <script>

  		  var app = angular.module('myApp', []);
   		app.controller('teacherCtrl', function($scope, $http) {

   		
	   			$scope.teacher=JSON.parse('${teacherJSON}');
	   			$scope.permissions=JSON.parse('${permissions}');  
	   			$scope.institute=JSON.parse('${institute}');				
	   			console.log("teacher is "+$scope.teacher);
	   			console.log("teacher id is "+$scope.teacher["id"]);
	
	   			$scope.examList=[];
	   			$scope.examMode=[];
	   			$scope.examType=[];
	
	   		 $http({
	             url: "GetExamsOFInstitute/"+$scope.institute.id,
	             method: "POST",          
	         })
	         .then(function(response) {
	                 // if success       	
	         	 console.log("WE got exams of this institute ");        	
	         	 $scope.examList=response.data;
	         	
	         	for( i=$scope.examList.length-1; i>=0; i--) {
		   	          console.log($scope.examList[i].id + $scope.examList[i].discription);    	
		        		}              
	         }, 
	         function(data) { // optional
	                 // failed
	                 
	         	 console.log(" failed to get the exam of institute");      
	         });  	

	   		 $http({
	             url: "GetExamsMode/",
	             method: "POST",          
	         })
	         .then(function(response) {
	                 // if success       	
	         	 console.log("WE got examsModes");        	
	         	$scope.examMode=response.data;
	         	
	         	for( i=$scope.examMode.length-1; i>=0; i--) {
		   	          console.log($scope.examMode[i].id + $scope.examMode[i].modeName);    	
		        		}              
	         }, 
	         function(data) { // optional
	                 // failed
	                 
	         	 console.log(" failed to get the examMode");      
	         });


	   		$http({
	             url: "GetExamsType/",
	             method: "POST",          
	         })
	         .then(function(response) {
	                 // if success       	
	         	 console.log("WE got examType");        	
	         	$scope.examType=response.data;
	         	
	         	for( i=$scope.examType.length-1; i>=0; i--) {
		   	          console.log($scope.examType[i].id + $scope.examType[i].typeName);    	
		        		}              
	         }, 
	         function(data) { // optional
	                 // failed
	                 
	         	 console.log(" failed to get the examType");      
	         });

   					   		  			 			  			
   		});   	    
		
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


	          	            <!--tab nav start-->
                      <section class="panel">
                          <header class="panel-heading tab-bg-primary ">
                              <ul class="nav nav-tabs">
                                  <li class="active">
                                      <a data-toggle="tab" href="#home">Existing Exams</a>
                                  </li>
                                  <li class="">
                                      <a data-toggle="tab" href="#about">Create Exam</a>
                                  </li>
                                  <li class="">
                                      <a data-toggle="tab" href="#profile">Add Subjects to Exam</a>
                                  </li>
                                  <li class="">
                                      <a data-toggle="tab" href="#contact">Add Student To Exam</a>
                                  </li>
                              </ul>
                          </header>
                          <div class="panel-body">
                              <div class="tab-content">
                                  <div id="home" class="tab-pane active">
      								   <div class="row">
								                  <div class="col-lg-12">
								                      <section class="panel">
								                          <header class="panel-heading">
								                              Existing Exams
								                          </header>
								                          <div class="table-responsive">
								                            <table class="table">
								                              <thead>
								                                <tr>
								                                  <th>#</th>
								                                  <th>Discription</th>
								                                  <th>Max Marks</th>
								                                  <th>Passing Marks<th>
								                                  <th>Regular</th>
								                                  <th>Exam Type</th>
								                                  <th>Exam Mode</th> 
								                                </tr>
								                              </thead>
								                              <tbody>
								                              	<tr ng-repeat="exam in examList">
								                                  <td>{{exam.id}}</td>
								                                  <td>{{exam.discription}}</td>
								                                  <td>{{exam.outOf}}</td>
								                                  <td>{{exam.passingMarks}}</td>
								                                  <td>{{exam.regular}}</td>
								                                  <td>{{examMode[exam.examMode.id].modeName}}</td>
								                                  <td>{{examType[exam.examType.id].typeName}}</td>
								                                </tr>
								                               
								                              </tbody>
								                            </table>
								                          </div>
								
								                      </section>
								                  </div>
								              </div>
                                      
                                  </div>
                                  
                                  
                                  
                                  
                                  <div id="about" class="tab-pane">Create Exam</div>
                                  <div id="profile" class="tab-pane">Add Subjects to Exam</div>
                                  <div id="contact" class="tab-pane">Add Student To Exam</div>
                              </div>
                          </div>
                      </section>
                      <!--tab nav start--> 
	                       	


          </div>
          </section>
 </section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>