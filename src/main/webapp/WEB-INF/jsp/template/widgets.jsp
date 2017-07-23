<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 		<title>widgets </title>
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
					<h3 class="page-header"><i class="icon_genius"></i> Widgets</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
						<li><i class="icon_genius"></i>Widgets</li>
						
				</div>
			</div>
              <div class="row">
                  <div class="col-lg-4">
                      <section class="panel">
                          <header class="panel-heading">
                              Basic items
                          </header>
                          <ul class="list-group">
                              <li class="list-group-item">Lorem ipsum dolor sit amet</li>
                              <li class="list-group-item">Praesent tempus eleifend risus</li>
                              <li class="list-group-item">Praesent tempus eleifend risus</li>
                              <li class="list-group-item">Porta ac consectetur ac</li>
                              <li class="list-group-item">Vestibulum at eros</li>
                              <li class="list-group-item">Vestibulum at eros</li>
                          </ul>
                      </section>
                  </div>
                  <div class="col-lg-4">
                      <section class="panel">
                          <header class="panel-heading">
                              Linked items
                          </header>
                          <div class="list-group">
                              <a class="list-group-item " href="#">
                                  Lorem ipsum dolor sit amet
                              </a>
                              <a class="list-group-item active" href="javascript:;">Praesent tempus eleifend risus</a>
                              <a class="list-group-item" href="javascript:;">Praesent tempus eleifend risus</a>
                              <a class="list-group-item" href="javascript:;">Porta ac consectetur ac</a>
                              <a class="list-group-item" href="javascript:;">Vestibulum at eros</a>
                              <a class="list-group-item" href="javascript:;">Vestibulum at eros</a>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-4">
                      <section class="panel">
                          <header class="panel-heading">
                              Custom content
                          </header>
                          <div class="list-group">
                              <a class="list-group-item " href="javascript:;">
                                  <h4 class="list-group-item-heading">List group item heading</h4>
                                  <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                              </a>
                              <a class="list-group-item active" href="javascript:;">
                                  <h4 class="list-group-item-heading">List group item heading</h4>
                                  <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                              </a>
                              <a class="list-group-item" href="javascript:;">
                                  <h4 class="list-group-item-heading">List group item heading</h4>
                                  <p class="list-group-item-text">Donec id elit non mi porta gravida at eget metus. Maecenas sed diam eget risus varius blandit.</p>
                              </a>
                          </div>
                      </section>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
 	</section>
  				<!-- container section start -->
				<jsp:include page="/WEB-INF/jsp/template/components/templateScript.jsp" />

</body>
</html>