<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl">
	<head>
 		<title>Teacher </title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />
   	</head>
<body>
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" /> 

 <section id="main-content">
          <section class="wrapper">
          <div class="row">
          	<h1> Change Password Page</h1>
          	
          	<form:form class="login-form"  method="post" >        
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <input type="password" class="form-control" id="oldPassword" name="oldPassword" placeholder="Old Password" required="required" />
            
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="New Password" required="required"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" maxlength="15" />
            </div>
           <c:if test="${!empty ErrorMessage}">
  					  <div class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  ${ErrorMessage}
                              </div>
		</c:if>
            
          
            <button class="btn btn-info btn-lg btn-block" type="submit">Change</button>
        </div>
        
      </form:form>
          	
          </div>
          </section>
 </section>   
    
   	<script src="/TutesMessanger/js/jquery.js"></script>
	<!-- bootstrap -->
    <script src="/TutesMessanger/js/bootstrap.min.js"></script>
     <!-- nice scroll -->
    <script src="/TutesMessanger/js/jquery.scrollTo.min.js"></script>
    <script src="/TutesMessanger/js/jquery.nicescroll.js" type="text/javascript"></script>
   
   
  <!--   <!-- custom select -->
    <script src="/TutesMessanger/js/jquery.customSelect.min.js" ></script>
	<script src="/TutesMessanger/assets/chart-master/Chart.js"></script> -->
   
    <!--custome script for all page-->
    <script src="/TutesMessanger/js/scripts.js"></script>
   
   

   </section>
 <!-- container section start -->
  </body>
</html>