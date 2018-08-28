 app.controller("editProfileCtrl",function($http,$scope,shairedDataService){		

						   		
						   		$scope.teacher=shairedDataService.teacher;
					    		$scope.permissions=shairedDataService.permissions; 
					    		$scope.institute=shairedDataService.institute;
 				
						   		console.log("teacher is "+$scope.teacher.fname);
						   		
						   		$scope.updateSuccess=false;
						   		$scope.deleteSuccess=false;
						   		
								 
								 
				/* ------------------------Edit Profile Funtion-----------------------	 */			 
								 
				$scope.updateProfile=function(teacher)
				{
					$http(
							{
								url : "updateTeacher",
								contentType : 'application/json; charset=utf-8',
								dataType : 'json',
								method : "POST",
								data : teacher,
							
								
							})
							
							.then(function successCallback(response) {
						    	
						    	console.log("success while response");
						    	if(response.data.status=="success"){
						    		shairedDataService.teacher=response.data.teacher;
						    		$scope.teacher=response.data.teacher;
						    		console.log(response.data.teacher);
						    		$scope.updateSuccess=true;
							   		$scope.deleteSuccess=false;
						    	}else{
						    		$scope.updateSuccess=false;
							   		$scope.deleteSuccess=true;
						    		console.log("error while updating teacher");
						    	}
						    
						    	clearform();
						   		
						   }, function errorCallback(response) {
							   console.log(response);
						    console.log(response.statusText);
						   
						    clearform();
					
				});
				
						
				
				};
/* ---------------------------------	clear form	------------------------------------	 */	
			function clearform()
			{
				$scope.teacher.fname="";
				$scope.teacher.lname="";
				$scope.teacher.contactno="";
				$scope.teacher.email="";
				
				
			};
				
				
								 
								 
		});
