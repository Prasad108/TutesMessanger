<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Schedule</title>
<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>



<script>
$(document).ready(function(){


	
	$(".showDivsionsSchedule").click(function(){
	     var id = this.id;

	     $.get("GetCalender?DivisionId="+id, function (data, status) {
	            if (status == "success") {
	            	$("#show_calender").empty();
	               	$("#show_calender").html(data); 
	             } 
}); 
	  
	});

	


	$(".editDivsionsSchedule").click(function(){
	     var id = this.id;
	    
	});

	


	$(".divisionSchedule").click(function(){
	     var id = this.id;

	     $('.showDivsionsSchedule').attr('id', id);
	     $('.editDivsionsSchedule').attr('id', id);
	     
	    
	});
	
	


});

</script>

<style type="text/css"> 

.responsiveCal {
 
position: relative; padding-bottom: 75%; height: 0; overflow: hidden;
 
}
 
.responsiveCal iframe {
 
position: absolute; top:0; left: 0; width: 100%; height: 100%;
 
}
   		
   		
   		</style>
   		

<style type="text/css">


   		



				/*Now the CSS*/
				* {margin: 0; padding: 0;}
				
				.tree ul {
					padding-top: 20px; position: relative;
					
					transition: all 0.5s;
					-webkit-transition: all 0.5s;
					-moz-transition: all 0.5s;
				}
				
				.tree li {
					float: left; text-align: center;
					list-style-type: none;
					position: relative;
					padding: 20px 5px 0 5px;
					
					transition: all 0.5s;
					-webkit-transition: all 0.5s;
					-moz-transition: all 0.5s;
				}
				
				/*We will use ::before and ::after to draw the connectors*/
				
				.tree li::before, .tree li::after{
					content: '';
					position: absolute; top: 0; right: 50%;
					border-top: 1px solid #ccc;
					width: 50%; height: 20px;
				}
				.tree li::after{
					right: auto; left: 50%;
					border-left: 1px solid #ccc;
				}
				
				/*We need to remove left-right connectors from elements without 
				any siblings*/
				.tree li:only-child::after, .tree li:only-child::before {
					display: none;
				}
				
				/*Remove space from the top of single children*/
				.tree li:only-child{ padding-top: 0;}
				
				/*Remove left connector from first child and 
				right connector from last child*/
				.tree li:first-child::before, .tree li:last-child::after{
					border: 0 none;
				}
				/*Adding back the vertical connector to the last nodes*/
				.tree li:last-child::before{
					border-right: 1px solid #ccc;
					border-radius: 0 5px 0 0;
					-webkit-border-radius: 0 5px 0 0;
					-moz-border-radius: 0 5px 0 0;
				}
				.tree li:first-child::after{
					border-radius: 5px 0 0 0;
					-webkit-border-radius: 5px 0 0 0;
					-moz-border-radius: 5px 0 0 0;
				}
				
				/*Time to add downward connectors from parents*/
				.tree ul ul::before{
					content: '';
					position: absolute; top: 0; left: 50%;
					border-left: 1px solid #ccc;
					width: 0; height: 20px;
				}
				
				.tree li a{
					border: 1px solid #ccc;
					padding: 5px 10px;
					text-decoration: none;
					color: #666;
					font-family: arial, verdana, tahoma;
					font-size: 11px;
					display: inline-block;
					
					border-radius: 5px;
					-webkit-border-radius: 5px;
					-moz-border-radius: 5px;
					
					transition: all 0.5s;
					-webkit-transition: all 0.5s;
					-moz-transition: all 0.5s;
				}
				
				/*Time for some hover effects*/
				/*We will apply the hover effect the the lineage of the element also*/
				.tree li a:hover, .tree li a:hover+ul li a {
					background: #c8e4f8; color: #000; border: 1px solid #94a0b4;
				}
				/*Connector styles on hover*/
				.tree li a:hover+ul li::after, 
				.tree li a:hover+ul li::before, 
				.tree li a:hover+ul::before, 
				.tree li a:hover+ul ul::before{
					border-color:  #94a0b4;
				}
				
				/*Thats all. I hope you enjoyed it.
				Thanks :)*/

 </style>
</head>
<body>
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" /> 

 <section id="main-content">
          <section class="wrapper">
          <div class="row">
          	<h1> Select division to see or modify schedule </h1>
          	<div class="tree">
          	 ${structure}
          	 
          	 
          	 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog">
                                      <div class="modal-content">
                                          <div class="modal-header">
                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                              <h4 class="modal-title">Modal Tittle</h4>
                                          </div>
                                          <div class="modal-body">

                                             <a class="btn btn-success showDivsionsSchedule" href="#">View Schedule</a>
                                             <a class="btn btn-warning editDivsionsSchedule"  href="#">Edit/Add Schedule</a>

                                          </div>
                                          <div class="modal-footer">
                                              <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                                             
                                          </div>
                                      </div>
                                  </div>
                              </div>
          	</div>
          	
          	<div id="show_calender" class="googleCalendar">
 <iframe src="https://calendar.google.com/calendar/embed?mode=WEEK&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=ci5fi0t0u5i8927il2ula0kbgs%40group.calendar.google.com&amp;color=%2329527A&amp;ctz=Asia%2FCalcutta" style="border:solid 1px #777" width="800" height="600" frameborder="0" scrolling="no"></iframe>
</div> 
          </div>
          </section>
 </section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>