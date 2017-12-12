

  		var app = angular.module('myApp', ['ui.bootstrap']);
  		
   		app.controller('myCtrl', function($scope, $http, $filter) {


   		
   			$scope.studentList=JSON.parse('${StudentListJSON}');
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}'); 


   		 $scope.filteredTodos = []
   	  ,$scope.currentPage = 1
   	  ,$scope.numPerPage = 5
   	  ,$scope.maxSize = 6,
   	  
   	$scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
   	   	console.log("total length"+$scope.totallenght)
   			 
   		 console.log("hello console");

   		$scope.idSelectedStudent = null; 

   		 $scope.selected= []; 


   		$scope.setSelected = function (idSelectedVote) {
   		   $scope.idSelectedVote = idSelectedVote;
   		}
   		
   		$scope.Selecte = function (student) {
   	   		console.log("inside the function");
   	   		console.log($scope.selected);

		   	   	var hasMatch =false;
		
		   	 for (var index = 0; index < $scope.selected.length; ++index) {
		
		   	  var stud = $scope.selected[index];
		
		   	  if(stud.id == student.id){
		   	    hasMatch = true;
		   	    break;
		   	  }
		   	 }

   	   		if(hasMatch)  
   	   	   		{
   	   	   		console.log("object was in the array but removed now");
   	   	//delete student from array
           	 for( i=$scope.selected.length-1; i>=0; i--) {
           		    if( $scope.selected[i].id == student.id) $scope.selected.splice(i,1);
           		} 
   	   	   		
   	   	   		}
   	   		else
   	   	   		{
   	   		$scope.selected.push(student)
   	   	   		console.log("object was not in the array added it now");
   	   	   		}

   	   	console.log("after function executed"+$scope.selected);
    		  
    		}



   		$scope.IsContains=function (student) {
   	   		console.log("inside the Iscontains function")
   			var hasMatch =false;
   			
		   	 for (var index = 0; index < $scope.selected.length; ++index) {
		
		   	  var stud = $scope.selected[index];
		
		   	  if(stud.id == student.id){
		   	    hasMatch = true;

		   	    console.log("match found");
		   	    break;
		   	  }
		   	 }
		   	 return hasMatch;
   		};

   		$scope.add=function () {
   	   		console.log("inside the add function")
   			var length=$scope.selected.length-1
	   	   	for( i=length; i>=0; i--) {
	
		   	   	   	var tempStudent=$scope.selected[i];
		
				   	   	 for( j=$scope.studentList.length-1; j>=0; j--) {
				 		    if( $scope.studentList[j].id == tempStudent.id)
				 		    {
					 		     $scope.studentList.splice(j,1);	
					 		   
					 		     
					 		    		 		 		 
				 		    }
				 		}   
				   	  for( j=$scope.filteredTodos.length-1; j>=0; j--) {
				 		    if( $scope.filteredTodos[j].id == tempStudent.id)
				 		    {
					 		     $scope.filteredTodos.splice(j,1);	
					 		   
					 		     
					 		    		 		 		 
				 		    }
				 		}    
				   	$scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;		   
	   		} 

   	   	 for( i=$scope.selected.length-1; i>=0; i--) {
 		     $scope.selected.splice(i,1);
 		}   
		
   		};



   		$scope.$watch('currentPage + numPerPage', function() {
   		    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
   		    , end = begin + $scope.numPerPage;
   		    console.log("begin is "+begin+" end is "+end)
   		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
   		  });


   	 $scope.filter = function(){
   	    var results = $scope.filteredRT;
   	    results.length = 0;
   	    var searchText = $scope.searchText;
   	    var reminderTypes = $scope.reminderTypes;

   	    for(var i = 0; i < reminderTypes.length; ++i){
   	      if(searchText.length > 0){
   	        if(reminderTypes[i].Name.toLowerCase().includes(searchText.toLowerCase())){
   	          results.push(reminderTypes[i]);
   	        }
   	      } else {
   	        results.push(reminderTypes[i]);
   	      }
   	    }
   	 };
     		  			  			   			  			 			  			
   		}); 
   		