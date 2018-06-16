(function(){
	
	var app=angular.module("myApp");
	
	  app.controller('examSubjectStudentCtrl',examSubjectStudentCtrl)
	  
		   
		examSubjectStudentCtrl.$inject=['shairedDataService','$stateParams','$scope','$http','$log','$window'];
	   function examSubjectStudentCtrl( shairedDataService, $stateParams,$scope, $http,$log,$window) {
		   
		   $scope.teacher=shairedDataService.teacher;
	   		$scope.permissions=shairedDataService.permissions; 
	   		$scope.institute=shairedDataService.institute;
	   		$scope.examId=$stateParams.id;
	   		$scope.subjectDivId=$stateParams.subjectId;
	   		$scope.StudentList=[];	
	   		$scope.ExamSubjectStudentResult=[];
	   		
	   		$scope.saveButton=false;
	   		$scope.editIcon=true;
	   		
	   		$scope.toggleSave_and_Edit_button=function(){
	   			$scope.saveButton=!$scope.saveButton;
		   		$scope.editIcon=!$scope.editIcon;
	   		}
	   		$scope.DataToSend=[];

	   		$scope.GetESSR=function(){
	   		
		   		$http(
						{
							url : "ExamSubjectStudentResult",			
							contentType : 'application/json; charset=utf-8',
							dataType : 'json',
							method : "GET",
							 params: {examId: $scope.examId,subDivId:$scope.subjectDivId}
							
						})
						.then(function successCallback(response) {
									// if success   then generate student table
	
									console.log("response came 2********");
									console.log(response);
									$scope.ExamSubjectStudentResult=response.data;
									
								
								},
								function errorCallback(response) {
									// failed
									console.log("error response came 2********");
									console.log(response);
								});
	   		}
	   		$scope.GetESSR();
	   		
	   		$scope.editResult=function(){
	   			$log.debug("inside the edit Function ");
	   			$scope.toggleSave_and_Edit_button();
	   			
	   		}
	   		
	   		$scope.save=function(){
	   			$log.debug("inside the Save Function ");
	   				   				   			
	   			angular.forEach($scope.EditResutlForm, function(value, key) {
	   			  if(key[0] == '$') return;
	   			  else{
	   				  
	   				  if(!value.$pristine){
	   					  
	   					 //console.log( value)
	   					var found=false;
	   					 
	   					  if(value.$$attr.title=="ObtainedMarkes"){
	   						 
	   						   //$scope.id=value.$name
	   						  
	   						  $log.debug("Obtained marks  ESSR.examSubjectStudentCompositTable.id: is : "+ value.$name +"  VALUE is "+value.$viewValue);
	   						
	   						   found = $scope.DataToSend.some(function (el) {
	   			   			    return el.id === value.$name;
	   			   			  });
	   			   			  if (!found) { 
	   			   				  $scope.DataToSend.push({ "id": value.$name, "ObtainedMarkes" : value.$viewValue }); 
	   			   			  }else{
				   			   			for (var i=0; i < $scope.DataToSend.length; i++) {
				   			   	        if ( $scope.DataToSend[i].id === value.$name) {
				   			   	        	$scope.DataToSend[i].ObtainedMarkes=value.$viewValue ;
				   			   	        }
				   			   	    }
	   			   			  }
	   						  
	   					  }
	   					  if(value.$$attr.title=="Result"){
	   						  
	   						$log.debug("Result ESSR.examSubjectStudentCompositTable.id: is : "+ value.$$attr.id +"  VALUE is "+value.$viewValue);
	   						
	   						 found = $scope.DataToSend.some(function (el) {
	   			   			    return el.id === value.$$attr.id;
	   			   			  });
	   			   			  if (!found) { 
	   			   				  $scope.DataToSend.push({ "id": value.$$attr.id, "remarks" : value.$viewValue }); 
	   			   			  }else{
				   			   			for (var i=0; i < $scope.DataToSend.length; i++) {
				   			   	        if ( $scope.DataToSend[i].id === value.$$attr.id) {
				   			   	      $scope.DataToSend[i].remarks=value.$viewValue ;
				   			   	        }
				   			   	    }
	   			   			  }
	   					  }
	   						  
	   					//$log.debug(""+value.$$attr.title+" : Name is : "+ value.$name +"  VALUE is "+value.$viewValue);
	   					 
	   					  }
	   				 
	   			  }
	   			});
	   			  			
	   			$log.info($scope.jsonArr);
   				// $log.info($scope.DataToSend[0]);
   				  if ($scope.DataToSend.length > 0) {
   					 
   					 // $log.info($scope.DataToSend);
   					  var jsonData=JSON.parse(JSON.stringify($scope.DataToSend));
   					  $log.info(jsonData);
   					  
   					$http(
   							{
   								url : "UpdateResult",			
   								contentType : 'application/json; charset=utf-8',
   								dataType : 'json',
   								method : "POST",
   								data : jsonData
   								
   							})
   							.then(function successCallback(response) {
   										// if success   then generate student table

   										console.log("response came 2********");
   										//$window.location.reload();
   										$scope.GetESSR();
   										console.log(response);
   										$scope.ExamSubjectStudentResult=response.data;
   										
   									
   									},
   									function errorCallback(response) {
   										// failed
   										console.log("error response came 2********");
   										console.log(response);
   									});
   					  
   					  }
   			  
	   			
	   			$scope.toggleSave_and_Edit_button();
	   			//$log.info($scope.DataToSend);
	   		}

		

		   
	   };
}())