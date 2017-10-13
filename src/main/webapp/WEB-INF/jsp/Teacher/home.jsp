<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl" >
	<head>
 		<title>Teacher </title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		
   		 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.js"></script> 
   		<script>

  		var app = angular.module('myApp', []);
   		app.controller('teacherCtrl', function($scope, $http) {

   		
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}');  				
   			console.log("teacher is "+$scope.teacher);
   			console.log("teacher id is "+$scope.teacher["id"]);  			   		  			 			  			
   		});   		      
   		</script>
   		
		<!-- <script src="/js/angular/Teacher/TeacherHome.js" type="text/javascript"> -->
		</script>
   	</head>
<body >

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" />  
<!-- <div ng-include="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp"></div> -->

 <section id="main-content">
          <section class="wrapper">
          <div class="row">
	          	<h1> Teacher Home page</h1>                  	
	          	<h4>{{teacher}}</h4>
	          	<h4>{{permissions}}</h4>                   
          </div>
          </section>
 </section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>