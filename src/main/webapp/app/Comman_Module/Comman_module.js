(function(){
	var app=angular.module('commanModule',['angularSpinner']);
	app.directive('loading',   ['$http' ,function ($http)  
		 {  
		     return {  
		         restrict: 'E',    
		         link: function (scope, elm, attrs)  
		         {  
		             scope.isLoading = function () {  
		                 return $http.pendingRequests.length > 0;  
		             };  
		  
		             scope.$watch(scope.isLoading, function (v)  
		             {  
		                 if(v){  
		                     elm.css('display', 'block');  
		                 }else{  
		                     elm.css('display', 'none');  
		                 }  
		             });  
		         }  
		     };  
		 }])  
}())