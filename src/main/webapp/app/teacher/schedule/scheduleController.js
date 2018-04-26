
				var app=angular.module("myApp");
				app.controller("scheduleController",function($scope,$http,$sce,schedule){
				
					
					$scope.structureString=schedule;
					$scope.InstituteTreeStructure=schedule;
				    $scope.Success=false;
				    $scope.Error=false;
					$scope.calender;
					console.log("inside controller");
					
					$scope.schedule={
							id:"",
							string:"",
							divName:"",
					}	
					
					
	/*-------------	 take divid from TeacherService------------------------------*/
					var divId;
					//var divisionName;
					$scope.viewSchedule=function(id){
					 divId=id;
					 console.log(id);
					 $scope.schedule.id=id;		 
					};
					
			    
					
	/*----------------------	 function of view shcedule -----------------------------*/			
					$scope.viewSchedule1=function()
					{
						
						console.log("inside function");
						
						 $http({
							    url: 'GetCalender/'+divId,
							    method: 'POST', 
							    data : divId, 
							    
							}).then(function successCallback(response) {
								console.log("success callback");
								$scope.calender="";
								if(response.data.status=="success"){
									console.log("status success");
									 	$scope.Success=false;
									    $scope.Error=false;
									$scope.calender=$sce.trustAsHtml(response.data.schedule);
								    console.log(response.data);
								    console.log("inside controller calender is");
								    console.log($scope.calender);
									
								}
								else{
									console.log("status error");
									$scope.ErrorMessage="Schedule not saved for the division please save the schedule"
									$scope.Success=false;
								    $scope.Error=true;
									$scope.calender="";
									
								}
								
							   
							}, function errorCallback(response) {
								console.log("error callback");
								$scope.calender="";
								$scope.Success=false;
							    $scope.Error=true;
							 console.log(response.statusText);
							 $scope.ErrorMessage="System error could not look for the schedule";
							});
						
						
						
						
					};
					//$scope.viewSchedule1();
		/*--------------------------update schedule-------------------------*/
		$scope.updateSchedule=function(schedule)
		{
			
		//	$scope.schedule.id=divId;
			console.log("inside Update schedule");
			console.log(divId);
			$('.modal').modal('hide');
			$http({
				 url: 'updateDivisionScheduleMethod',
				    method: 'POST', 
				    data : schedule, 
			     }).then(function successCallback(response){
			    	 
			    	 
			    	 if(response.data.status=="success"){
			    		 	$scope.Success=true;
						    $scope.Error=false;
				    	 console.log("updated")
				    	 clearform();
				    	 $scope.SuccessMessage=response.data.action;
				    	 $scope.calender="";
			    	 }else{
			    		 
			    	 }
			    	 
			     },function errorCallback(response){
			    	console.log("not updated"); 
			    	$scope.ErrorMessage="Error while Saving/Updating Schedule."
			    		$scope.Error=true;
			    	$scope.Success=false;
			     });
				
				
			
			
			
		};
		function clearform(){
			$scope.schedule.id="";
			$scope.schedule.string="";
			$scope.schedule.divName="";
			
		};
		$scope.openFormModal=function(){
			console.log("openFormModal function got called");
			$('#myModal').modal('hide');
			$('#myModal2').modal('show');
		};
		
			
					
	});
					
					
					
			


