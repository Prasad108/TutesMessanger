(function(){

var app=angular.module("myApp");
  app.controller("ScheduleCtrl",["$scope","$http","$sce",function($scope,$http,$sce){
		
//		$scope.teacher=JSON.parse('${teacherJSON}');
//	    $scope.permissions=JSON.parse('${permissions}');  				
//		console.log("teacher is "+$scope.teacher);
//		console.log("teacher id is "+$scope.teacher["id"]+"permissions are "+ $scope.permissions);  
//		console.log($scope.permissions);
	  
	  $scope.scheduleError=false;
	  $scope.scheduleSuccess=false;
	  $scope.calender;
	  $http({
		      url:"getSchedule",
		      method:"POST"
	  }).then(function successCallback(response){
		  console.log(response.data);
		  
		  if(response.data.status=="success")
			  {
			  $scope.calender=$sce.trustAsHtml(response.data.schedule);
				 // $scope.calender=response.data.schedule;
				console.log($scope.calender);
				  $scope.scheduleSuccess=true;
				  $scope.SuccessMessage="schedule is below.";
			  }
		  else{
			  $scope.scheduleError=true;
			  $scope.ErrorMessage=response.data.message;
		  }
		 
		  
	  },
	  function errorCallback(response){
		  $scope.scheduleError=true;
		  $scope.ErrorMessage="Error at server side!";
		  
		  
	  }
	  
	  
	  )
	  
	  
	  
	  
  }]);
  
  }())
