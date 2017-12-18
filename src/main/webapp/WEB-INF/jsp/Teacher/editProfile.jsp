<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl">
<head>
<title>Teacher Profile</title>
  
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />
<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />



</head>
<body ng-cloak class="ng-cloak">

	<section id="container" class="">
	       <!-- Default header --> 
	<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 
	       <!-- Default Menu -->
	<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" />
	
	<!-- <div ng-include="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp"></div> -->

	<section id="main-content">
	 <section class="wrapper">
	<div class="row">
		 <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                           <h2>Edit Profile</h2>
                          </header>
                          
                          <div class="panel-body">
                              <div class="form">
                                 <form:form class="form-validate form-horizontal " id="edit_profile" method="post" action="editTeacher" modelAttribute="EditTeacher">
                                      <div class="form-group ">
                                          <label for="fullname" class="control-label col-lg-2">First Name<span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="fname" class=" form-control" id="fname" ng-model="teacher.fname" value="{{teacher.fname}}" name="fname" type="text" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                          <br><br>
                                          <label for="fullname" class="control-label col-lg-2">Last Name<span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="lname" class=" form-control" id="lname" ng-model="teacher.lname" value="{{teacher.lname}}" name="lname" type="text" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                           <br><br>
                                           <label for="fullname" class="control-label col-lg-2">Contact Number <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="contactno" class=" form-control" id="contactno" ng-model="teacher.contactno" value="{{teacher.contactno}}" name="contactno" type="text" pattern="[789][0-9]{9}" title="Please enter Valid contact number" autocomplete="off" required="required" maxlength="12"/>
                                          </div>
                                           <br><br>
                                          <label for="fullname" class="control-label col-lg-2">Email Id <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="email" class=" form-control" id="email" ng-model="teacher.email" value="{{teacher.email}}" name="email" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                      </div>
                                    
                                      <div class="form-group">
                                          <div class="col-lg-offset-2 col-lg-10">
                                              <button class="btn btn-primary" type="submit">Save</button>
                                          </div>
                                      </div>
                                  </form:form>
                              </div>
                          </div>
                      </section>
                  </div>
			</div>
			
			</section>
	
	</section> <!-- container section start --> <jsp:include
		page="/WEB-INF/jsp/components/defaultScript.jsp" />
		 </section>
	<!-- container section start -->
</body>
</html>