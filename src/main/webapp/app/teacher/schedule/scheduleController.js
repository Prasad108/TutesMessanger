
				var app=angular.module("myApp");
				app.controller("scheduleController",function($scope,$http,$sce,schedule){
				
					//$scope.teacher=JSON.parse('${teacherJSON}');
		   		//	$scope.permissions=JSON.parse('${permissions}');  				
		   		//	console.log("teacher is "+$scope.teacher);
		   			//console.log("teacher id is "+$scope.teacher["id"]+"permissions are "+ $scope.permissions);  
		   			//console.log($scope.permissions);
					
					$scope.structureString=schedule;
				    $scope.updateSuccess=false;
				    $scope.updateError=false;
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
						
						//$('#myModal').modal('show');
						
					 divId=id;
					 console.log(id);
					
					// console.log(name);
					// divisionName=division;
					 console.log("if button clicked")
					  console.log(divId);
					// console.log(division);
					 $scope.schedule.id=id;
					 
											 
					};
					
			        
					 //var divisionName;
					$scope.viewName=function(Name)
					{
						alert("it is going there");
						$('#myModal').modal('show');
						
						console.log("inside name function");
						$scope.schedule.divName=Name;
						/* console.log(name);
						$scope.schedule.divName=name; */
						console.log($scope.schedule.divName);
						
					}; 
					
				//	console.log(divId);
					console.log($scope.schedule);
					
	/*----------------------	 function of view shcedule -----------------------------*/			
					$scope.viewSchedule1=function()
					{
						
						console.log("inside function");
						
						 $http({
							    url: 'GetCalender',
							    method: 'POST', 
							    data : divId, 
							    
							}).then(function successCallback(response) {
								
								$scope.calender=$sce.trustAsHtml(response.data);
							  
							    console.log(response.data);
							    console.log("inside controller calender is");
							    console.log($scope.calender);
							   
							}, function errorCallback(response) {
							 console.log(response.statusText);
							});
						
						
						
						
					};
					//$scope.viewSchedule1();
		/*--------------------------update schedule-------------------------*/
		$scope.updateSchedule=function(schedule)
		{
			
		//	$scope.schedule.id=divId;
			console.log("inside Update schedule");
			console.log(divId);
			$http({
				 url: 'updateDivisionScheduleMethod',
				    method: 'POST', 
				    data : schedule, 
			     }).then(function successCallback(response){
			    	 console.log("updated")
			    	 clearform();
			    	 $scope.SaveSuccessMessage="Schedule Updated Successfully."
			    	 $scope.updateSuccess=true;
			    	 $scope.calender="";
			    	 
			     },function errorCallback(response){
			    	console.log("not updated"); 
			    	$scope.ErrorMessage="Error while Updating."
			    		$scope.updateError=true;
			     });
				
				
			
			
			
		};
		function clearform(){
			$scope.schedule.id="";
			$scope.schedule.string="";
			$scope.schedule.divName="";
			
		};
					
					
					
	});
					
					
					
			


