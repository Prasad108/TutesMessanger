
	
	app.controller("addNewIsntituteController",function($scope,$http,$filter){
  	  
		console.log("This is from addNewInstituteController");
		$scope.instituteSaved=false;
  	  $scope.InstituteFormAdminForm={
  			  instName:"",
  			  instAddress:"",
  			  instContactNo:"",
  			  instEmail:"",
  			  instSubscriptionTill:"",
  			  adminName:"",
  	    	  adminSurname:"",
  	    	  adminContactNo:"",
  	    	  adminEmail:"",
  	  };
  
  	  
  	  
//-------------------------------Save isntitute with its Admin function -------------------------------
  	  $scope.AddInstituteAdmin = function(InstituteFormAdminForm) {
  		  
  		console.log("inside function of add");
  		
  		$scope.instituteSaved=false;
  		$scope.instituteSavedError=false;
			var collectionDate = InstituteFormAdminForm.instSubscriptionTill;
			
			
			$scope.InstituteFormAdminForm.instSubscriptionTill =new Date(collectionDate);
		     console.log(InstituteFormAdminForm);
		    
		     
		    
			$http(
					{
						url : "SaveInstituteAdminInstitute",
						contentType : 'application/json; charset=utf-8',
						dataType : 'json',
						method : "POST",
						data : InstituteFormAdminForm,
					
						
					})
					
					.then(function successCallback(response) {
				    	
				    	console.log("success while response");
				    	$scope.SuccessMessage="Institute Saved with Institute Admin.";
				    	$scope.instituteSaved=true;
				    	clearform();
				   		
				   }, function errorCallback(response) {
				    console.log(response.statusText);
				    console.log("error while response");
				    $scope.ErrorMessage="Error in Registration, Please try with another name This Data is already Registered."
				    $scope.instituteSavedError=true;
				    clearform();
				   });
					 
  	  
  	  
  	  };
  	  
/*-----------------------------------clear form function ----------------------------------------*/
  	   function clearform()
  	    {
  	    	  $scope.InstituteFormAdminForm.instName="";
  	          $scope.InstituteFormAdminForm.instAddress="";
  	          $scope.InstituteFormAdminForm.instContactNo="";
  	          $scope.InstituteFormAdminForm.instEmail="";
  	          $scope.InstituteFormAdminForm.instSubscriptionTill="";
  	          $scope.InstituteFormAdminForm.adminName="";
  	          $scope.InstituteFormAdminForm.adminSurname="";
  	          $scope.InstituteFormAdminForm.adminContactNo="";
  	          $scope.InstituteFormAdminForm.adminEmail="";
  	    };
  	    
  	  $scope.datepickerActivate = function() {
			$('.datepicker').pikaday({
				firstDay : 1
			});
		};
		
		 $scope.datepickerActivate();
  	   
  	  
  	
    });

	
