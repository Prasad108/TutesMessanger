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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pikaday.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/pikaday.js"></script>
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
  
   <script
     src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

<script>
var app=angular.module('myApp',[]);
app.controller('myController',function($scope,$http,$filter){
$scope.instituteSaved=false;
$scope.institutes=[];
			$scope.instituteform=
				{
					
					id:"",
					name:"",
					address:"",
					contactno:"",
					email:"",
					subscriptionTill:"",
				};
				
			$http({
			    url: 'GetExistingInstitutes',
			    contentType : 'application/json; charset=utf-8',
			  	 dataType : 'json', 
			    method: 'GET',    
			    
			}).then(function successCallback(response) {
			    $scope.institutes = response.data;
			   
			}, function errorCallback(response) {
			 console.log(response.statusText);
			});
			
			
	/*-----------		Edit Institute     -----------------*/
			$scope.EditInstitute = function(institute) {
				console.log("loading form data");
				$scope.instituteform.id=institute.id;
				$scope.instituteform.name=institute.name;
				$scope.instituteform.address=institute.address;
				$scope.instituteform.contactno=institute.contactno;
				$scope.instituteform.email=institute.email;
				$scope.instituteform.subscriptionTill=institute.subscriptionTill;
				};

//-------------------------------Update isntitute function -------------------------------		
			$scope.UpdateInstitute = function(instituteform) {
			var collectionDate = instituteform.subscriptionTill;
			//$scope.instituteform.subscriptionTill= $filter('date')(new Date(collectionDate),'yyyy-MM-dd');
			console.log(instituteform.subscriptionTill);
			$scope.instituteform.subscriptionTill =new Date(collectionDate);
		  
			$http(
					{
						url : "updateInstitute",
						contentType : 'application/json; charset=utf-8',
						dataType : 'json',
						method : "POST",
						data : instituteform
					})
					
					
					.then(function successCallback(response) {
						
						$scope.SuccessMessage="Institute is Modified Successfully."
						$scope.instituteSaved=true;
				    	console.log("success");
				    	if(response.data.message==null)
				    		{
				    		
					    		var newInstitute=response.data;
					    		
					    		console.log(newInstitute);
					    		for(var i=0;i<$scope.institutes.length;i++)
					    		{
					    			if($scope.institutes[i].id==$scope.instituteform.id)
				    				{
					    				$scope.institutes[i]=newInstitute
					    			    
				    				}
					    		}
				    		}
				    	  
				    
				   		
				   }, function errorCallback(response) {
				    console.log(response.statusText);
				   });
			};

			
			$scope.datepickerActivate = function() {
				
				$('.datepicker').pikaday({
					firstDay : 1
				});
			};

  });


</script>
</head>
<body ng-app="myApp" ng-controller="myController"  ng-cloak class="ng-cloak">
	<section id="container" class=""> <!-- Default header --> <jsp:include
		page="/WEB-INF/jsp/components/defaultHeader.jsp" /> <!-- App admin  Menu -->
	<jsp:include page="/WEB-INF/jsp/appAdmin/components/appAdminMenu.jsp" />
 
  
 <aside>
  <section id="main-content">
          <section class="wrapper">  
           
  				<div class="alert alert-success fade in" ng-show="instituteSaved">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>{{SuccessMessage}}</strong> 
                                  </div>	
		
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
                        
                            <tr ng-repeat="institute in institutes">
                              
                                  <td>{{$index+1}}</td>
                                  <td>{{institute.id}}</td>
                                  <td>{{institute.name}}</td>
                                  <td>{{institute.email}}</td>
                                  <td>{{institute.contactno}}</td>
                                  <td>{{institute.address}}</td>
                                  <td>{{institute.subscriptionTill | date :  "dd.MM.y" }}</td>
                                  
                                   <td>
                                  <div class="btn-group">
                                  
                                   <a class="btn btn-primary"  data-toggle="modal" ng-click="EditInstitute(institute);datepickerActivate()" href="#myModal" ><i  class="icon_plus_alt2"  ></i></a>     	
                                   <a class="btn btn-danger" ng-click="DeleteInstitute(institute)" href="#"><i   class="icon_close_alt2"></i></a>
                                  
                                  
                                  
                                  
                                    <!--   <a class="btn btn-primary tooltips instEdit" title="" data-toggle="modal" data-placement="left" data-original-title="Edit Institute"  href="#editInstituteModal" ><i class="icon_plus_alt2"></i></a>
                                    
                                      <a class="btn btn-success tooltips" title="" data-toggle="tooltip" data-placement="top" data-original-title="Enable Institute" href="#"><i  class="icon_check_alt2 " ></i></a>
                                      <a class="btn btn-danger tooltips" title="Disable Institute" data-toggle="tooltip" data-placement="right"  href="#"><i class="icon_close_alt2"></i></a> -->
                                       <!-- Modal -->
		                              <div id="myModal" class="modal fade" id="editInstituteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
										                              
										                              
										                                <form class="form-horizontal " name="EditInstituteForm" method="get">
																                                  <div class="form-group">
																                                      <label class="col-sm-2 control-label">Institute Id <span class="required">*</span></label>
																                                      <div class="col-sm-10">
																                                          <input ng-model="instituteform.id" type="text" class="form-control" required="required" autocomplete="off" required="required" maxlength="50" readonly="readonly"  >
																                                      </div>
																                                    
																                                        
																                                  </div>
																                                   <div class="form-group">
																                                      <label class="col-sm-2 control-label">Institute Name<span class="required">*</span></label>
																                                      <div class="col-sm-10">
																                                          <input ng-model="instituteform.name" type="text" class="form-control" required="required" autocomplete="off" >
																                                      </div>
																                                  </div>
																                                   <div class="form-group">
																                                      <label class="col-sm-2 control-label">Institute Address<span class="required">*</span></label>
																                                      <div class="col-sm-10">
																                                          <input ng-model="instituteform.address"  type="text" class="form-control" required="required" autocomplete="off" >
																                                      </div>
																                                  </div>
																                                  <div class="form-group">
																	                                   <div class="form-group">
																	                                      <label class="col-sm-2 control-label">Contact No<span class="required">*</span></label>
																	                                      <div class="col-sm-10">
																	                                          <input ng-model="instituteform.contactno" type="text" class="form-control" pattern="[789][0-9]{9}" title="Please enter Valid contact number" autocomplete="off" required="required" maxlength="12"> 
																	                                      </div>
																	                                  </div>
																                                  </div>
																                                  
																                                  <div class="form-group">
																	                                   <div class="form-group">
																	                                      <label class="col-sm-2 control-label">Email<span class="required">*</span></label>
																	                                      <div class="col-sm-10">
																	                                          <input ng-model="instituteform.email" type="email" class="form-control" required="required" autocomplete="off">
																	                                      </div>
																	                                  </div>
																                                  </div>
																                                  <div class="form-group">
																	                                   <div class="form-group">
																	                                      <label class="col-sm-2 control-label">Subscription Till<span class="required">*</span></label>
																	                                      <div class="col-sm-10">
																	                                     
																	                                          <input ng-model="instituteform.subscriptionTill" type="text" class="form-control datepicker" id="datepicker-topleft-forreal" placeholder="Date" required="required">                                              
																                                          
																	                                      </div>
																	                                  </div>
																                                  </div>
																                                  
																                                   
																                                    <div class="form-group">
																                                      <div class="col-lg-offset-2 col-lg-10">
																                                          <button type="submit" data-dismiss="modal" class="btn btn-primary" ng-click="UpdateInstitute(instituteform)" ng-disabled="!EditInstituteForm.$valid || !EditInstituteForm.$dirty">Update Institute</button>
																                                      </div>
																                                  </div>
																                           
																                              </form>
										                              
										                              
										                              
										                              
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
    
   <!--  this is extra added from addeditexam
   
   
   
 -->
 

 
 
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
   
	 <script>
   /*!
    * Pikaday jQuery plugin.
    *
    * Copyright © 2013 David Bushell | BSD & MIT license | https://github.com/dbushell/Pikaday
    */

   (function (root, factory)
   {
       'use strict';

       if (typeof exports === 'object') {
           // CommonJS module
           factory(require('jquery'), require('pikaday'));
       } else if (typeof define === 'function' && define.amd) {
           // AMD. Register as an anonymous module.
           define(['jquery', 'pikaday'], factory);
       } else {
           // Browser globals
           factory(root.jQuery, root.Pikaday);
       }
   }(this, function ($, Pikaday)
   {
       'use strict';

       $.fn.pikaday = function()
       {
           var args = arguments;

           if (!args || !args.length) {
               args = [{ }];
           }

           return this.each(function()
           {
               var self   = $(this),
                   plugin = self.data('pikaday');

               if (!(plugin instanceof Pikaday)) {
                   if (typeof args[0] === 'object') {
                       var options = $.extend({}, args[0]);
                       options.field = self[0];
                       self.data('pikaday', new Pikaday(options));
                   }
               } else {
                   if (typeof args[0] === 'string' && typeof plugin[args[0]] === 'function') {
                       plugin[args[0]].apply(plugin, Array.prototype.slice.call(args,1));

                       if (args[0] === 'destroy') {
                           self.removeData('pikaday');
                       }
                   }
               }
           });
       };

   }));
   
   </script>
    	
</body>
</html>