<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
     <script
     src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script>


  var app=angular.module("myApp",[]);
  app.controller("myController",function($scope,$http,$sce){
		
		$scope.teacher=JSON.parse('${teacherJSON}');
	    $scope.permissions=JSON.parse('${permissions}');  				
		console.log("teacher is "+$scope.teacher);
		console.log("teacher id is "+$scope.teacher["id"]+"permissions are "+ $scope.permissions);  
		console.log($scope.permissions);
	  
	  $scope.scheduleError=false;
	  $scope.scheduleSuccess=false;
	  $scope.calender;
	  $http({
		      url:"getSchedule",
		      method:"POST"
	  }).then(function successCallback(response){
		  console.log(response.data);
		  
		  if(response.data.status=="success")
			  {
			  $scope.calender=$sce.trustAsHtml(response.data.schedule);
				 // $scope.calender=response.data.schedule;
				console.log($scope.calender);
				  $scope.scheduleSuccess=true;
				  $scope.SuccessMessage="schedule is below.";
			  }
		  else{
			  $scope.scheduleError=true;
			  $scope.ErrorMessage=response.data.message;
		  }
		 
		  
	  },
	  function errorCallback(response){
		  $scope.scheduleError=true;
		  $scope.ErrorMessage="Error at server side!";
		  
		  
	  }
	  
	  
	  )
	  
	  
	  
	  
  });


</script>
<title>Student Schedule</title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
		<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />
		<style type="text/css"> 
			
						.googleCalendar{
									  position: relative;
									  height: 0;
									  width: 100%;
									  padding-bottom: 100% ;
									}
									
				.googleCalendar iframe{
									  position: absolute;
									  top: 0;
									  left: 0;
									  width: 100%;
									  height: 100%;
									}
   		
   		
   		</style>
   		
</head>
<body ng-app="myApp" ng-controller="myController">

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Student/components/studentMenu.jsp" />  
<div ng-include="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp"></div>

 <section id="main-content">
          <section class="wrapper">
         
	          	<h1> Student Schedule</h1>  
	          	    <div class="alert alert-block alert-danger fade in" ng-show="scheduleError">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>{{ErrorMessage}}</strong> 
                              </div>
             
              
  						
				
         
		  <div class="alert alert-success fade in" ng-show="scheduleSuccess">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>{{SuccessMessage}}</strong> 
                              </div>
              
			
			  <div id="show_calender" class="googleCalendar" style="text-align: center;" ng-bind-html="calender"></div>
			  
			
	                  	
	          	            
          
          </section>
 </section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>