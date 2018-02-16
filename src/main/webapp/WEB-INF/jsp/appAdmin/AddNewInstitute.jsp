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
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.png">
      
  <!--     angular js file -->
       <script
     src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
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
   
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pikaday.css">
     
    
      
 <!--   <script>
  
    -->
  
      <script>
      var app=angular.module("myApp",[]);
      app.controller("myController",function($scope,$http,$filter){
    	  $scope.instituteSaved=false;
    	  $scope.InstituteFormAdminForm={
    			  instName:"",
    			  instAddress:"",
    			  instContactNo:"",
    			  instEmail:"",
    			  instSubscriptionTill:"",
    			  adminName:"",
    	    	  adminSurname:"",
    	    	  adminContactNo:"",
    	    	  adminEmail:"",
    	  };
    
    	  
    	  
//-------------------------------Save isntitute with its Admin function -------------------------------
    	  $scope.AddInstituteAdmin = function(InstituteFormAdminForm) {
    		  
    		console.log("inside function of add");
    		
    		$scope.instituteSaved=false;
    		$scope.instituteSavedError=false;
  			var collectionDate = InstituteFormAdminForm.instSubscriptionTill;
  			
  			
  			$scope.InstituteFormAdminForm.instSubscriptionTill =new Date(collectionDate);
  		     console.log(InstituteFormAdminForm);
  		    
  		     
  		    
  			$http(
  					{
  						url : "SaveInstituteAdminInstitute",
  						contentType : 'application/json; charset=utf-8',
  						dataType : 'json',
  						method : "POST",
  						data : InstituteFormAdminForm,
  					
  						
  					})
  					
					.then(function successCallback(response) {
				    	
				    	console.log("success while response");
				    	$scope.SuccessMessage="Institute Saved with Institute Admin.";
				    	$scope.instituteSaved=true;
				    	clearform();
				   		
				   }, function errorCallback(response) {
				    console.log(response.statusText);
				    console.log("error while response");
				    $scope.ErrorMessage="Error in Registration, Please try with another name This Data is already Registered."
				    $scope.instituteSavedError=true;
				    clearform();
				   });
  					 
    	  
    	  
    	  };
    	  
/*-----------------------------------clear form function ----------------------------------------*/
    	   function clearform()
    	    {
    	    	  $scope.InstituteFormAdminForm.instName="";
    	          $scope.InstituteFormAdminForm.instAddress="";
    	          $scope.InstituteFormAdminForm.instContactNo="";
    	          $scope.InstituteFormAdminForm.instEmail="";
    	          $scope.InstituteFormAdminForm.instSubscriptionTill="";
    	          $scope.InstituteFormAdminForm.adminName="";
    	          $scope.InstituteFormAdminForm.adminSurname="";
    	          $scope.InstituteFormAdminForm.adminContactNo="";
    	          $scope.InstituteFormAdminForm.adminEmail="";
    	    };
    	   
    	  
    	
      });

   
      
      
      </script>
      
      
   
  </head>
<body ng-app="myApp" ng-controller="myController"  ng-cloak class="ng-cloak">
<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/appAdmin/components/appAdminMenu.jsp" /> 

 
 <!-- Default Containt -->
   <aside>
  <section id="main-content">
          <section class="wrapper">  
          
           <div class="alert alert-block alert-danger fade in" ng-show="instituteSavedError">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>{{ErrorMessage}}</strong> 
                              </div>
              <div class="row">
         
		  <div class="alert alert-success fade in" ng-show="instituteSaved">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>{{SuccessMessage}}</strong> 
                              </div>
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                            Add Institute & its Admin
                          </header>
                          <div class="panel-body">
                              <div class="form">
                              
                              <form class="form-validate form-horizontal" ng-submit="AddInstituteAdmin(InstituteFormAdminForm)" name="InstituteFormAdminForm" id="register_form" method="post">
                                      <div class="form-group ">
	                                          <label for="fullname" class="control-label col-lg-2">Institute Name <span class="required">*</span></label>
	                                          <div class="col-lg-10">
	                                              <input class=" form-control" ng-model="InstituteFormAdminForm.instName" type="text" autocomplete="off" required="required" maxlength="50"/>
	                                          </div>
	                                          <br><br><br>
	                                          <label for="fullname" class="control-label col-lg-2">Institute Address <span class="required">*</span></label>
	                                          <div class="col-lg-10">
	                                              <input class=" form-control" ng-model="InstituteFormAdminForm.instAddress" type="text" autocomplete="off" required="required" maxlength="50"/>
	                                          </div>
	                                           <br><br><br>
	                                           <label for="fullname" class="control-label col-lg-2">Contact Number <span class="required">*</span></label>
	                                          <div class="col-lg-10">
	                                              <input class=" form-control" ng-model="InstituteFormAdminForm.instContactNo" type="text" pattern="[789][0-9]{9}" title="Please enter Valid contact number" autocomplete="off" required="required" maxlength="12"/>
	                                          </div>
	                                          <br><br><br>
	                                          <label for="fullname" class="control-label col-lg-2">Email Id <span class="required">*</span></label>
	                                          <div class="col-lg-10">
	                                              <input class=" form-control" ng-model="InstituteFormAdminForm.instEmail" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" autocomplete="off" required="required" maxlength="50"/>
	                                          </div>
	                                          <br><br><br>
	                                          <label for="fullname" class="control-label col-lg-2">Subscription till<span class="required">*</span></label>
	                                          <div class="col-lg-10">
	                                              <input class="form-control datepicker" ng-model="InstituteFormAdminForm.instSubscriptionTill" id="datepicker-topleft-forreal"  type="text" autocomplete="off" required="required" />
	                                          </div>
                                          </div>
                                          <div class="form-group"> 
		                                         <div>Institutes Admin Information</div>
		                                  			<br>
		                                          <label for="fullname" class="control-label col-lg-2">First Name <span class="required">*</span></label>
		                                          <div class="col-lg-10">
		                                              <input  class=" form-control" ng-model="InstituteFormAdminForm.adminName" type="text" autocomplete="off" required="required" maxlength="50"/>
		                                          </div>
		                                          <br><br><br>
		                                          <label for="fullname" class="control-label col-lg-2">Surname <span class="required">*</span></label>
		                                          <div class="col-lg-10">
		                                              <input class=" form-control" ng-model="InstituteFormAdminForm.adminSurname" type="text" autocomplete="off" required="required" maxlength="50"/>
		                                          </div>
		                                          <br><br><br>
		                                           <label for="fullname" class="control-label col-lg-2">Contact Number <span class="required">*</span></label>
		                                          <div class="col-lg-10">
		                                              <input class=" form-control" ng-model="InstituteFormAdminForm.adminContactNo" pattern="[789][0-9]{9}" title="Please enter Valid contact number" type="text" autocomplete="off" required="required" maxlength="100"/>
		                                          </div>
		                                          <br><br><br>
		                                          <label for="fullname" class="control-label col-lg-2">Email Id <span class="required">*</span></label>
		                                          <div class="col-lg-10">
		                                              <input class=" form-control" ng-model="InstituteFormAdminForm.adminEmail" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" autocomplete="off" required="required" maxlength="50"/>
		                                          </div>
                                          </div>
                                      
                                          
                                          
                                          
                                      <br><br><br>
                                    
                                      <div class="form-group">
                                          <div class="col-lg-offset-2 col-lg-10">
                                              <button class="btn btn-primary" type="submit" >Save</button>
                                          </div>
                                          </div>
                                      </div>
                                 </form>
                              </div>
                          </div>
                      </section>
                  </div>
              </div>
              
              
             
               </aside>
              <!-- page end-->
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
    
 
     <!-- container section start -->
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
   </section>
 <!-- container section start -->
   <script src="${pageContext.request.contextPath}/js/pikaday.js"></script>
   
 
  </body>
</html>