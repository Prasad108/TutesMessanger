<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl">
<head>
<title>Teacher Profile</title>
<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />
<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />
<%-- <jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />  --%>

<!-- <script>

  		/*  var app = angular.module('myApp', []);
   		app.controller('teacherCtrl', function($scope, $http) {

   		
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}');  				
   			console.log("teacher is "+$scope.teacher);
   			console.log("teacher id is "+$scope.teacher["id"]);  			   		  			 			  			
   		});   	     */  
		
   		</script> -->



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
	
	  <c:if test="${!empty profileEditSuccess}">
  					  <div class="alert alert-success fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  ${profileEditSuccess}
                              </div>
		     </c:if>
		     
		<div id="profile" class="tab-pane">
			<section class="panel">
			<div class="panel-body bio-graph-info">
				<h1>Bio Graph</h1>
				<div class="row">
					<div class="bio-row">
						<p>
							<span>First Name </span>: {{teacher.fname}}
						</p>
					</div>
					<div class="bio-row">
						<p>
							<span>Last Name </span>:  {{teacher.lname}}
						</p>
					</div>
					<div class="bio-row">
						<p>
							<span>Occupation </span>: Teacher
						</p>
					</div>
					<div class="bio-row">
						<p>
							<span>Email </span>: {{teacher.email}}
						</p>
					</div>
					<div class="bio-row">
						<p>
							<span>Mobile </span>: {{teacher.contactno}}
						</p>
					</div>
				</div>
			</div>
			</section>
			
			</div>
			</div>
			
			</section>
	
	</section> <!-- container section start --> <jsp:include
		page="/WEB-INF/jsp/components/defaultScript.jsp" /> </section>
	<!-- container section start -->
</body>
</html>