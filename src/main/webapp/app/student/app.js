(function(){
	var app=angular.module('myApp',['ui.router']);
		
	app.config(['$stateProvider','$urlRouterProvider',function($stateProvider,$urlRouterProvider) {
		  
		$urlRouterProvider.otherwise('/Home');	
		$stateProvider.state({name : 'Home', url : '/Home', templateUrl: '../app/student/home/home.html', controller: 'homeController'});

//		$stateProvider.state({name : 'Schedule', url : '/Schedule', templateUrl: '../app/student/Schedule/Schedule.html', controller: 'ScheduleCtrl'});
		
	}]);
	console.log("im in the app.js of student");


}())