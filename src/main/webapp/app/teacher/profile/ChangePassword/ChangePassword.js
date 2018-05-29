var app=angular.module("myApp");
		
 		  app.controller('ChangePasswordCtrl', ['$scope','$http','shairedDataService', function($scope,$http,shairedDataService) {
 			   console.log("******ChangeUsername Controller********");
 			   	$scope.teacher=shairedDataService.teacher;
	    		$scope.permissions=shairedDataService.permissions; 
	    		$scope.institute=shairedDataService.institute;
	    		
	    		
	    		
	    		$scope.changePassword=function(){
	    			var sendData ={}
	    			var Error_current_pwd ="not_valid_current_Password";
	    			var Re_type_pwd = "Please_enter_the_same_password";
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
	    								console.log(response);	    								
										if(response.data.status == "Success"){
										$scope.message="Successfully Updated Password";
										$scope.UpdatedPassword = true;
										$scope.NotUpdatedPassword = false;
										$scope.SameAsPrevious = false;
										$scope.CurrentPassword = "";
										$scope.NewPassword = "";
										$scope.RePassword = "";
										
									}
									else{
										if(angular.equals(response.data.cause,Error_current_pwd)){
											$scope.message="wrong current Password";
											console.log("Not Update cause : u have entered wrong cureent password");
											$scope.NotUpdatedPassword = true;
											$scope.UpdatedPassword = false;
											$scope.SameAsPrevious = false;
											
										}else if(angular.equals(response.data.cause,Re_type_pwd)){
											$scope.message="new password is not matching with confirm password";
											console.log("new password not matching with reentered password");
											$scope.NotUpdatedPassword = true;
											$scope.UpdatedPassword = false;
											$scope.SameAsPrevious = false;
											
										}	else{
										console.log(angular.equals(response.data.cause,Error_current_pwd));
											$scope.message="Could Not Update Password";
											console.log("defualt at the last error");
											$scope.NotUpdatedPassword = true;
											$scope.UpdatedPassword = false;
											$scope.SameAsPrevious = false;
										}
										
									}
	    								
	    					
	    						   		
	    						   });
	    		}
 		 }]);