 app.controller("editProfileCtrl",function($http,$scope,shairedDataService){		
//	 							console.log((sessionStorage.getItem("teacherJSON")));
//	 							//console.log( session.getAttribute("teacherJSON"));
//								$scope.teacher=JSON.parse(sessionStorage.getItem("teacherJSON") );
//						   		$scope.permissions=JSON.parse(sessionStorage.getItem("permissions")) ;
						   		
						   		$scope.teacher=shairedDataService.teacher;
					    		$scope.permissions=shairedDataService.permissions; 
					    		$scope.institute=shairedDataService.institute;
 				
						   		console.log("teacher is "+$scope.teacher.fname);
						   		//console.log("teacher id is "+$scope.teacher["id"]);  	
								
								 /*---------getting information of loged in teacher--------*/
								/* $http({
									    url: 'GetExistingInstitutes',
									    contentType : 'application/json; charset=utf-8',
									  	 dataType : 'json', 
									    method: 'GET',    
									    
									}).then(function successCallback(response) {
									    $scope.institutes = response.data;
									   
									}, function errorCallback(response) {
									 console.log(response.statusText);
									}); */
													 
								 
								 
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
						    		console.log(response.data.teacher);
						    	}else{
						    		console.log("error while updating teacher");
						    	}
						    
						    	clearform();
						   		
						   }, function errorCallback(response) {
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
