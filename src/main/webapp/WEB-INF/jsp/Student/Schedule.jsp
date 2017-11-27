<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Student Schedule</title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
		
		<style type="text/css"> 
			
						.googleCalendar{
									  position: relative;
									  height: 0;
									  width: 100%;
									  padding-bottom: 100% ;
									}
									
				.googleCalendar iframe{
									  position: absolute;
									  top: 0;
									  left: 0;
									  width: 100%;
									  height: 100%;
									}
   		
   		
   		</style>
   		
</head>
<body>

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Student/components/studentMenu.jsp" />  
<!-- <div ng-include="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp"></div> -->

 <section id="main-content">
          <section class="wrapper">
          <div class="row">
	          	<h1> Student Schedule</h1>  
	          	 <c:if test="${!empty scheduleNotFound}">
  					  <div class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                <strong> ${scheduleNotFound} </strong> 
                              </div>
			</c:if>
			
			<c:if test="${!empty scheduleErrorNoDivisionAssigned}">
  					  <div class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                <strong> ${scheduleErrorNoDivisionAssigned} </strong> 
                              </div>
			</c:if>
			
			
			<c:if test="${!empty schedule}">
			 <div id="show_calender" class="googleCalendar" style="text-align: center;" >
			 ${schedule}
			 </div>
  					 
			</c:if>
			
	                  	
	          	            
          </div>
          </section>
 </section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>