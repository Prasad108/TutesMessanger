<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl">
	<head>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
 		<title>Teacher </title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />
   		
   	   <script type="text/javascript">
   	   
   	   
   	 $(document).ready(function(){
   		 
   		$('#submitChangePassword').attr('disabled','disabled'); 
   		
   		$('#confirmPassword').keyup(function(){
   			var password=$("#newPassword").val();
   			var confirm_password=$("#confirmPassword").val();
   			
   			if(confirm_password == password)
   			{
   				$("#message").text("Both Password are matching");
   				$('#submitChangePassword').removeAttr('disabled');
   				$('#message').css('color', 'green');
   			}
   			else
   			{
   				$("#message").text("Both Password are not matching");	
   				$('#submitChangePassword').attr('disabled','disabled');
   				$('#message').css('color', 'red');
   			}
   			
   		});
   		 
     	/* var check = function() {
   	    if (document.getElementById('newPassword').value ==
   	    document.getElementById('confirmPassword').value) {
   	    document.getElementById('message').style.color = 'green';
   	    document.getElementById('message').innerHTML = 'matching with your new password';
   	  $('#submitChangePassword').removeAttr('disabled'); 
   	  } else {
   	    document.getElementById('message').style.color = 'red';
   	    document.getElementById('message').innerHTML = 'not matching with your new password';
   	    $('#submitChangePassword').attr('disabled','disabled'); 
   	    
   	  }
   	} */
     });
   	   </script> 
     
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
          	<h1> Change UserName/Password Page</h1>
          	
            <c:if test="${!empty wrongCurrentUserName}">
  					  <div class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  ${wrongCurrentUserName}
                              </div>
		     </c:if>
		     
		      <c:if test="${!empty userNameChangeSuccess}">
  					  <div class="alert alert-success fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>${userNameChangeSuccess}</strong> 
                              </div>
		</c:if>
		
		 <c:if test="${!empty wrongPassword}">
  					  <div class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  ${wrongPassword}
                              </div>
		     </c:if>
		     
		      <c:if test="${!empty passwordChangeSuccess}">
  					  <div class="alert alert-success fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>${passwordChangeSuccess}</strong> 
                              </div>
		</c:if>
		<!--collapse start-->
		<div class="panel-group m-bot20" id="accordion">
			<div class="panel panel-success ">
				<div class="panel-heading">
					<h3>
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordion" href="#collapseOne"> Change UserName
						</a>
					</h3>
				</div>

				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
						<form:form action="changeTUsername" method="post">

							<h1 class="login-img" align="middle">
								<i class="icon_lock_alt"></i>
							</h1>
							<div class="input-group">
								<span class="input-group-addon"><i class="icon_profile"></i></span>
								<input type="text" class="form-control" id="currentUsername"
									name="currentUsername" placeholder="Current Username"
									required="required" maxlength="30" />
							</div>
							<br>
							<div class="input-group">
								<span class="input-group-addon"><i class="icon_key_alt"></i></span>
								<input type="text" class="form-control" id="newUsername"
									name="newUsername" placeholder="New Username"
									required="required"
									pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}"
									title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
									maxlength="30" />
							</div>
							<br>
							<button class="btn btn-info btn-lg btn-block" type="submit">Change
								Username</button>


						</form:form>
					</div>
				</div>
			</div>
	
			
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3>
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordion" href="#collapseThree"> Change Password
						</a>
					</h3>
				</div>
			</div>

			<div id="collapseThree" class="panel-collapse collapse">
				<div class="panel-body">
					<form:form action="changeTPassword" method="post">

						<h1 class="login-img" align="middle">
							<i class="icon_lock_alt"></i>
						</h1>
						<div class="input-group">
							<span class="input-group-addon"><i class="icon_profile"></i></span>
							<input type="text" class="form-control" id="currentPassword"
								name="currentPassword" placeholder="Current Password"
								required="required" maxlength="30"/>
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon"><i class="icon_key_alt"></i></span>
							<input type="password" class="form-control" id="newPassword"
								name="newPassword" placeholder="New Password"
								required="required"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}"
								title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
								maxlength="30" onkeyup='check();'/>
						</div>
                         
                         <br>
						<div class="input-group">
							<span class="input-group-addon"><i class="icon_key_alt"></i></span>
							<input type="password" class="form-control" id="confirmPassword"
								name="confirmPassword" placeholder="Confirm Password"
								required="required"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{5,}"
								title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
								maxlength="30" onkeyup='check();'/>
						</div>
						<span id='message' style="margin-left: 40px"></span>
						<br>



						<button class="btn btn-info btn-lg btn-block" id="submitChangePassword" type="submit">Change
							Password</button>


					</form:form>
				</div>
			</div>
		</div>

		<!--collapse end-->

	</div>
          </section>
 </section>   
    
   	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<!-- bootstrap -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
     <!-- nice scroll -->
    <script src="${pageContext.request.contextPath}/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.js" type="text/javascript"></script>
   
   
  <!--   <!-- custom select -->
    <script src="${pageContext.request.contextPath}/js/jquery.customSelect.min.js" ></script>
	<script src="${pageContext.request.contextPath}/assets/chart-master/Chart.js"></script> -->
   
    <!--custome script for all page-->
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
   
   

   </section>
 <!-- container section start -->
  </body>
</html>