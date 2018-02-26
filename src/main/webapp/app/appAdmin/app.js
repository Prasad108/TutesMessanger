


	
var app=angular.module('myApp',['ui.router']);
	
app.config(['$stateProvider','$urlRouterProvider',function($stateProvider,$urlRouterProvider) {
	  
	$urlRouterProvider.otherwise('/existingInstitutes');
		
		/*.state('existingInstitutes', {
			url :'/existingInstitutes', //../app/appAdmin/existingInstitute/existingInstitute.html
			templateUrl  : `<h1>Hello </>` ,
			controller : 'existingInstituteController'
		})
		.state('addNewInstitute', {
			url : '/addNewInstitute',
			templateUrl  : '../app/appAdmin/addNewInstitute/addNewInstitute.html',
			controller : 'addNewIsntituteController'
		})*/
		
		
		var existingInstitutes= {
			
			name:'existingInstitutes',
			 
			url : '/existingInstitutes',
			controller : 'existingInstituteController',
			templateUrl : '../app/appAdmin/existingInstitute/existingInstitute.html'
		}
		
		var addNewInstitute = {
				name: 'addNewInstitute',
				url : '/addNewInstitute',
				controller : 'addNewIsntituteController', 
				templateUrl :'../app/appAdmin/addNewInstitute/addNewInstitute.html' 
					
				/*url :'/existingInstitutes',
					template :'<h3>Its the UI-Router Addnew Institute!</h3>'*/
		}
		

		$stateProvider.state(existingInstitutes);
		$stateProvider.state(addNewInstitute);
		
	    
		
		
		
}]);



