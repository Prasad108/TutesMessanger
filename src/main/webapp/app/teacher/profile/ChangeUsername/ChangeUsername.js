var app=angular.module("myApp");
		
 		  app.controller('ChangeUsernamePasswordCtrl', ['$scope','$http','shairedDataService', function($scope,$http,shairedDataService) {
 			   console.log("******ChangeUsername Controller********");
 			   	$scope.teacher=shairedDataService.teacher;
	    		$scope.permissions=shairedDataService.permissions; 
	    		$scope.institute=shairedDataService.institute;
	    						 $scope.changeUsername=function(){
	    							 
	    							 console.log("works fine");
	    								var sendData ={}
	    								sendData.currentUsername=$scope.CurrentUserName;
	    								sendData.NewUsername=$scope.NewUserName;
	    								console.log($scope.NewUserName);
	    								console.log($scope.CurrentUserName);
	  
	    								 
	    								if( angular.equals($scope.CurrentUserName, $scope.NewUserName) === true){
	    									console.log("New User name and Current Username is same");
	    										$scope.message="New User name and Current Username is same";
	    										$scope.NameisSame = true;
	    										$scope.UpdatedName = false;
												$scope.NotUpdatedName = false;
	    										return console.log("exit b/c of same name");
	    									}
	    								

	    										$http(
	    												{
	    													url : "changeTUsername",
	    													contentType : 'application/json; charset=utf-8',
	    													dataType : 'json',
	    													method : "POST",
	    													data : sendData,
	    												}).then(function successCallback(response) {
	    													console.log("this is response "+response.data.status);
	    													if(response.data.status == "Success"){
	    													$scope.message="Successfully Updated Username";
	    													$scope.UpdatedName = true;
	    													$scope.NotUpdatedName = false;
	    													$scope.NameisSame = false;
	    													$scope.CurrentUserName = "";
	    													$scope.NewUserName = "";
	    													
	    												}
	    												else{
	    													if(response.data.cause == "not_valid_current_username"){
	    														$scope.message="wrong current username";
	    														console.log("Not Update try again");
		    													$scope.NotUpdatedName = true;
		    													$scope.UpdatedName = false;
		    													$scope.NameisSame = false;
	    													}else{
	    														$scope.message="Could Not Update Username";
	    														console.log("Not Update try again");
		    													$scope.NotUpdatedName = true;
		    													$scope.UpdatedName = false;
		    													$scope.NameisSame = false;
	    													}
	    													
	    												}
	    											   });
	    										};
}]);