var app=angular.module("myApp");
				app.controller("smsCtrl",function($scope,$http){
			
					$scope.disable=true;
					$scope.disableButton=function(){
						if($scope.option1){
							$scope.disable=false;
						}
					};
					
					$scope.goToNext=function(){
						//$state.go('results');
					}
					
					
				});