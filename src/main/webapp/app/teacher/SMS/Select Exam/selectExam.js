var app=angular.module("myApp");
				app.controller("selectExamCtrl",function($scope,$http){
					$scope.sms={};
					$scope.sms.contacNumber;
					$scope.sms.text;
					$scope.pubID='';
					$scope.pubSuccess=false;
					$scope.pubFail=false;
					
					
					$scope.sendSMS = function(sms) {
					$http(
								{
									url : "sendSMS/"+ sms.contacNumber,
									contentType : 'application/json; charset=utf-8',
									dataType : 'json',
									method : "GET",
									params: {sms: sms.text}
								})
								.then(
										function(response) {
											// if success       	
											console.log("succcess");
											console.log(response);
											if(response.data.status="success"){
												console.log("succcess");
												$scope.sms.contacNumber='';
												$scope.sms.text='';
												$scope.pubID=response.data.pubid;
												$scope.pubSuccess=true;
												$scope.pubFail=false;
											}else{
												console.log(" failed to send the sms");
												$scope.sms.contacNumber='';
												$scope.sms.text='';
												$scope.pubID=data.message;
												$scope.pubSuccess=false;
												$scope.pubFail=true;
												
											}
											
										},
										function(data) { // optional
											// failed		                 
											console.log(" failed to send the sms");
											$scope.sms.contacNumber='';
											$scope.sms.text='';
											$scope.pubID=data.message;
											$scope.pubSuccess=false;
											$scope.pubFail=true;
										});

					};	
					
				}
			);