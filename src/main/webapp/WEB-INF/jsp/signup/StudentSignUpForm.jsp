<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student SignUp Page</title>
 <jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />
 <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery-ui-1.10.4.min.js"></script>
</head>
<body>
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 



<!-- Default Containt -->
   <aside>
  <section id="main-content">
          <section class="wrapper">  
          <h1>Student Sign UP form </h1>
                  <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                           Register Teacher
                          </header>
                          <div class="panel-body">
                              <div class="form">
                            <%--      <form:form class="form-validate form-horizontal " id="register_form" method="post" action="RegisterInstitute" modelAttribute="Institute"> --%>
                                 <form:form class="form-validate form-horizontal " id="myform" method="post" action="SaveStudent" modelAttribute="Student">
                                      <div class="form-group ">
                                          <label for="firstname" class="control-label col-lg-2">First Name <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="fname" class=" form-control" id="firstname" name="firstname" type="text" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                          <br><br/>
                                          <label for="lastname" class="control-label col-lg-2">Middle(Father's) Name <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="father" class=" form-control" id="lastname" name="lastname" type="text" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                           <br><br/>
                                           <label for="lastname" class="control-label col-lg-2">Last Name <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="lname" class=" form-control" id="lastname" name="lastname" type="text" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                           <br><br/>
                                           <label for="email" class="control-label col-lg-2">Student Email Id <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="email" class=" form-control" id="email" name="email" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                           <br><br/>
                                           <label for="contact" class="control-label col-lg-2">Student Contact No.<span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="contactno" class=" form-control" id="contactno" name="contactno" type="text" pattern="[789][0-9]{9}" title="Please enter Valid contact number" autocomplete="off" required="required" maxlength="12"/>
                                          </div>
                                          
                                           <br><br/>
                                           <label for="email" class="control-label col-lg-2">Parents Email Id <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="parent.email" class=" form-control" id="email" name="email" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                           <br><br/>
                                           <label for="contact" class="control-label col-lg-2">Parents Contact No.<span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="parent.contactno" class=" form-control" id="contactno" name="contactno" type="text" pattern="[789][0-9]{9}" title="Please enter Valid contact number" autocomplete="off" required="required" maxlength="12"/>
                                          </div>
                                          
                                           <br><br/>
                                            <label for="contact" class="control-label col-lg-2">Institute <span class="required">*</span></label>
                                          
												<div class="col-lg-10">
													<form:select name="BusinessDistrictId" path="institute.id" id="institutelist" class="form-control" onchange="" form="myform" required="required">
														<option value="">None</option>
														<c:forEach items="${institutelist}" var="institute">
															<option value="${institute.id}">${institute.name}</option>
														</c:forEach>
													</form:select>
												</div>
												
                                                                           
                                      
                                           
                                      </div>
                                    
                                      <div class="form-group">
                                          <div class="col-lg-offset-2 col-lg-10">
                                              <button id="savebtn" class="btn btn-primary" type="submit">Save</button>
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



<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />

<!-- container section start -->
   <script src="js/pikaday.js"></script>
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