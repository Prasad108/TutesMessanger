<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 		<title>blank </title>
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
      <section id="main-content">
          <section class="wrapper">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa fa-bars"></i> Pages</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
						<li><i class="fa fa-bars"></i>Pages</li>
						<li><i class="fa fa-square-o"></i>Pages</li>
					</ol>
				</div>
			</div>
              <!-- page start-->
              Page content goes here
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
 	</section>
  				<!-- container section start -->
				<jsp:include page="/WEB-INF/jsp/template/components/templateScript.jsp" />

</body>
</html>