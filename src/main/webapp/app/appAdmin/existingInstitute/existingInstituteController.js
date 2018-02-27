(function(){
	

	angular.module('myApp').controller('existingInstituteController',existingInstituteController);
	
	existingInstituteController.$inject=['$scope','$http','$filter'];
	
	function existingInstituteController($scope,$http,$filter){
		console.log("This is from existingInstituteController");
		$scope.instituteSaved=false;
		$scope.institutes=[];
					$scope.instituteform=
						{
							
							id:"",
							name:"",
							address:"",
							contactno:"",
							email:"",
							subscriptionTill:"",
						};
						
					$http({
					    url: 'GetExistingInstitutes',
					    contentType : 'application/json; charset=utf-8',
					  	 dataType : 'json', 
					    method: 'GET',    
					    
					}).then(function successCallback(response) {
					    $scope.institutes = response.data;
					   
					}, function errorCallback(response) {
					 console.log(response.statusText);
					});
					
					
			/*-----------		Edit Institute     -----------------*/
					$scope.EditInstitute = function(institute) {
						console.log("loading form data");
						$scope.instituteform.id=institute.id;
						$scope.instituteform.name=institute.name;
						$scope.instituteform.address=institute.address;
						$scope.instituteform.contactno=institute.contactno;
						$scope.instituteform.email=institute.email;
						$scope.instituteform.subscriptionTill=institute.subscriptionTill;
						};

		//-------------------------------Update isntitute function -------------------------------		
					$scope.UpdateInstitute = function(instituteform) {
					var collectionDate = instituteform.subscriptionTill;
					//$scope.instituteform.subscriptionTill= $filter('date')(new Date(collectionDate),'yyyy-MM-dd');
					console.log(instituteform.subscriptionTill);
					$scope.instituteform.subscriptionTill =new Date(collectionDate);
				  
					$http(
							{
								url : "updateInstitute",
								contentType : 'application/json; charset=utf-8',
								dataType : 'json',
								method : "POST",
								data : instituteform
							})
							
							
							.then(function successCallback(response) {
								
								$scope.SuccessMessage="Institute is Modified Successfully."
								$scope.instituteSaved=true;
						    	console.log("success");
						    	if(response.data.message==null)
						    		{
						    		
							    		var newInstitute=response.data;
							    		
							    		console.log(newInstitute);
							    		for(var i=0;i<$scope.institutes.length;i++)
							    		{
							    			if($scope.institutes[i].id==$scope.instituteform.id)
						    				{
							    				$scope.institutes[i]=newInstitute
							    			    
						    				}
							    		}
						    		}
						    	  
						    
						   		
						   }, function errorCallback(response) {
						    console.log(response.statusText);
						   });
					};

					
					$scope.datepickerActivate = function() {
						
						$('.datepicker').pikaday({
							firstDay : 1
						});
					};
					$scope.datepickerActivate();

		  };



	
	
}())
	