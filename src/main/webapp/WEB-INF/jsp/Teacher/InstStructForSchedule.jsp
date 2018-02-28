<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Schedule</title>
<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>


<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />
<!-- <script>
/* $(document).ready(function(){

	$('#divId').attr('readonly','readonly'); 
	
	$(".showDivsionsSchedule").click(function(){
	     var id = this.id;
	     $('.modal').modal('hide');
		//alert("id of division is "+id)
		 $("#show_calender").html("");
					
					 $.get("GetCalender/"+id, function(data){
						
						 $("#show_calender").html("");
			            	//alert(data)
			               	$("#show_calender").html(data); 
					    
					});	

			});
	
	  



	$(".divisionSchedule").click(function(){
	     var id = this.id;

	     $('.showDivsionsSchedule').attr('id', id);
	     $('.editDivsionsSchedule').attr('id', id);
	     
	    
	});
	$(".divisionSchedule").click(function(){
	     var id = this.id;

	     $('.showDivsionsSchedule').attr('id', id);
	     $('.editDivsionsSchedule').attr('id', id);
	     
	    
	});
	

	$(".editDivsionsSchedule").click(function(){
	     var id = this.id;

	     $("#divId").val(id);	        	     
	    
	}); 

	 $("#divString").focusout(function () {

		var str = $(this).val();
		var res = str.replace('"', "'");
	    $(this).val(res);

	});

	 $("#Division_form").submit(function () {

			var str = $("#divString").val();
			var res = str.replace('"', "'");
		    $("#divString").val(res);

		   /*  var data0 = {id:  $("#divId").val(), string : $("#divString").val()};
		    alert(data0);

		    var json = JSON2.stringify(data0 ); 

		    
		    
		    $.ajax({
		    	 type: "POST",
		    	 url: "updateDivisionScheduleService",
		    	 data: json,
		    	 contentType: "application/json; charset=utf-8",
		    	 dataType: "json",
		    	 success: function(msg) {
		    	 alert('In Ajax'+msg);
		    	 }

		}); */
 */
	 
	
	 });	

	 

	 $("#myModal2").clickOutsideThisElement(function() {
		 $('.modal').modal('hide');
		 $('#myModal2').modal('hide');
		});

	 $("#divString").focusout(function () {

		var str = $(this).val();
		var res = str.replace('"', "'");
	    $(this).val(res);

	});

});

</script> -->
<script>
				var app=angular.module("myApp",[]);
				app.controller("teacherCtrl",function($scope,$http,$sce){
				
					$scope.teacher=JSON.parse('${teacherJSON}');
		   			$scope.permissions=JSON.parse('${permissions}');  				
		   			console.log("teacher is "+$scope.teacher);
		   			console.log("teacher id is "+$scope.teacher["id"]+"permissions are "+ $scope.permissions);  
		   			console.log($scope.permissions);
					
					
				    $scope.updateSuccess=false;
				    $scope.updateError=false;
					$scope.calender;
					console.log("inside controller");
					
					$scope.schedule={
							id:"",
							string:"",
							divName:"",
					}	
					
					
	/*-------------	 take divid from TeacherService------------------------------*/
					var divId;
					//var divisionName;
					$scope.viewSchedule=function(id){
					 divId=id;
					 console.log(id);
					
					// console.log(name);
					// divisionName=division;
					 console.log("if button clicked")
					  console.log(divId);
					// console.log(division);
					 $scope.schedule.id=id;
					 
											 
					};
					
			        
					 //var divisionName;
					$scope.viewName=function(Name)
					{
						console.log("inside name function");
						$scope.schedule.divName=Name;
						/* console.log(name);
						$scope.schedule.divName=name; */
						console.log($scope.schedule.divName);
						
					}; 
					
				//	console.log(divId);
					console.log($scope.schedule);
					
	/*----------------------	 function of view shcedule -----------------------------*/			
					$scope.viewSchedule1=function()
					{
						
						console.log("inside function");
						
						 $http({
							    url: 'GetCalender',
							    method: 'POST', 
							    data : divId, 
							    
							}).then(function successCallback(response) {
								
								$scope.calender=$sce.trustAsHtml(response.data);
							  
							    console.log(response.data);
							    console.log("inside controller calender is");
							    console.log($scope.calender);
							   
							}, function errorCallback(response) {
							 console.log(response.statusText);
							});
						
						
						
						
					};
		/*--------------------------update schedule-------------------------*/
		$scope.updateSchedule=function(schedule)
		{
			
		//	$scope.schedule.id=divId;
			console.log("inside Update schedule");
			console.log(divId);
			$http({
				 url: 'updateDivisionScheduleMethod',
				    method: 'POST', 
				    data : schedule, 
			     }).then(function successCallback(response){
			    	 console.log("updated")
			    	 clearform();
			    	 $scope.SaveSuccessMessage="Schedule Updated Successfully."
			    	 $scope.updateSuccess=true;
			    	 $scope.calender="";
			    	 
			     },function errorCallback(response){
			    	console.log("not updated"); 
			    	$scope.ErrorMessage="Error while Updating."
			    		$scope.updateError=true;
			     });
				
				
			
			
			
		};
		function clearform(){
			$scope.schedule.id="";
			$scope.schedule.string="";
			$scope.schedule.divName="";
			
		};
					
					
					
	});
					
					
					
			

</script>

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
<body ng-cloak class="ng-cloak">
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" /> 

 <section id="main-content">
          <section class="wrapper">
          <div class="row">
         
  					  <div class="alert alert-success fade in" ng-show="updateSuccess">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                <strong> {{SaveSuccessMessage}} </strong> 
                             
                              </div>
			
			
  					  <div class="alert alert-block alert-danger fade in" ng-show="updateError">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>{{ErrorMessage}}</strong> 
                              </div>
		
          
          
          
          	<h1> Select division to see or modify schedule </h1>
          	<div class="tree">
          	 ${structure}
          	 
          	 
          					 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                  <div class="modal-dialog">
                                      <div class="modal-content">
                                          <div class="modal-header">
                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                              <h4 class="modal-title">Schedule</h4>
                                          </div>
                                          <div class="modal-body">

                                           <!--   <a class="btn btn-success showDivsionsSchedule" ng-click="viewSchedule()">View Schedule</a> -->
                                              <button class="btn btn-warning editDivsionsSchedule"data-dismiss="modal"  type="submit" data-toggle="modal" ng-click="viewSchedule1()">ViewSchedule</button>
                                             <button class="btn btn-warning editDivsionsSchedule" data-toggle="modal" type="submit"  href="#myModal2">Edit/Add Schedule</button>
                                             
								                                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								                                  <div class="modal-dialog">
								                                      <div class="modal-content">
								                                          <div class="modal-header">
								                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								                                              <h4 class="modal-title">Edit/Add Schedule</h4>
								                                          </div>
								                                          <div class="modal-body">
								                     <!------------------------------- form starts over hear ---------------------->
								                                           <div class="form">
																				<form class="form-validate form-horizontal " ng-submit="updateSchedule(schedule)"id="Division_form" method="post">
																				
																				 <div class="form-group ">
																				 
										                                          <label for="fullname" class="control-label col-lg-2">Division Id </label>
										                                          
										                                           <div class="col-lg-10">
										                                              <input name="divid" ng-model="schedule.id" class=" form-control" type="text" autocomplete="off" required="required" maxlength="50" readonly="readonly"  />
										                                          </div>
										                                          
										                                          <label for="fullname" class="control-label col-lg-2">Calendar String </label>
										                                          
										                                           <div class="col-lg-10">
										                                              <input class=" form-control" type="text" ng-model="schedule.string" autocomplete="off" required="required" maxlength="1000"  />
										                                          </div>
										                                          
																				 <div class="form-group">
										                                          <div class="col-lg-offset-2 col-lg-10">
										                                              <button class="btn btn-primary" type="submit">Update</button>
										                                                                                      </div>
										                                      </div>
										                                         
																				 </div>
																				</form>
																				</div>
								                   <!------------------------------- form ends over hear ---------------------->
								                                          </div>
								                                          <div class="modal-footer">
								                                              <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
								                                             
								                                          </div>
								                                      </div>
								                                  </div>
								                              </div>

                                          </div>
                                          <div class="modal-footer">
                                              <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
                                             
                                          </div>
                                      </div>
                                  </div>
                              </div>
          	</div>
          	
          	          </div>
          	        <!--  <iframe ng-bind-html="calender" ng-src="{{calender}}" width="800" height="600" frameborder="0" scrolling="no"></iframe>
          	         <iframe>{{calender}}</iframe> -->
          	          <div ng-bind-html="calender"></div>
          	          <!-- <div class="tree" ng-bind-html="calender">
          	          <div id="show_calender" ng-bind-html="calender" class="googleCalendar" style="text-align: center;" > -->
 <!-- <iframe src="https://calendar.google.com/calendar/embed?mode=WEEK&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=ci5fi0t0u5i8927il2ula0kbgs%40group.calendar.google.com&amp;color=%2329527A&amp;ctz=Asia%2FCalcutta" style="border:solid 1px #777" width="800" height="600" frameborder="0" scrolling="no"></iframe> -->
</div> 
          	          
          </section>
 </section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>