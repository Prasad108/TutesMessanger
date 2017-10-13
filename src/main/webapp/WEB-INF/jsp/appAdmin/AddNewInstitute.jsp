<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
 	<title>App Admin</title>
 
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="/TutesMessanger/img/favicon.png">
    
<!-- Bootstrap CSS -->    
    <link href="/TutesMessanger/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="/TutesMessanger/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="/TutesMessanger/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="/TutesMessanger/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="/TutesMessanger/css/style.css" rel="stylesheet">
    <link href="/TutesMessanger/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->
   
     <link rel="stylesheet" href="/TutesMessanger/css/pikaday.css">
  
      
   
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
                                          <label for="fullname" class="control-label col-lg-2">Institute Address <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="address" class=" form-control" id="address" name="address" type="text" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                           <label for="fullname" class="control-label col-lg-2">Contact Number <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="contactno" class=" form-control" id="contactno" name="contactno" type="text" pattern="[789][0-9]{9}" title="Please enter Valid contact number" autocomplete="off" required="required" maxlength="12"/>
                                          </div>
                                          <label for="fullname" class="control-label col-lg-2">Email Id <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="email" class=" form-control" id="email" name="email" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                          <label for="fullname" class="control-label col-lg-2">Subscription till<span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="subscriptionTill" class=" form-control" id="datepicker-topleft-forreal"  name="subscriptionTill" type="text" autocomplete="off" required="required" />
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
<script src="/TutesMessanger/js/jquery.js"></script>
	<script src="/TutesMessanger/js/jquery-ui-1.10.4.min.js"></script>
    <script src="/TutesMessanger/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="/TutesMessanger/js/jquery-ui-1.9.2.custom.min.js"></script>
    <!-- bootstrap -->
    <script src="/TutesMessanger/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="/TutesMessanger/js/jquery.scrollTo.min.js"></script>
    <script src="/TutesMessanger/js/jquery.nicescroll.js" type="text/javascript"></script>
   
   
    <!--custome script for all page-->
    <script src="/TutesMessanger/js/scripts.js"></script>
   </section>
 <!-- container section start -->
   <script src="/TutesMessanger/js/pikaday.js"></script>
    <script>

    var picker = new Pikaday(
    {
        field: document.getElementById('datepicker'),
        firstDay: 1,
        minDate: new Date(),
        maxDate: new Date(2020, 12, 31),
        yearRange: [2000,2020]
    });

    </script>
    <script>

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
    
 
  </body>
</html>