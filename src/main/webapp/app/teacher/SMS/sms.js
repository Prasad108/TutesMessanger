var app=angular.module("myApp");
				app.controller("smsCtrl",function($scope,$http,$state){
			
					$scope.disable=true;
					$scope.disableButton=function(){
						if($scope.option1){
							$scope.disable=false;
						}
					};
					
					$scope.goToNext=function(){
						//console.log("inside goToNext function");
						$state.go('selectExam');
					}
					
					
				});