(function() {
	var app=angular.module("myApp",['ui.router',"ngSanitize"]);
	
	app.config(['$stateProvider','$urlRouterProvider',function($stateProvider,$urlRouterProvider) {
		  
		$urlRouterProvider.otherwise('/Home');
		
		
						

				var Home = {
					name : 'Home',
					url : '/Home',					
					component : 'homeComponet' 
				}

				var existingInstituteStructure = {

					name : 'existingInstituteStructure',
					url : '/existingInstituteStructure',
					component : 'existingInstituteStructureComponent'
				}

				var studentRequest = {
					name : 'studentRequest',
					url : '/studentRequest',
					component : 'studentRequestComponent'

				}
			
				$stateProvider.state(Home);
				$stateProvider.state(existingInstituteStructure);
				$stateProvider.state(studentRequest);
			
			
		    
			
			
			
	}]);
	
}())