<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp"  >
	<head>
 		<title>Teacher </title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		<script src="${pageContext.request.contextPath}/app/angular-ui-router.js"></script>
   		
   		<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 -->
 		<script src="${pageContext.request.contextPath}/app/teacher/app.js"></script>
 		
	
   		<script src="${pageContext.request.contextPath}/app/teacher/home/homeController.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/home/homeCompoent.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/instituteStructure/existingInstituteStructure/existingInstituteStructureController.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/instituteStructure/existingInstituteStructure/existingInstituteStructureComponent.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/appManger/studentRequest/studentRequestController.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/appManger/studentRequest/studentRequestComponent.js"></script>
   		
   		
   		   		<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" /> 
   		   		 	
   			
		
   	</head>
<body ng-cloak class="ng-cloak">

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<!-- <menu-component></menu-component> -->
<div ng-controller="teacherCtrl">
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" />  
</div>

 <section id="main-content">
          <section class="wrapper">
          <div class="row" >
	          <h1>this is from index page </h1>
	          <ui-view></ui-view>
          </div>
          </section>
 </section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>