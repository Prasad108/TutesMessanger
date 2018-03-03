 app.controller("myController",function($http,$scope, $localStorage,
		    $sessionStorage){		
	 							console.log((sessionStorage.getItem("teacherJSON")));
	 							//console.log( session.getAttribute("teacherJSON"));
								$scope.teacher=JSON.parse(sessionStorage.getItem("teacherJSON") );
						   		$scope.permissions=JSON.parse(sessionStorage.getItem("permissions")) ;
 				
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
								url : "editTeacher",
								contentType : 'application/json; charset=utf-8',
								dataType : 'json',
								method : "POST",
								data : teacher,
							
								
							})
							
							.then(function successCallback(response) {
						    	
						    	console.log("success while response");
						    
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
