<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
		<title>App Admin</title>
		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/pikaday.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pikaday.css">
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script src="${pageContext.request.contextPath}/app/angular-ui-router.js"></script>
		<script src="${pageContext.request.contextPath}/app/appAdmin/app.js"></script>
		
		<script src="${pageContext.request.contextPath}/app/appAdmin/addNewInstitute/addNewIsntituteController.js"></script>
		<script src="${pageContext.request.contextPath}/app/appAdmin/existingInstitute/existingInstituteController.js"></script>
		<script src="${pageContext.request.contextPath}/app/appAdmin/addNewInstitute/addNewIsntituteComponent.js"></script>
		<script src="${pageContext.request.contextPath}/app/appAdmin/existingInstitute/existingInstituteComponent.js"></script>

</head>
<body    ng-cloak class="ng-cloak">

	<section id="container" class=""> 
		<!-- Default header --> 
		<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 
		<!-- App admin  Menu -->
		<jsp:include page="/WEB-INF/jsp/appAdmin/components/appAdminMenu.jsp" />
	 
  
		 <section id="main-content">
			   <section class="wrapper">	
			   <div class="row">	           
					    	<ui-view></ui-view>				         
	           <!-- page end-->
	           </div>
			 </section>
		 
		</section>
	</section>
	

 <jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />

 <script>
   /*!
    * Pikaday jQuery plugin.
    *
    * Copyright � 2013 David Bushell | BSD & MIT license | https://github.com/dbushell/Pikaday
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
</body>
</html>