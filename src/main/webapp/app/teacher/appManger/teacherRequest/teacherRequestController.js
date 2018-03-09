(function(){
	
	angular.module("myApp").controller("teacherRequestController",teacherRequestController)
	
	function  teacherRequestController($scope, $http){

		   		 console.log("************ teacherRequestController ***************");   		 
	
		   	 $http.get("TeacherRequestForApprovalListJSON") .then(function successCallback(response) {			 
				 console.log("we got response of TeacherRequestManager" +response.data);
				 
				 $scope.teacherList=response.data;       	         
	        },   
		        function errorCallback(response) {              
	                $scope.message=data.message;
	                console.log(" failed to get the teacher for approval with message : "+data.message);      
	       });

		   		 
		   		 $scope.checkbox = {
		   				authorise_student : false,
		   				authorise_teacher :false,
		   				fill_attendance :false,
		   				fill_schedule :false,
		   				mail_parent :false,
		   				mail_student :false,
		   				mail_teacher :false,
		   				msg_parent :false,
		   				msg_student : false,
		   				msg_teacher :false,
		   				set_exam :false,
		   				update_results :false,
		   				alter_institute_structure :false  				
		   		     }; 	
		   		
		   		 $scope.resetPermissions=function()
		   		    { 
		   			$('#myModal').modal('show');
		   			 
		   			 $scope.checkbox = {
		   	   				authorise_student : false,
		   	   				authorise_teacher :false,
		   	   				fill_attendance :false,
		   	   				fill_schedule :false,
		   	   				mail_parent :false,
		   	   				mail_student :false,
		   	   				mail_teacher :false,
		   	   				msg_parent :false,
		   	   				msg_student : false,
		   	   				msg_teacher :false,
		   	   				set_exam :false,
		   	   				update_results :false,
		   	   				alter_institute_structure :false  				
		   	   		     }; 

		   		    };
		   		

		//-------------Approve fucntion-------------------
		    $scope.approve=function(teacher)
		    { 

			 var parameters = {};
						 
			 parameters.authoriseStudent=$scope.checkbox.authorise_student;
			 parameters.authoriseTeacher=$scope.checkbox.authorise_teacher;
			 parameters.fillAttendance=$scope.checkbox.fill_attendance;
			 parameters.fillSchedule=$scope.checkbox.fill_schedule;
			 parameters.mailParent=$scope.checkbox.mail_parent;
			 parameters.mailStudent=$scope.checkbox.mail_student;
			 parameters.mailTeacher=$scope.checkbox.mail_teacher;
			 parameters.msgParent=$scope.checkbox.msg_parent;
			 parameters.msgStudent=$scope.checkbox.msg_student;
			 parameters.msgTeacher=$scope.checkbox.msg_teacher;
			 parameters.setExam=$scope.checkbox.set_exam;
			 parameters.updateResults=$scope.checkbox.update_results;
			 parameters.alterInstituteStructure=$scope.checkbox.alter_institute_structure
			 

		    console.log("inside teacher approval request")

		    	var data = JSON.stringify({});

		  console.log("inside teacher approval request datat is :"+data);


		        $http({
		            url: "TeacherRequestApprover/"+teacher.id,
		         contentType : 'application/json; charset=utf-8',
		      dataType : 'json',
		            method: "GET",  
		            params :parameters      
		        })
		        .then(function successCallback(response) {
		                // if success   
		                
		                console.log("response came");    	
		        	
				var status=response.data.status;
				if(response.data.status=="success"){

					 console.log(" teacher is approved : "+teacher.id);
		        	 console.log("teacher is deleted and response recieved is :"+response.data.message);
		 			
		        	 $scope.deletemessage=response.data.message;
		        	//delete the role from array
		        	 for( i=$scope.teacherList.length-1; i>=0; i--) {
		        		    if( $scope.teacherList[i].id == teacher.id) $scope.teacherList.splice(i,1);
		        		}    

				}          
		        }, 
		     function errorCallback(response) {
		                // failed
		                
		                 console.log("error response came");    	
		                 $scope.deletemessage=response.data.message;
		        	 console.log(" teacher is deletion failed and response is "+data.message);      
		        });

		    };




		      		 //-------------delete fucntion-------------------
		      		    $scope.deleteTeacher=function(teacher)
		      		    { 

		      		      console.log("hello from delete function console");
		      		        $http({
		      		            url: "deleteTeacherApprovalRequest/"+teacher.id,
		      		            method: "GET",          
		      		        })
		      		        .then(function successCallback(response) {

		      		        
		      		        	 console.log(" teacher is deleted : "+teacher.id);
		      		        	 console.log("teacher is deleted and response recieved is :"+response.data.message);

		      		        	if(response.data.status=="success"){
		      		                // if success       	
		      		        	

		      		 			
		      		        	 $scope.deletemessage=response.data.message;
		      		        	//delete the role from array
		      		        	 for( i=$scope.teacherList.length-1; i>=0; i--) {
		      		        		    if( $scope.teacherList[i].id == teacher.id) $scope.teacherList.splice(i,1);
		      		        		}  
		      		        	}            
		      		        }, 
		      		      function errorCallback(response) {
		      		                // failed
		      		                 $scope.message=data.message;
		      		        	 console.log(" teacher deletion failed and response is "+data.message);      
		      		        });

		      		    };

		      		    
		   			  			   			  			 			  			
		   		}; 
		   		

	
	
}())