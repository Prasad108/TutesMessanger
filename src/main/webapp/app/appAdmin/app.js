
	
var app=angular.module('myApp',['ngRoute']);
	
	app.config(function($routeProvider) {
	    $routeProvider
	    .when('/existingInstitutes', {
	    	templateUrl  : '../app/appAdmin/existingInstitute/existingInstitute.html' ,
	      controller : 'existingInstituteController'
	    })
	    .when('/addNewInstitute', {
	    	templateUrl  : '../app/appAdmin/addNewInstitute/addNewInstitute.html',
	      controller : 'addNewIsntituteController'
	    })
	    .otherwise('/existingInstitutes');
	});
	

	