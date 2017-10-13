<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


   <jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />
  
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
<body>
<body class="login-img3-body" onload='document.loginForm.username.focus();'>

    <div class="container">
    <div class="card card-container">
    
  <form:form class="login-form"  method="post" action="Checklogin" modelAttribute="Login" >        
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <form:input type="text" path="username" name="username" class="form-control" placeholder="Username" required="required" />
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <form:input type="password" path="password" name="password" class="form-control" placeholder="Password" required="required" />
            </div>
            
           <c:if test="${!empty ErrorMessage}">
  					  <div class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  ${ErrorMessage}
                              </div>
		</c:if>
            
            <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me1
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
        
      </form:form>
      
      
      <c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
      
     <form name='loginForm'
			action="<c:url value='/j_spring_security_check' />" method='POST'>
			        
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <form:input type="text" type='text' name='username' class="form-control" placeholder="Username" required="required" />
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <form:input type='password' name='password' class="form-control" placeholder="Password" required="required" />
            </div>
            
            
            
            	<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
				
				
            
           <c:if test="${!empty ErrorMessage}">
  					  <div class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  ${ErrorMessage}
                              </div>
		</c:if>
            
            <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me1
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
    </div>
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
     <jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />
  
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
   

<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
  </body>
</html>