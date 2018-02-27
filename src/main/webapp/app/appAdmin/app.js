(function(){
	

	
	var app=angular.module('myApp',['ui.router']);
		
	app.config(['$stateProvider','$urlRouterProvider',function($stateProvider,$urlRouterProvider) {
		  
		$urlRouterProvider.otherwise('/existingInstitutes');
						
			var existingInstitutes= {
				
				name:'existingInstitutes',				 
				url : '/existingInstitutes',
				component : 'existingInstitute'
			}
			
			var addNewInstitute = {
					name: 'addNewInstitute',
					url : '/addNewInstitute',
					component : 'addNewInstitute'
					
			}
			

			$stateProvider.state(existingInstitutes);
			$stateProvider.state(addNewInstitute);
			
		    
			
			
			
	}]);




}())

