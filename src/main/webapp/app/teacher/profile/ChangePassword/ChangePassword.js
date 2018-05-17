var app=angular.module("myApp");
		
 		  app.controller('ChangePasswordCtrl', ['$scope','$http','shairedDataService', function($scope,$http,shairedDataService) {
 			   console.log("******ChangeUsername Controller********");
 			   	$scope.teacher=shairedDataService.teacher;
	    		$scope.permissions=shairedDataService.permissions; 
	    		$scope.institute=shairedDataService.institute;
	    		
	    		
	    		
	    		$scope.changePassword=function(){
	    			var sendData ={}
	    			sendData.CurrentPassword=$scope.CurrentPassword;
	    			sendData.NewPassword=$scope.NewPassword;
	    			sendData.RePassword=$scope.RePassword;
	    			
	    			
	    			if( angular.equals($scope.CurrentPassword, $scope.NewPassword) === true){
						console.log("New Password and Current Password is same");
							$scope.message="New Password and Current Password is same";
							$scope.SameAsPrevious = true;
							$scope.UpdatedPassword = false;
							$scope.NotUpdatedPassword = false;
							return console.log("exit b/c of Password");
						}


	    					$http(
	    							{
	    								url : "changeTPassword",
	    								contentType : 'application/json; charset=utf-8',
	    								dataType : 'json',
	    								method : "POST",
	    								data : sendData,
	    							}).then(function successCallback(response) {
	    						    	
	    						    	//success callback
	    						   		
	    						   }, function errorCallback(response) {
	    								// failure callback
	    						   });
	    		}
 		 }]);