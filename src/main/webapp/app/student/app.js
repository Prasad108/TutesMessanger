(function(){
	var app=angular.module('myApp',['ui.router']);
		
	app.config(['$stateProvider','$urlRouterProvider',function($stateProvider,$urlRouterProvider) {
		  
		$urlRouterProvider.otherwise('/Home');	
		$stateProvider.state({name : 'Home', url : '/Home',	component : 'homeComponet'});	
		$stateProvider.state({name : 'Schedule', url : '/Schedule', templateUrl: '../app/student/Schedule/Schedule.html', controller: 'ScheduleCtrl'});
		
	}]);


}())