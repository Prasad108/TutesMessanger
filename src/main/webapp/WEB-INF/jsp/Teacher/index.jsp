<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp"  >
	<head>
 		<title>Teacher </title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		<link href="<c:url value="/css/ivh-treeview.css" />" rel="stylesheet">
   		<link href="<c:url value="/css/ivh-treeview.min.css" />" rel="stylesheet">
   	
   		<script src="<c:url value="/js/ivh_treeViewscript.js" />"></script>
  	
   		<script src="${pageContext.request.contextPath}/app/teacher/appTeacherAllCompomentsAndControllers.js"></script>
   		<script src="${pageContext.request.contextPath}/app/commanService/shairedDataService.js"></script>
		<script src="${pageContext.request.contextPath}/app/commanService/forResolveService.js"></script>	
   		<script src="${pageContext.request.contextPath}/app/Comman_Module/Comman_module.js"></script>
   		

   		<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" /> 
   		   			
   			
		
   	</head>
<body ng-cloak class="ng-cloak">

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<div ng-controller="teacherCtrl">
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" />  
</div>

<loading us-spinner="{radius:30, width:8, length: 16}" ></loading>

 <section id="main-content">
          <section class="wrapper">
          <div class="row" >
	        <!--   <h1>this is from index page </h1> -->

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