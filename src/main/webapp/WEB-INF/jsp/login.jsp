<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%--  <jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> --%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">
   

    <!-- Bootstrap CSS -->    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
  
     <style>

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            width: 100%;
        }

        body {
            display: table;
        }

        .my-block {
            text-align: center;
            display: table-cell;
            vertical-align: middle;
        }
        </style>
</head>

  <body class="login-img3-body" onload='document.loginForm.username.focus();'>

    <div class="container">
      
      <form class="login-form" name='loginForm' action="<c:url value='/login' />" method='POST'> 
			      
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <input type="text" name='username' class="form-control" placeholder="Username" required="required" autofocus>
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" name='password' class="form-control" placeholder="Password" required="required" >
            </div>
           
             <c:if  test="${not empty error}">  <%-- test="${!empty ErrorMessage}"> --%>
  					  <div class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  ${error}
                     </div>
			</c:if>
			
			 <c:if test="${not empty msg}">  <%-- test="${!empty ErrorMessage}"> --%>
  					 <div class="alert alert-success fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                    ${msg}
                              </div>
			</c:if>
			
            <label class="checkbox">
                <input type="checkbox" name="remember-me" > <!-- value="remember-me" -->Remember me
                <span class="pull-right"> <a href="#"> Forgot Password?</a></span>
            </label>
            <button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>
            <a class="btn btn-info btn-lg btn-block" data-toggle="modal" href="#myModal" > Signup</a>
            
             <!-- Modal -->
                              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog">
                                      <div class="modal-content">
                                          <div class="modal-header">
                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                              <h4 class="modal-title">Modal Tittle</h4>
                                          </div>
                                          <div class="modal-body">
													<div class="my-block">
													            <div class="credits">
													                <!-- 
													                    All the links in the footer should remain intact. 
													                    You can delete the links only if you purchased the pro version.
													                    Licensing information: https://bootstrapmade.com/license/
													                    Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
													                -->
													                <a class="btn btn-success"  href="RegisterStudent"> I'm Student</a>&nbsp&nbsp&nbsp&nbsp/&nbsp&nbsp&nbsp&nbsp         
													                 <a class="btn btn-warning"  href="RegisterTeacher">
													                               I'm Teacher</a>
													            </div>
													        </div>

                                          </div>
                                          <div class="modal-footer">
                                              <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                                             
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <!-- modal -->
        </div>
        <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
      </form>
      </div>
    <div class="text-right">
            <div class="credits">
                <!-- 
                    All the links in the footer should remain intact. 
                    You can delete the links only if you purchased the pro version.
                    Licensing information: https://bootstrapmade.com/license/
                    Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
                -->
                <a href="https://bootstrapmade.com/free-business-bootstrap-themes-website-templates/">Business Bootstrap Themes</a> by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
        </div>
   

<%-- <jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" /> --%>
  <!-- javascripts -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
   <!--  nice scroll -->
 <!--    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script> -->
    <!-- gritter -->  
  </body>
</html>