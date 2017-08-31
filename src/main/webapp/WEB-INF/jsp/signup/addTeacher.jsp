<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    
<!DOCTYPE html >
<html>
	<head>
 	<title>App Admin</title>
 
   <jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   
     <link rel="stylesheet" href="css/pikaday.css">
      <script src="js/jquery-1.8.3.min.js"></script>
    <script src="js/jquery-ui-1.10.4.min.js"></script>
     
     <script>
    
    
    $(document).ready(function () {

    $('#myform').validate({
        rules: {
            BusinessDistrictId: {
                required: true
            }
        },
        submitHandler: function (form) { // for demo
            
            return false;
        }
    });

});
    
    
   /*  $(document).ready(function(){
    	
    	$('#savebtn').attr('disabled','disabled'); 
    	
    	$('#institutelist').change(function() {
 	   	   

   	   	 var  others = $(this).find(":selected").val();
   	        if(others != 0){      	        		            
   	   		     $('#savebtn').removeAttr('disabled');    	   		     	                      
   	         }else{   		          
   		         $('#savebtn').attr('disabled','disabled');   		     
   		        }  
   	          
   	   	});

    	
    	
  	}); */
    </script>	
    
   
      
   
  </head>
<body>
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<%-- <jsp:include page="/WEB-INF/jsp/appAdmin/components/appAdminMenu.jsp" /> 
 --%>
 
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
                           Register Teacher
                          </header>
                          <div class="panel-body">
                              <div class="form">
                            <%--      <form:form class="form-validate form-horizontal " id="register_form" method="post" action="RegisterInstitute" modelAttribute="Institute"> --%>
                                 <form:form class="form-validate form-horizontal " id="myform" method="post" action="SaveTeacher" modelAttribute="Teacher">
                                      <div class="form-group ">
                                          <label for="firstname" class="control-label col-lg-2">First Name <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="fname" class=" form-control" id="firstname" name="firstname" type="text" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                           <label for="lastname" class="control-label col-lg-2">Last Name <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="lname" class=" form-control" id="lastname" name="lastname" type="text" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                           <label for="email" class="control-label col-lg-2">Email Id <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="email" class=" form-control" id="email" name="email" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" autocomplete="off" required="required" maxlength="50"/>
                                          </div>
                                           <label for="contact" class="control-label col-lg-2">Contact Number <span class="required">*</span></label>
                                          <div class="col-lg-10">
                                              <form:input path="contactno" class=" form-control" id="contactno" name="contactno" type="text" pattern="[789][0-9]{9}" title="Please enter Valid contact number" autocomplete="off" required="required" maxlength="12"/>
                                          </div>
                                          
                                          
                                            <label for="contact" class="control-label col-lg-2">Institute <span class="required">*</span></label>
                                          
												<div class="col-lg-10">
													<form:select name="BusinessDistrictId" path="institute.id" id="institutelist" class="form-control" onchange="" form="SelectInstitute" required="required">
														<option value="">None</option>
														<c:forEach items="${teacherlist}" var="institute">
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
 

 
     <!-- container section start -->
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