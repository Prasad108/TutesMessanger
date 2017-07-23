<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 		<title>index </title>
   		<jsp:include page="/WEB-INF/jsp/template/components/templateHead.jsp" /> 
</head>
<body>

 				<!-- container section start -->
  <section id="container" class="">
		<jsp:include page="/WEB-INF/jsp/template/components/templateHeader.jsp" />
				<!--header end-->

				<!--sidebar start-->
		<aside>
			<jsp:include page="/WEB-INF/jsp/template/components/templateMenue.jsp" />

		</aside>
      			<!--sidebar end-->
      
        		<!--main content start-->
			<jsp:include page="/WEB-INF/jsp/template/components/templateMainContaint.jsp" />
 	</section>
  				<!-- container section start -->
				<jsp:include page="/WEB-INF/jsp/template/components/templateScript.jsp" />

</body>
</html>