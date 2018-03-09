(function(){
	   
			angular.module('myApp').controller('studentRequestController', function($scope, $http) {
		
		
		

		 console.log("********studentRequestController***********");

		 $http.get("StudentRequestManagerList") .then(function successCallback(response) {			 
			 console.log("we got response of StudentRequestManager" +response.data);
			 $scope.studentList=response.data;       	         
        }, 
      function errorCallback(response) {              
                 $scope.message=data.message;
        	 console.log(" failed to get the studentlist for approval with message : "+data.message);      
        });

    

		
		
		
		 //-------------delete fucntion-------------------
		    $scope.deleteStudent=function(student)
		    { 
		
		      console.log("hello from delete function console");
		        $http({
		            url: "deleteStudentApprovalRequest/"+student.id,
		            method: "GET",          
		        })
		        .then(function successCallback(response) {
		
		        
		        	 console.log(" Student is deleted : "+student.id);
		        	 console.log("Student is deleted and response recieved is :"+response.data.message);
		
		        	if(response.data.status=="success"){
		                // if success       	
		        	
		
		 			
		        	 $scope.deletemessage=response.data.message;
		        	//delete the role from array
		        	 for( i=$scope.studentList.length-1; i>=0; i--) {
		        		    if( $scope.studentList[i].id ==student.id) $scope.studentList.splice(i,1);
		        		}  
		        	}            
		        }, 
		      function errorCallback(response) {
		                // failed
		                 $scope.message=data.message;
		        	 console.log(" teacher deletion failed and response is "+data.message);      
		        });
		
		    };
		
		
		
		
		
		    //-------------Approve fucntion-------------------//
		    $scope.approve=function(student)
		    { 
		
		    console.log("inside student approval request")
		
		    
		
		 
		
		
		        $http({
		            url: "StudentRequestApprover/"+student.id,
		         contentType : 'application/json; charset=utf-8',
		      dataType : 'json',
		            method: "GET",  		              
		        })
		        .then(function successCallback(response) {
		                // if success   
		                
		                console.log("response came");    	
		        	
				var status=response.data.status;
				if(response.data.status=="success"){
		
					 console.log(" student is approved : "+student.id);
		        	 console.log("student is deleted and response recieved is :"+response.data.message);
		 			
		        	 $scope.deletemessage=response.data.message;
		        	//delete the role from array
		        	 for( i=$scope.studentList.length-1; i>=0; i--) {
		        		    if( $scope.studentList[i].id == student.id) $scope.studentList.splice(i,1);
		        		}    
		
				}          
		        }, 
		     function errorCallback(response) {
		                // failed
		                
		                 console.log("error response came");    	
		                 $scope.deletemessage=response.data.message;
		        	 console.log(" student is deletion failed and response is "+data.message);      
			        });
		
			    };
		 
			 
		 		  			  			   			  			 			  			
			}); 
   		
   		  		
   		


   	   }())

  		   		