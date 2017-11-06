<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
 	<title>App Admin</title>
 
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="/img/favicon.png">
    
<!-- Bootstrap CSS -->    
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="${pageContext.request.contextPath}/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
   
  
  </head>
<body>
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/appAdmin/components/appAdminMenu.jsp" /> 

 <!-- Default Containt -->
<jsp:include page="/WEB-INF/jsp/components/defaultMainContaint.jsp" /> 

    
     <!-- container section start -->


  	<script src="${pageContext.request.contextPath}/js/jquery.js" ></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}//js/jquery-ui-1.9.2.custom.min.js"></script>
    <!-- bootstrap -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="${pageContext.request.contextPath}/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.js" type="text/javascript"></script>
   
   
    <!--custome script for all page-->
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
   
	
   
   </section>
 <!-- container section start -->
  </body>
</html>