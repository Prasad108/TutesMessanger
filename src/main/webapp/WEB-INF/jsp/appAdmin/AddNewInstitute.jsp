<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
 	<title>App Admin</title>
 
   <jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
  </head>
<body>
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/appAdmin/components/appAdminMenu.jsp" /> 

 
 <!-- Default Containt -->
   <aside>
  <section id="main-content">
          <section class="wrapper">  
          <c:if test="${!empty ErrorMessage}">
  					  <div class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                <strong> ${ErrorMessage} </strong> 
                              </div>
		</c:if>
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                            Add Institute
                          </header>
                          <div class="panel-body">
                              <div class="form">
                                 <form:form class="form-validate form-horizontal " id="register_form" method="post" action="RegisterInstitute" modelAttribute="Institute">
                                      <div class="form-group ">
                                          <label for="fullname" class="control-label col-lg-2">Institute Name <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="name" class=" form-control" id="fullname" name="fullname" type="text" autocomplete="off" required="required" maxlength="50"/>
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
              
              
             
               </aside>
              <!-- page end-->
 </section>
 

 
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>