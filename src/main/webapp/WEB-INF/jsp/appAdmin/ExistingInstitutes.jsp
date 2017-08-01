<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>App Admin</title>

<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />

</head>
<body>
	<section id="container" class=""> <!-- Default header --> <jsp:include
		page="/WEB-INF/jsp/components/defaultHeader.jsp" /> <!-- App admin  Menu -->
	<jsp:include page="/WEB-INF/jsp/appAdmin/components/appAdminMenu.jsp" />



	   <aside>
  <section id="main-content">
          <section class="wrapper">  
           <c:if test="${!empty SuccessMessage}">
  					  <div class="alert alert-success fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>Institute saved successfully</strong> 
                              </div>
		</c:if>		
              <div class="row">
                  <div class="col-sm-6">
                      <section class="panel">
                          <header class="panel-heading no-border">
                              Institutes
                          </header>
                         
                           <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                               <th>Sr.No</th>
                                 <th><i class="icon_profile"></i> Institute Name</th>
                                  <th><i class="icon_mail_alt"></i> Email</th>
                                   <th><i class="icon_mobile"></i> Mobile</th>
                                  <th><i class="icon_pin_alt"></i> Address</th>                                       
                                  <th><i class="icon_cogs"></i> Action</th>
                              </tr>
                              <c:forEach items="${listOfInstitute}" var="institute" >
                        
                              <tr>
                                  <td>${count}</td>
                                  <td>${institute.name}</td>
                                   <td>${institute.email}</td>
                                   <td>${institute.contactno}</td>
                                   <td>${institute.address}</td>
                                   <td>
                                  <div class="btn-group">
                                      <a class="btn btn-primary" href="#"><i class="icon_plus_alt2"></i></a>
                                      <a class="btn btn-success" href="#"><i class="icon_check_alt2"></i></a>
                                      <a class="btn btn-danger" href="#"><i class="icon_close_alt2"></i></a>
                                  </div>
                                  </td>
                                   
                                  
                                  <c:set var="count" value="${count + 1}" scope="page"/>
                                  
                              </tr>
                             
                              </c:forEach>
                                                     
                           </tbody>
                        </table>
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