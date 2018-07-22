<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" >
<head>
<title>Student Home</title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		 
		
		<script src="${pageContext.request.contextPath}/app/student/app.js"></script>
		
		<script src="${pageContext.request.contextPath}/app/commanService/shairedDataService.js"></script>
		<script src="${pageContext.request.contextPath}/app/commanService/forResolveService.js"></script>	
		<script src="${pageContext.request.contextPath}/app/student/home/homeController.js"></script>
   		<script src="${pageContext.request.contextPath}/app/student/home/homeCompoent.js"></script>		
   		<script src="${pageContext.request.contextPath}/app/student/Schedule/ScheduleCtrl.js"></script>
   		<%-- <script src="${pageContext.request.contextPath}/app/student/Schedule/ScheduleComponent.js"></script> --%>
   		
		
</head>
<body>

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Student/components/studentMenu.jsp" />  
<!-- <div ng-include="/WEB-INF/jsp/Student/components/teacherMenu.jsp"></div> -->

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