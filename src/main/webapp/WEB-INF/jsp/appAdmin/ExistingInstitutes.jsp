<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>App Admin</title>

 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.png">
    
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
    
	
	
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/pikaday.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pikaday.css">   
  
  
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){


	$('#instId').attr('readonly','readonly'); 
	

		$('.instEdit').on('click',function(){
			// for parsing the date
			var from =$(this).closest('tr').children()[6].textContent.split("-");//date table column
						
			var date = new Date(from[2], from[1] - 1, from[0]);
			
		
			 $("#instId").val($(this).closest('tr').children()[1].textContent);
			 $("#instName").val($(this).closest('tr').children()[2].textContent);
			 $("#instAddress").val($(this).closest('tr').children()[5].textContent);
			 $("#instContactno").val($(this).closest('tr').children()[4].textContent);
			 $("#instEmail").val($(this).closest('tr').children()[3].textContent);
			 $(".instdate").val(date);
			
		
		
		   
		});

});


</script>
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
                                  <strong>${SuccessMessage}</strong> 
                              </div>
		</c:if>		
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading no-border">
                              Institutes
                          </header>
                         
                           <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                               <th>Sr.No</th>
                                <th>Id</th>
                                 <th><i class="icon_profile"></i> Institute Name</th>
                                  <th><i class="icon_mail_alt"></i> Email</th>
                                   <th><i class="icon_mobile"></i> Mobile</th>
                                  <th><i class="icon_pin_alt"></i> Address</th>   
                                   <th><i class="icon_calendar"></i> Date</th>                               
                                  <th><i class="icon_cogs"></i> Action</th>
                              </tr>
                              <c:forEach items="${listOfInstitute}" var="institute" >
                            <c:set var="count" value="${count + 1}" scope="page"/>
                              <tr>
                                  <td>${count}</td>
                                    <td>${institute.id}</td>
                                  <td>${institute.name}</td>
                                  
                                   <td>${institute.email}</td>
                                   <td>${institute.contactno}</td>
                                   <td>${institute.address}</td>
                                  
                                  <td> <fmt:formatDate value="${institute.subscriptionTill}" pattern="dd-MM-yyyy" /></td>
                                   <td>
                                  <div class="btn-group">
                                  
                                      <a class="btn btn-primary tooltips instEdit" title="" data-toggle="modal" data-placement="left" data-original-title="Edit Institute"  href="#editInstituteModal" ><i class="icon_plus_alt2"></i></a>
                                    
                                      <a class="btn btn-success tooltips" title="" data-toggle="tooltip" data-placement="top" data-original-title="Enable Institute" href="#"><i  class="icon_check_alt2 " ></i></a>
                                      <a class="btn btn-danger tooltips" title="Disable Institute" data-toggle="tooltip" data-placement="right"  href="#"><i class="icon_close_alt2"></i></a>
                                       <!-- Modal -->
		                              <div class="modal fade" id="editInstituteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		                                  <div class="modal-dialog">
		                                      <div class="modal-content">
		                                          <div class="modal-header">
		                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                                              <h4 class="modal-title">Modify Institute</h4>
		                                          </div>
		                                          <div class="modal-body">
												
														<div class="row">
										                  <div class="col-lg-12">
										                      <section class="panel">
										                          <header class="panel-heading">
										                          Make Changes To Institute
										                          </header>
										                          <div class="panel-body">
										                              <div class="form">
										                                 <form:form class="form-validate form-horizontal " id="register_form" method="post" action="updateInstitute" modelAttribute="Institute">
										                                      <div class="form-group ">
										                                      	
										                                      	 <br></br>
										                                          <label for="fullname" class="control-label col-lg-2">Institute Id </label>
										                                           <br></br>
										                                           <div class="col-lg-10">
										                                              <form:input path="id" class=" form-control" id="instId" name="fullname" type="text" autocomplete="off" required="required" maxlength="50" readonly="readonly"  />
										                                          </div>
										                                      	<br></br>
										                                          <label for="fullname" class="control-label col-lg-2">Institute Name <span class="required">*</span></label>
										                                           <br></br>
										                                           <div class="col-lg-10">
										                                              <form:input path="name" class=" form-control" id="instName" name="fullname" type="text" autocomplete="off" required="required" maxlength="50"/>
										                                          </div>
										                                          <br></br>
										                                          <label for="fullname" class="control-label col-lg-2">Institute Address <span class="required">*</span></label>
										                                           <br></br>
										                                           <div class="col-lg-10">
										                                              <form:input path="address" class=" form-control" id="instAddress" name="address" type="text" autocomplete="off" required="required" maxlength="50"/>
										                                          </div>
										                                          <br></br>
										                                           <label for="fullname" class="control-label col-lg-2">Contact Number <span class="required">*</span></label>
										                                           <br></br>
										                                           <div class="col-lg-10">
										                                              <form:input path="contactno" class=" form-control" id="instContactno" name="contactno" type="text" pattern="[789][0-9]{9}" title="Please enter Valid contact number" autocomplete="off" required="required" maxlength="12"/>
										                                          </div>
										                                          <br></br>
										                                          <label for="fullname" class="control-label col-lg-2">Email Address <span class="required">*</span></label>
										                                           <br></br>
										                                          <div class="col-lg-10">
										                                              <form:input path="email" class=" form-control" id="instEmail" name="instEmail" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" autocomplete="off" required="required" maxlength="50"/>
										                                          </div>
										                                          <br></br>
										                                          <label for="fullname" class="control-label col-lg-2">Subscription till<span class="required">*</span></label>
										                                          <br></br>
										                                          <div class="col-lg-10">
										                                              <form:input path="subscriptionTill" class=" form-control instdate" id="datepicker-topleft-forreal"  name="subscriptionTill" type="text" autocomplete="off" required="required" />
										                                          </div>
										                                      </div>
										                                    
										                                      <div class="form-group">
										                                          <div class="col-lg-offset-2 col-lg-10">
										                                              <button class="btn btn-primary" type="submit">Update</button>
										                                                                                      </div>
										                                      </div>
										                                  </form:form>
										                              </div>
										                          </div>
										                      </section>
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
                                  </td>
                                   
                                  
                              
                                  
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
 


	
	</section>
	
	 <script>

	  var picker = new Pikaday(
			    {
			        field: document.getElementById('datepicker'),
			        firstDay: 1,
			        minDate: new Date(),
			        maxDate: new Date(2020, 12, 31),
			        yearRange: [2000,2020]
			    });

			   

			    // default: bottom left
			    new Pikaday(
			    {
			        field: document.getElementById('datepicker')
			    });

			    new Pikaday(
			    {
			        field: document.getElementById('datepicker-topleft'),
			        position: 'top left'
			    });

			    new Pikaday(
			    {
			        field: document.getElementById('datepicker-topleft-forreal'),
			        position: 'top left'
			    });

			    new Pikaday(
			    {
			        field: document.getElementById('datepicker-topright'),
			        position: 'top right'
			    });

			    new Pikaday(
			    {
			        field: document.getElementById('datepicker-topright-forreal'),
			        position: 'top right'
			    });

			    new Pikaday(
			    {
			        field: document.getElementById('datepicker-bottomright'),
			        position: 'bottom right'
			    });

			    new Pikaday(
			    {
			        field: document.getElementById('datepicker-bottomright-forced'),
			        position: 'bottom right',
			        reposition: false
			    });

			    new Pikaday(
			    {
			        field: document.getElementById('datepicker-bottomright-forreal'),
			        position: 'bottom right'
			    });

			    new Pikaday(
			    {
			        field: document.getElementById('datepicker-auto'),
			    });

    </script>
    
    

  	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui-1.9.2.custom.min.js"></script>
    <!-- bootstrap -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="${pageContext.request.contextPath}/js/jquery.scrollTo.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.nicescroll.js" type="text/javascript"></script>
   
   
    <!--custome script for all page-->
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
   
	
    	
</body>
</html>