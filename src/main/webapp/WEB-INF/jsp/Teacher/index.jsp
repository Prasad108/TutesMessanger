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
   		<script src="${pageContext.request.contextPath}/app/ui-bootstrap-custom-2.5.0.min.js"></script>
 		<script src="${pageContext.request.contextPath}/app/teacher/app.js"></script>
 		
	
   		<script src="${pageContext.request.contextPath}/app/teacher/home/homeController.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/home/homeCompoent.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/instituteStructure/existingInstituteStructure/existingInstituteStructureController.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/instituteStructure/existingInstituteStructure/existingInstituteStructureComponent.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/appManger/studentRequest/studentRequestController.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/appManger/studentRequest/studentRequestComponent.js"></script>
   		
   		<script src="${pageContext.request.contextPath}/app/teacher/appManger/teacherRequest/teacherRequestController.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/appManger/teacherRequest/teacherRequestComponent.js"></script>
   		
   		<script src="${pageContext.request.contextPath}/app/teacher/appManger/addStudentToDivision/addStudentToDivisionController.js"></script>
   		<script src="${pageContext.request.contextPath}/app/teacher/appManger/addStudentToDivision/addStudentToDivisionComponent.js"></script>
   		
   		
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