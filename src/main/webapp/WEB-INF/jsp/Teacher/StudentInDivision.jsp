<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="studentCtrl">
<head>
<title>Student In Division</title>
<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />
<%-- <jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" /> --%>


 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" /> -->



<!-- <link data-require="bootstrap-css@*" data-semver="3.3.1" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" /> -->
  
    <script data-require="ui-bootstrap@*" data-semver="0.12.1" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.min.js"></script>
 
<style> 
		  .selectedrow {	  
		  
		    background-color:aqua;   
			}    
			
			tr:hover {
		  background-color: none;
			}  
			
			tr:hover td {
			  color: blue;
					}
					
</style>
 
 <script>
  /*  $(document).ready(function()
    {
    	$('#disabledSelectForClassesForShowStudent').attr('disabled','disabled');
    	$('#disabledSelectForDivisionForShowStudent').attr('disabled','disabled');
    	$('#showStudentSubmitBTN').attr('disabled','disabled');
    	
    	$("#errorMessage").hide();
    	
    	
    	//-------------------------------select Branch to show students--------------------------
    	$('#SelectBranchForShowStudent').change(function() {
    		   	 var  others = $(this).find(":selected").val();
    		        if(others != 0)
    		        {   
    		         $("#disabledSelectForDivisionForShowStudent").html('<option value="0">--- Select Division ---</option>');
    	    		 $('#disabledSelectForDivisionForShowStudent').attr('disabled','disabled'); 
    	    		 $('#showStudentSubmitBTN').attr('disabled','disabled'); 
    	    		
    		         $.getJSON("GetClassesList/"+$(this).find(":selected").val(), function(jsonData)
    		          {
    		            cb = '';
    		            $.each(jsonData, function(i,data){
    		        	cb+='<option value="'+data.value+'">'+data.name+'</option>';
    		        	});
    		        	  $("#disabledSelectForClassesForShowStudent").html(cb);
    		        	});	
    			        		            
    		   		    $('#disabledSelectForClassesForShowStudent').removeAttr('disabled'); 
    		   	      }
    		         else
    		         {
    		          $('#disabledSelectForClassesForShowStudent').html('<option value="0">--- Select Class ---</option>');
    		          $('#disabledSelectForClassesForShowStudent').attr('disabled','disabled'); 
    		          $("#disabledSelectForDivisionForShowStudent").html('<option value="0">--- Select Division ---</option>');
    		     	  $("#disabledSelectForDivisionForShowStudent").attr('disabled','disabled'); 
    		          $('#showStudentSubmitBTN').attr('disabled','disabled');
    		         }  
    	    }); 
    	
    	//-------------------------------select class to delete division-----------------------------
        $("#disabledSelectForClassesForShowStudent").change(function(){
            var selectedClass=$("#disabledSelectForClassesForShowStudent option:selected").val();
   		    var selectedbranch=$("#SelectBranchForShowStudent option:selected").val();
   		     if(selectedClass != 0 ){
   		    	 if(selectedbranch != 0){
   		    	 $.getJSON("GetDivisionList/"+$("#disabledSelectForClassesForShowStudent option:selected").val(), function(jsonData){
	        	     cb = '';
	        	     $.each(jsonData, function(i,data){
	        	         cb+='<option value="'+data.value+'">'+data.name+'</option>';
	        	     });
	        	     $("#disabledSelectForDivisionForShowStudent").html(cb);
	        	});
   		    	 
   		    	$('#disabledSelectForDivisionForShowStudent').removeAttr('disabled');
   		    	 }
   		    } 
   		     else{
   		    	$("#disabledSelectForDivisionForShowStudent").html('<option value="0">--- Select Division ---</option>');
   		    	$('#disabledSelectForDivisionForShowStudent').attr('disabled','disabled'); 
   		        $('#showStudentSubmitBTN').attr('disabled','disabled');
   		        }
   });
    	
      //-----------------------------select division to delete------------------------
	       $("#disabledSelectForDivisionForShowStudent").change(function(){
	    	var selectedDivision=$("#disabledSelectForDivisionForShowStudent option:selected").val();
	    	var selectedClass=$("#disabledSelectForClassesForShowStudent option:selected").val();
	    	var others=$("#SelectBranchForShowStudent").val();
	    	if(selectedDivision != 0 )
	    		{
	    		 if(selectedClass != 0 )
	    		 {
	    			 if(others != 0)
	    			 {
	    		      $('#showStudentSubmitBTN').removeAttr('disabled');
	    		     }
	    		 }
	    		}
	    	    else
	    	    {
	    	     $('#showStudentSubmitBTN').attr('disabled','disabled'); 
	    	    }
	   	});
      
     $("#showStudentSubmitBTN").on('click',function(){
	    	   
	    	   $.getJSON("GetStudentOfDivision/"+$("#disabledSelectForDivisionForShowStudent option:selected").val(), function(jsonData)
	    		          {
	    		  
	    		  
				    		   if(jsonData.ErrorMessage=="Selected division does not contain any student")
				    			   {
					    			   alert("error message");
					    			   $("#errorMessage").show();
					    			   $("#contentOfErrorMessage").html(jsonData.ErrorMessage);
				    			   }
				    		   else{
				    			   
						    			   alert("sucess message");
						    			   $("#contentOfErrorMessage").html("");
						    			   $("#errorMessage").hide();
						    			   
						    			   app.controller('studentCtrl', function($scope, $http,jsonData) {
						    				   
						    				   $scope.studentList=jsonData; 
						    			   });   	
				    			   }
	    		   
	    		   				
	    		          });
	    	   
	    	   
	    	}); 
	
 });  */
  </script>
  
  <script>
  		var app = angular.module('myApp',  ['ui.bootstrap']);
  		
   		app.controller('studentCtrl', ['$scope', '$http', '$filter', function($scope,$http,$filter) {
   			
   			$scope.branchList=JSON.parse('${branchListJSON}');
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}');
   			
   			console.log("teacher is "+$scope.teacher);
   			console.log("teacher id is "+$scope.teacher["id"]);
   			
   		//--------initialise arrayt for different list-----	
   			$scope.studentList=[];
   			$scope.divisionList=[];
   			$scope.selectedstudentList=[];

   			$scope.divisionListModal=[];
   			$scope.classListModal=[];
   			
   	//--------initialise variable to show/hide some division-----
   			$scope.NoStudentInDivision=false;
   			$scope.ShowStudentTable=false;
   			$scope.ShowSelectAll=true;
   			$scope.selectStudentFirstMessage=false;
   			$scope.deleteSucessStudent=false;

   			$scope.SelectErrorMessageModal=true;
   			$scope.StudentsMovedToDivsionSuccusfully=false;
   			
   			$scope.noneSelected=false;

   			$scope.selectedstudentList=[];
   			
   		 $scope.filteredTodos = []
      	  ,$scope.currentPage = 1
      	  ,$scope.numPerPage = 10
      	  ,$scope.maxSize = 3,
      	  
      	$scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
   			
   			console.log($scope.branchList);
   		
   			
//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
   			$scope.selectedBranch=function(){ //on change of branch
   				
   				$scope.NoStudentInDivision=false; //to remove error message	
   				$scope.ShowStudentTable=false;    //do not show student table
   				
   			 for( i=$scope.divisionList.length-1; i>=0; i--)
   			        { 
   				     //to clean the division list
   				     $scope.divisionList.splice(i,1);
	        		} 
   				
		   		console.log($scope.selectBranch.name); 
		   				
		   	//*********to get the class list of selected branch******
		   			 $http({            
		   	            url: "GetClassesListInJSON/"+$scope.selectBranch.id,
		   	         	contentType : 'application/json; charset=utf-8',
		   	    	 	 dataType : 'json',
		   	            method: "GET"       
		   	        })
		   	        .then(function successCallback(response) {
		   	                // if success   then generate classlist dropdown
		   	                
		   	            console.log("response came"); 
		   	            $scope.classList=response.data;
		   	            
		   	         	for( i=$scope.classList.length-1; i>=0; i--) {
		   	          		console.log($scope.classList[i].name);    	
		        		}       
		   	        }, 
		   	    		 function errorCallback(response) {
		   	                // failed
		   	                console.log("error response came");    	             
		   	        });
   			} ;
   			
//--------------------------------------------- For getting dynamic division on change class angular js----------------------------   			
			$scope.selectedClass=function(){
	
				$scope.NoStudentInDivision=false; //to remove error message	
				$scope.ShowStudentTable=false;    //do not show student table
   				
		   		console.log($scope.selectedClass.name);
		   		
		   	  	//*********to get the Division list of selected class******
		   			 $http({
		   	            url: "GetDivisionListInJSON/"+$scope.selectClass.id,
		   	         	contentType : 'application/json; charset=utf-8',
		   	    	 	 dataType : 'json',
		   	            method: "GET" 
		   	               
		   	        })
		   	        .then(function successCallback(response) {
		   	                // if success   then generate divisionlist dropdown
		   	                
		   	                console.log("response came"); 
		   	            $scope.divisionList=response.data;
		   	            
		   	         for( i=$scope.divisionList.length-1; i>=0; i--) {
		   	          console.log($scope.divisionList[i].name);    	
		        		}    
		    
		   	        }, 
		   	    		 function errorCallback(response) {
		   	                // failed
		   	                 console.log("error response came");    	
		   	        });
   			};


   		//---------------------------------------------****Modal********* For getting dynamic Classes on change branch angular js----------------------------   			
   			$scope.selectedBranchModal=function(){ //on change of branch

   				$scope.SelectErrorMessageModal=true;
   				
   			 for( i=$scope.divisionListModal.length-1; i>=0; i--)
   			        { 
   				     //to clean the division list
   				     $scope.divisionListModal.splice(i,1);
	        		} 
   				
		   		console.log($scope.selectBranchModal.name); 
		   				
		   	//*********to get the class list of selected branch******
		   			 $http({            
		   	            url: "GetClassesListInJSON/"+$scope.selectBranchModal.id,
		   	         	contentType : 'application/json; charset=utf-8',
		   	    	 	 dataType : 'json',
		   	            method: "GET"       
		   	        })
		   	        .then(function successCallback(response) {
		   	                // if success   then generate classListModal dropdown
		   	                
		   	            console.log("response came"); 
		   	            $scope.classListModal=response.data;
		   	            
		   	         	for( i=$scope.classListModal.length-1; i>=0; i--) {
		   	          		console.log($scope.classListModal[i].name);    	
		        		}       
		   	        }, 
		   	    		 function errorCallback(response) {
		   	                // failed
		   	                console.log("error response came");    	             
		   	        });
   			} ;
   			
//---------------------------------------------****Modal********* For getting dynamic division on change class angular js----------------------------   			
			$scope.selectedClassModal=function(){

				$scope.SelectErrorMessageModal=true;
   				
		   		console.log($scope.selectedClassModal.name);
		   		
		   	  	//*********to get the Division list of selected class******
		   			 $http({
		   	            url: "GetDivisionListInJSON/"+$scope.selectClassModal.id,
		   	         	contentType : 'application/json; charset=utf-8',
		   	    	 	 dataType : 'json',
		   	            method: "GET" 
		   	               
		   	        })
		   	        .then(function successCallback(response) {
		   	                // if success   then generate divisionlistModal dropdown
		   	                
		   	                console.log("response came"); 
		   	            $scope.divisionListModal=response.data;
		   	            
		   	         for( i=$scope.divisionListModal.length-1; i>=0; i--) {
		   	          console.log($scope.divisionListModal[i].name);    	
		        		}    
		    
		   	        }, 
		   	    		 function errorCallback(response) {
		   	                // failed
		   	                 console.log("error response came");    	
		   	        });
   			};
   		

 //---------------------------------------------****Modal********* on change hide error message of selec----------------------------
   			$scope.selectedDivisionModal=function(){
   	   			
   				$scope.SelectErrorMessageModal=false;
   	   			};
   	   		
//--------------------------------------------- To get Student list on click button ----------------------------   			
   			$scope.getStudent=function(){
   				$scope.NoStudentInDivision=false; //to remove error message	
   				$scope.ShowStudentTable=false;    //do not show student table
   				
	   			if (!($scope.selectDivision === undefined || $scope.selectDivision === null))	
	   			{
			   			 var data = JSON.stringify({id:$scope.selectDivision.id,name:$scope.selectDivision.name});
			   			 	
			   		//*********to get the student list of selected division ******
				   			 $http({
				   	            url: "GetStudentOfDivisionInJSON",
				   	         	contentType : 'application/json; charset=utf-8',
				   	    	 	dataType : 'json',
				   	            method: "POST" ,        
				   	            data: data
				   	               
				   	        })
				   	        .then(function successCallback(response) {
				   	                // if success   then generate student table
					   	                
					   	                console.log("response came"); 
					   	         	if(response.data.ErrorMessage)
					   	         		{
					   	         		console.log("there is error or no student in division");
					   	         			$scope.NoStudentInDivision=true;      //to add error message	
					   	         		$scope.ShowStudentTable=false;    //do not show student table
					   	         		}
					   	         	else{
					   	         	console.log("succesess students are there");
					   	             $scope.ShowStudentTable=true;    //show student table
					   	        	 $scope.studentList=response.data;	
					   	        	 
					   	             console.log($scope.studentList);
					   	   			for (var i = 0; i < $scope.studentList.length; i++) {
					   	   				$scope.studentList[i].Selected=false;
					   	            };
					   	            
					   	     	$scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
					   	    
					   	            $scope.CheckUncheckHeader();
					   	        	 for( i=$scope.studentList.length-1; i>=0; i--) {
							   	          console.log($scope.studentList[i].fname);    	
							        		} 
					   	        	 
					   	        	 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
					        		    , end = begin + $scope.numPerPage;
					        		    console.log("begin is "+begin+" end is "+end)
					        		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
					   	        	 
					   	         	}
				   	        }, 
				   	    		 function errorCallback(response) {
				   	                // failed
				   	                console.log("error response came");    	          
				   	        });
	   				
	   				}
	   			else
	   				{
	   						console.log("division not selected");
	   				}	
   			};
   			
  //------------------------------- to hide student table on change division------------------------------------------  
   			$scope.selectedDivision=function()
   			{
   				$scope.ShowStudentTable=false;    //do not show student table
   			};
   			
	 			  			  			
   			$scope.CheckUncheckHeader = function () {
   				$scope.selectStudentFirstMessage=false;
   				$scope.deleteSucessStudent=false;
                $scope.IsAllChecked = true;
                
                for (var i = 0; i < $scope.studentList.length; i++) {
                    if (!$scope.studentList[i].Selected) {
                        $scope.IsAllChecked = false;
                        break;
                    }
                };
            };
            $scope.CheckUncheckHeader();
 
            $scope.CheckUncheckAll = function () {
            	$scope.selectStudentFirstMessage=false;
            	$scope.deleteSucessStudent=false;
            	
            	console.log("CheckUncheckAll :"+$scope.IsAllChecked)
            	
                for (var i = 0; i < $scope.studentList.length; i++) {
                	
                    $scope.studentList[i].Selected = $scope.IsAllChecked;
                }
                for (var i = 0; i < $scope.studentList.length; i++) {
                	console.log($scope.studentList[i].Selected)
                   
                }
            };
            
        	$scope.$watch('currentPage + numPerPage', function() {
       		    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
       		    , end = begin + $scope.numPerPage;
       		    console.log("begin is "+begin+" end is "+end)
       		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
       		  });
        	
        	$scope.filterStudent=function()
        	{

        		 
        		if(($scope.student_filter.length) > 0 )
        			{
        			 $scope.ShowSelectAll=false;
        			console.log(angular.isArray($scope.studentList));
        			var searchFilter=$scope.student_filter;
        			 console.log(searchFilter);
        			 
        			 $scope.filteredTodos= $filter('filter')($scope.studentList,searchFilter);
        			 
        			 console.log($scope.filteredTodos.length);
        			 
        			 	$scope.totallenght=$scope.filteredTodos.length/$scope.numPerPage*10;
        			 	
        				$scope.filteredCheckUncheckHeader();
        			}
        		else
        			{
        		 	$scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
        			
        			 $scope.ShowSelectAll=true;
        			 
        			 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
	        		    , end = begin + $scope.numPerPage;
	        		    console.log("begin is "+begin+" end is "+end)
	        		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
        			}
        	};
        	
        	$scope.filterCheckUncheckAll=function()
        	{
        		$scope.selectStudentFirstMessage=false;
        		$scope.deleteSucessStudent=false;
        		
        		 for (var i = 0; i < $scope.filteredTodos.length; i++) {
                     			 
        			 $scope.filteredTodos[i].Selected = $scope.IsFilteredAllChecked;
        			 
        			 for(var j=0;j< $scope.studentList.length; j++)
        				 {
        				 if( $scope.filteredTodos[i] == $scope.studentList[j] )
        					 {  
        					 $scope.studentList[j].Selected = $scope.IsFilteredAllChecked;
        					 break;
        					 }
        				 }
                 }
        	};
        	
        	$scope.filteredCheckUncheckHeader = function () {
                $scope.IsFilteredAllChecked = true;
                $scope.selectStudentFirstMessage=false;
                $scope.deleteSucessStudent=false;
                
                for (var i = 0; i < $scope.filteredTodos.length; i++) {
                    if (!$scope.filteredTodos[i].Selected) {
                        $scope.IsFilteredAllChecked = false;
                        break;
                    }
                };
            };
          	
      //------------------------- delete student from division -----------------------------------      
            $scope.deleteStudentFromDivision = function () {
            	 var index =[];
            	 $scope.deleteSucessStudent=false;      //------to show student delete success message                
            	 for (var i = 0; i < $scope.studentList.length; i++) {
                     if ($scope.studentList[i].Selected) {
                         console.log($scope.studentList[i].fname);
                         index.push(i);
                         $scope.selectedstudentList.push($scope.studentList[i]);  //--------push selected student in selectedStudentList array
                     }
                 }
            	
            	 for (var i = 0; i < $scope.studentList.length; i++){
            		 for (var j = 0; j < $scope.selectedstudentList.length; j++){
            			 if( $scope.studentList[i] == $scope.selectedstudentList[j])
            				 {
            				 $scope.studentList.splice(i,1);              //remove selected student from studentList
            				 }
            		 }
            	 }
       
            	 console.log($scope.studentList);
            		 
            		 $scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
            		 
            		 var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin + $scope.numPerPage;
	        		    console.log("begin is "+begin+" end is "+end)
	        		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
            
            	 if($scope.selectedstudentList.length != 0)           //----check selectedStudentList is empty or not
            		 {
            		 $scope.deleteSucessStudent=false; 
            		 $scope.selectStudentFirstMessage=false;
            		  console.log("selectedstudentList is not empty");
            		  
              //------- http post request to delete selected student-------
                    $http({
			   	            url: "DeleteSelectedStudentFromDivision",
			   	         	contentType : 'application/json; charset=utf-8',
			   	    	 	dataType : 'json',
			   	            method: "POST" ,        
			   	            data: JSON.stringify($scope.selectedstudentList)
			   	               
			   	        })
			   	        .then(function successCallback(response) {
			   	                // if success   
			   	        	$scope.deleteSucessStudent=true; 
			   	        }, 
			   	    		 function errorCallback(response) {
			   	                // failed
			   	                $scope.deleteSucessStudent=false;
			   	                 console.log("error response came");    	           
			   	        });  
            	 }
            	 else
                 {
            	  console.log("selectedstudentList is empty");
            	  $scope.selectStudentFirstMessage=true;
            	 }
            	 
            	 $scope.selectedstudentList.splice(0, $scope.selectedstudentList.length); //-----empty selectedStudentList array
            };	 	


            $scope.showModal=function(){
        	
         	   $scope.checkNoneSelected();
       	  
                if(!$scope.selectStudentFirstMessage)
                    { $('#myModal').modal({
                        show: 'true'
                    }); 
                };
            };	 	


          //--------------------- To check NoneSelected  ----------------------------  
             	   			$scope.checkNoneSelected=function(){
             	   				$scope.selectStudentFirstMessage=true;
          		   			 for (var i = 0; i < $scope.studentList.length; i++) {
          		                    if ($scope.studentList[i].Selected) {
          		                   	 $scope.noneSelected=false;
          		                   $scope.selectStudentFirstMessage=false;
          		                   	 break;                  
          		                    }
          		                }
             	   	   			};


             	     			
             	      			
//---------------------------- To Add Selected student to other division on click button ----------------------------   			
   	   			$scope.AddSelectedStudentToDivision=function(){

   	   				$scope.StudentsMovedToDivsionSuccusfully=false;  	   	             
   				
   	   	   			
		   	   		 	/* for (var i = 0; i < $scope.selectedstudentList.length; i++) {
		   	   				$scope.selectedstudentList.splice(i,1);
		   	   				i--;
		                } */
		         $scope.selectedstudentList.splice(0,$scope.selectedstudentList.length);      
		                for (var i = 0; i < $scope.studentList.length; i++) {
		                    if ($scope.studentList[i].Selected) {
		                    	$scope.selectedstudentList.push($scope.studentList[i]);                   
		                    }
		                }
		                var data=JSON.stringify($scope.selectedstudentList);

		   	   	        $http({
		   	   	     		url: "AddSelectedStudentToDivision/"+$scope.selectDivisionModal.id,
			   	         	contentType : 'application/json; charset=utf-8',
			   	    	 	dataType : 'json',
			   	            method: "POST" ,        
			   	            data: data				   	               
			   	        })
		   	   	        .then(function successCallback(response) {
		   	   	                // if success   then generate divisionlist dropdown
		   	   	                $scope.StudentsMovedToDivsionSuccusfully=true;

	   	   	                for (var i = 0; i < $scope.studentList.length; i++) {
		   	   	                if($scope.studentList[i].Selected)
			   	   	            {
					   	   				$scope.studentList.splice(i,1);
					   	   				i--;
			   	   	             }
		                	}
	   	   	          			$scope.PaginationInitialSetup();	
	   	   	          	  $scope.selectedstudentList.splice(0,$scope.selectedstudentList.length);
	   	   	          			
	   	   	          				   	   	               
		   	   	        }, 
		   	   	    		 function errorCallback(response) {
		   	   	                // failed		   	   	                
		   	   	                 console.log("error response came");    				   	   	                    
		   	   	        });
   	   	   	   			
   	   			};
             	   	   	   			
             	   	   	   		               
   	   	      $scope.PaginationInitialSetup=function(){
            	   $scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
            		$scope.CheckUncheckHeader();
                  	 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
           		    , end = begin + $scope.numPerPage;
           		    console.log("begin is "+begin+" end is "+end)
           		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
              			
                   };

                   $scope.disableSuccessMessage=function(){
                       $scope.StudentsMovedToDivsionSuccusfully=false;

                       };
               
            
   }]); 
   		
   	 </script>
   	  <script>
   		
   	//  $scope.studentList=JSON.parse('${StudentListJSON}');  
   	//		$scope.permissions=JSON.parse('${permissions}');  				
   		//	 console.log("student is "+$scope.student);
   		//	console.log("student id is "+$scope.student["id"]); 		
   			
   			
   			// var vm=this;
   		 //vm.getStudentList=function()
   	    //{ 
   	   // console.log("insidegetStudentList")
   	   // var selectedDiv=vm.ngSelectedDivision;
   	    // console.log(selectedDiv);
   	   
   	     //   $http({
   	       //     url: "GetStudentOfDivision/"+$scope.ngSelectedDivision,
   	        // contentType : 'application/json; charset=utf-8',
   	      //dataType : 'json',
   	        //    method: "GET",  
   	          //  params :parameters      
   	        //})
   	        //.then(function successCallback(response) {
   	                // if success   	                
   	          //      console.log("response came");    				   
   	       // }, 
   	    // function errorCallback(response) {
   	                // failed	                
   	      //           console.log("error response came");    	
   	                     
   	      //  }); 
   //	 }); 
   		//});
   	    
    /* angular.element(document).ready(function ($scope) {
     	$('#disabledSelectForClassesForShowStudent').attr('disabled','disabled');
     	$('#disabledSelectForDivisionForShowStudent').attr('disabled','disabled');
     	$('#showStudentSubmitBTN').attr('disabled','disabled');
     	
     	$("#errorMessage").hide();
     
     	//-------------------------------select Branch to show students--------------------------
     	$('#SelectBranchForShowStudent').change(function() {
     		   	 var  others = $(this).find(":selected").val();
     		        if(others != 0)
     		        {   
     		         $("#disabledSelectForDivisionForShowStudent").html('<option value="0">--- Select Division ---</option>');
     	    		 $('#disabledSelectForDivisionForShowStudent').attr('disabled','disabled'); 
     	    		 $('#showStudentSubmitBTN').attr('disabled','disabled'); 
     	    		
     		         $.getJSON("GetClassesList/"+$(this).find(":selected").val(), function(jsonData)
     		          {
     		            cb = '';
     		            $.each(jsonData, function(i,data){
     		        	cb+='<option value="'+data.value+'">'+data.name+'</option>';
     		        	});
     		        	  $("#disabledSelectForClassesForShowStudent").html(cb);
     		        	});	
     			        		            
     		   		    $('#disabledSelectForClassesForShowStudent').removeAttr('disabled'); 
     		   	      }
     		         else
     		         {
     		          $('#disabledSelectForClassesForShowStudent').html('<option value="0">--- Select Class ---</option>');
     		          $('#disabledSelectForClassesForShowStudent').attr('disabled','disabled'); 
     		          $("#disabledSelectForDivisionForShowStudent").html('<option value="0">--- Select Division ---</option>');
     		     	  $("#disabledSelectForDivisionForShowStudent").attr('disabled','disabled'); 
     		          $('#showStudentSubmitBTN').attr('disabled','disabled');
     		         }  
     	    }); 
     	
     	//-------------------------------select class to delete division-----------------------------
         $("#disabledSelectForClassesForShowStudent").change(function(){
             var selectedClass=$("#disabledSelectForClassesForShowStudent option:selected").val();
    		    var selectedbranch=$("#SelectBranchForShowStudent option:selected").val();
    		     if(selectedClass != 0 ){
    		    	 if(selectedbranch != 0){
    		    	 $.getJSON("GetDivisionList/"+$("#disabledSelectForClassesForShowStudent option:selected").val(), function(jsonData){
 	        	     cb = '';
 	        	     $.each(jsonData, function(i,data){
 	        	         cb+='<option value="'+data.value+'">'+data.name+'</option>';
 	        	     });
 	        	     $("#disabledSelectForDivisionForShowStudent").html(cb);
 	        	});
    		    	 
    		    	$('#disabledSelectForDivisionForShowStudent').removeAttr('disabled');
    		    	 }
    		    } 
    		     else{
    		    	$("#disabledSelectForDivisionForShowStudent").html('<option value="0">--- Select Division ---</option>');
    		    	$('#disabledSelectForDivisionForShowStudent').attr('disabled','disabled'); 
    		        $('#showStudentSubmitBTN').attr('disabled','disabled');
    		        }
    });
     	
       //-----------------------------select division to delete------------------------
 	       $("#disabledSelectForDivisionForShowStudent").change(function(){
 	    	var selectedDivision=$("#disabledSelectForDivisionForShowStudent option:selected").val();
 	    	var selectedClass=$("#disabledSelectForClassesForShowStudent option:selected").val();
 	    	var others=$("#SelectBranchForShowStudent").val();
 	    	if(selectedDivision != 0 )
 	    		{
 	    		 if(selectedClass != 0 )
 	    		 {
 	    			 if(others != 0)
 	    			 {
 	    		      $('#showStudentSubmitBTN').removeAttr('disabled');
 	    		     }
 	    		 }
 	    		}
 	    	    else
 	    	    {
 	    	     $('#showStudentSubmitBTN').attr('disabled','disabled'); 
 	    	    }
 	   	});
       
 	      $("#hide-showButtons").hide();
       
	       $("#showStudentSubmitBTN").on('click',function($scope){
 	    	   
 	    	   $.getJSON("GetStudentOfDivision/"+$("#disabledSelectForDivisionForShowStudent option:selected").val(), function(jsonData)
 	    		          {
 	    		               if(jsonData.ErrorMessage=="Selected division does not contain any student")
 				    			   {
 	    		            	      $("#hide-showButtons").hide();
 					    			  $("#TableForStudentInsideDivision").html("");
 					    			   $("#errorMessage").show();
 					    			   $("#contentOfErrorMessage").html(jsonData.ErrorMessage);
 					    		   }
 				    		   else{
 						    	 var studentList=jsonData;
 						    	 alert(jsonData.length);  
 				    			  var str="";
 				    			   $("#hide-showButtons").show();
 						    		str+="<table class='table table-hover' id='myTable'>";
 			                           str+="<tbody id='tableBody'>";
 			                            str+="<tr><td><button class='btn btn-danger' type='submit' id='submitBTNtodeleteStudentFromDivision'>Delete</button>  <button class='btn btn-primary' type='submit' id='submitBTNtoaddStudenttoOtherDivision'>Add to other division</button><td/><td></td><td></td></tr>"; 
 			                              str+="<tr>";
 			                                 str+="<th><i><input class='selectAllcheckbox' type='checkbox'/></i> Select All</th>";
 			                                 str+="<th><i class='icon_profile'></i> Full Name</th>";                               
 			                                 str+="<th><i class='icon_mail_alt'></i> Email</th>";                         
 			                                 str+="<th><i class='icon_mobile'></i> Mobile</th>";
 			                             str+="</tr>";
 			                             
 			                            $.each(studentList, function(key,value) {
 						    				str+="<tr class='selectedRow'>";
 						    				str+="<td><input class='selctedCheckbox' type='checkbox' name='studentsID' value='"+value.id+"' id='"+value.id+"'></td>";
						    			    str+="<td>"+value.fname+"  "+value.lname+"</td>";
	 						    			str+="<td>"+value.email+"</td>";
	 						    			str+="<td>"+value.contactno+"</td>";
	 	   		 				 			str+="</tr>";
 						    				}); 
 			                           
 			                               str+="</tbody></table>";
 						    	
 						    			  $("#TableForStudentInsideDivision").html(str);
 						    			  $("#contentOfErrorMessage").html("");
 						    			  $("#errorMessage").hide();
 						    		}
 	    		      });
 	 
 	    	   }); 
	       
    	});
   	    
   	    
   	 $('body').on('click', '#submitBTNtodeleteStudentFromDivision', function (){
   	 
   	 var favorite = [];
     $.each($("input[name='studentsID']:checked"), function(){            
         favorite.push($(this).val());
     });
     alert("selected students id: " + favorite.join(", "));
      }); 
   	 
   	 $('body').on('click', '.selectAllcheckbox', function (event){
   		 $('.selectedRow').toggleClass('selected');
   		 $(':checkbox', '.selectedRow').trigger('click');
     });
   	 
   	
     $('body').on('click', '.selctedCheckbox', function (event){ 
    	 if (event.target.type !== 'checkbox') { 
     	      $(':checkbox', this).trigger('click'); 
     	      $(this).parent().parent().toggleClass('selected');
     	      } 
    	
    }); 
   	 
   	 $('body').on('click', '.selectedRow', function (event){
   		 
   		if (event.target.type !== 'checkbox') {
   	      $(':checkbox', this).trigger('click');
   	      $(this).toggleClass('selected');
   	      }
      
          var rn=this.rowIndex; 
        });  
    
  $('body').on('keyup', '#FilterInbox', function (event){
   	    var rows = $("#tableBody").find("tr").hide();
   	    if (this.value.length) {
   	        var data = this.value.split("");
   	        $.each(data, function (i, v) {
   	            rows.filter(":contains('" + v + "')").show();
   	        });
   	    } else rows.show();
   	});
    
    $('body').on('keyup', '#FilterInbox', function (event) {
 		  // Declare variables 
 		  var input, filter, table, tr, td, i;
 		  input = document.getElementById("FilterInbox");
 		  filter = input.value.toUpperCase();
 		  table = document.getElementById("myTable");
 		  tr = table.getElementsByTagName("tr");
       
 		  // Loop through all table rows, and hide those who don't match the search query
 		  for (i = 0; i < tr.length; i++) {
 		    td = tr[i].getElementsByTagName("td")[1];
 		    if (td) {
 		      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
 		        tr[i].style.display = "";
 		      } else {
 		        tr[i].style.display = "none";
 		      }
 		    } 
 		  }
 		});  */
    
   		
   		
   </script>
</head>

<body ng-cloak class="ng-cloak">

	<section id="container" class="">
	       <!-- Default header --> 
	<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 
	       <!-- Default Menue -->
	<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" />
	
	<!-- <div ng-include="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp"></div> -->

	<section id="main-content">
	 <section class="wrapper">
	    <div class="row">
                  <div class="col-lg-12">
	
	 <div class="panel-group m-bot20" id="accordion">
	                 <div class="panel panel-warning">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle"  data-parent="#accordion" ng-click="getBranch()">
                                          Select Branch, Class and Division to show Students
                                      </a>
                                  </h4>
                              </div>
                              
                              <div id="collapseOne" class="panel-collapse collapse in">
                                  <div class="panel-body">
                                     
										<form name="SelectDivisionForm" class="form-validate form-horizontal " id="SelectDivisionToShowStudents" >
											<div class="form-group ">
											
												<label for="fullname" class="control-label col-lg-2">Select The Branch 
												 <span class="required">*</span>
												</label>
												<div class="col-lg-10">
												
												  <select class="form-control input-lg m-bot15 " ng-model="selectBranch" ng-options="branch.name for (x,branch) in branchList" ng-change="selectedBranch()" required="required"></select>
												</div>
												<label for="fullname" class="control-label col-lg-2">Select The Class 
												 <span class="required">*</span>
												</label>
												
												<div class="col-lg-10">
												  <select class="form-control input-lg m-bot15 " ng-model="selectClass" ng-options="class.name for (x,class) in classList" ng-change="selectedClass()" required="required"></select>
										     	</div>
											
						 					<label for="fullname" class="control-label col-lg-2">Select The Division 
												 <span class="required">*</span>
											</label>
												
												<div class="col-lg-10">
												  <select class="form-control input-lg m-bot15 " ng-model="selectDivision" ng-options="division.name for (x,division) in divisionList" ng-change="selectedDivision()" required="required" ></select>
												</div>
									</div>
											
											  <div ng-show="!SelectDivisionForm.$valid" class="alert alert-block alert-danger fade in">
														<button data-dismiss="alert" class="close close-sm"
															type="button">
															<i class="icon-remove"></i>
														</button>
														<strong>Select Branch, Classes and Division</strong>
											  </div>
											  
											<div class="form-group">
			                                          <div class="col-lg-offset-2 col-lg-10">
			                                              <button class="btn btn-primary" ng-click="getStudent()" id="showStudentSubmitBTN" type="submit">Show Students</button>
			                     					 </div>
			                                </div>
										</form>
										</div>
                                  </div>
                              </div>
                             </div>
                             
                             
                             <div ng-if="NoStudentInDivision" class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>Selected division does not contain any student</strong> 
                              </div>
                              
                                  
                                 <section class="panel">
                          <div class="panel-body" ng-show="ShowStudentTable">
                              <form class="form-horizontal " method="get"  > 
                                     <div class="form-group" >
                                      <label class="control-label col-lg-2" for="inputSuccess">Search Student</label>
                                      <div class="col-lg-10">
                                          <div class="row">
                                          <div class="col-lg-3">
                                              <input type="text" class="form-control" placeholder="search"  ng-model="student_filter" ng-change="filterStudent();disableSuccessMessage()">
                                          </div>
                                          <div class="col-lg-2">
                                               <button class="btn btn-danger" ng-click="deleteStudentFromDivision();disableSuccessMessage()" id="deleteStudentSubmitBTN" type="submit">Delete Students</button>
                                          </div>
                                          <div class="col-lg-2">
                                               <button class="btn btn-primary" ng-click="showModal()" id="shiftStudentSubmitBTN" type="submit"  href="myModal">Add to Other Division</button>
                                          </div>
                                          </div>
                                          <br>
                                          
                                          
                                         <!-- Modal -->
								                              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								                                  <div class="modal-dialog">
								                                      <div class="modal-content">
								                                          <div class="modal-header">
								                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								                                              <h4 class="modal-title"> Select Branch, Class and Division to show Students</h4>
								                                          </div>
								                                          <div class="modal-body">
								
								                                            
																					<form name="SelectDivisionFormModal" class="form-validate form-horizontal " id="SelectDivisionToShowStudentsModal" >
																						<div class="form-group ">
																						
																							<label for="fullname" class="control-label col-lg-2">Select The Branch 
																							 <span class="required">*</span>
																							</label>
																							<div class="col-lg-10">
																							
																							  <select class="form-control input-lg m-bot15 " ng-model="selectBranchModal" ng-options="branch.name for (x,branch) in branchList" ng-change="selectedBranchModal()" required="required"></select>
																							</div>
																							<br></br>
																							<label for="fullname" class="control-label col-lg-2">Select The Class 
																							 <span class="required">*</span>
																							</label>
																							
																							<div class="col-lg-10">
																							  <select class="form-control input-lg m-bot15 " ng-model="selectClassModal" ng-options="class.name for (x,class) in classListModal" ng-change="selectedClassModal()" required="required"></select>
																					     	</div>
																					     	
																					     	<br></br>
																						
																	 					<label for="fullname" class="control-label col-lg-2">Select The Division 
																							 <span class="required">*</span>
																						</label>
																							
																							<div class="col-lg-10">
																							  <select class="form-control input-lg m-bot15 " ng-model="selectDivisionModal" ng-options="division.name for (x,division) in divisionListModal" ng-change="selectedDivisionModal()" required="required" ></select>
																							</div>
																							<br></br>
																					</div>
																						
																						  <div ng-show="SelectErrorMessageModal" class="alert alert-block alert-danger fade in">
																									<button data-dismiss="alert" class="close close-sm"
																										type="button">
																										<i class="icon-remove"></i>
																									</button>
																									<strong>Select Branch, Classes and Division</strong>
																						  </div>
																						 
																						  
																						<div class="form-group">
														                                          <div class="col-lg-offset-2 col-lg-10">
														                                              <button  ng-disabled="SelectErrorMessageModal" class="btn btn-primary" data-dismiss="modal" ng-click="AddSelectedStudentToDivision()" id="showStudentSubmitBTN" type="submit">Add Selected Students To Division</button>
														                     					 </div>
														                                </div>
																					</form>
																				
																				
																					
								
								                                          </div>
								                                          <div class="modal-footer">
								                                              <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
								                                              
								                                          </div>
								                                      </div>
								                                  </div>
								                              </div>
                            						  <!-- modal -->
									      
									      <br>
									      
									       <div class="alert alert-block alert-danger fade in col-lg-6" ng-show="selectStudentFirstMessage">
			                                  <button data-dismiss="alert" class="close close-sm" type="button">
			                                      <i class="icon-remove"></i>
			                                  </button>
			                                <strong>No Student Selected</strong>
			                              </div>  
									      <div class="alert alert-info fade in col-lg-6" ng-show="deleteSucessStudent">
					                                  <button data-dismiss="alert" class="close close-sm" type="button">
					                                      <i class="icon-remove"></i>
					                                  </button>
					                                  <strong>Students deleted successfully</strong> 
					                              </div>
					                              
					                              
		                                          
		                                          
		                                          
							                              <div class="alert alert-info fade in" ng-show="StudentsMovedToDivsionSuccusfully">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                  <strong>Students Successfully moved to Division</strong> 
							                              </div>
							                              
							                             <!--  <div class="alert alert-block alert-danger fade in "  for="inputSuccess" ng-show="noneSelected">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                <strong>No Student Selected</strong>
							                              </div> -->
		                                         
		                                           
                                          
                                      </div> 
                                        
                                  </div>

                              </form>
                                 </div>
                                
                              <br>
                             
                               <div class="panel-body" ng-show="ShowStudentTable">
                              <table id="example" class="table  " ng-show="ShowStudentTable"  ng-hide="!studentList.length">
                            <tbody>
                          
                              <tr>
								<th ><label ng-show="ShowSelectAll">
                       <input type="checkbox" ng-model="IsAllChecked" ng-change="CheckUncheckAll();disableSuccessMessage()" /> Select All</label>
                       <label ng-show="!ShowSelectAll">
                       <input type="checkbox" ng-model="IsFilteredAllChecked" ng-change="filterCheckUncheckAll();disableSuccessMessage()" /> Select Filtered All</label>
                       </th>
								
								<th><i class="icon_profile"></i> Full Name</th>                               
                            <th><i class="icon_mail_alt"></i> Email</th>                            
                                 <th><i class="icon_mobile"></i> Mobile</th>
                               
                              </tr>
                              <tr ng-repeat="student in filteredTodos | filter : student_filter" ng-class="{selectedrow:student.Selected}"  >
								
								 
									<td><input  type="checkbox" ng-model="student.Selected" ng-change="CheckUncheckHeader();filteredCheckUncheckHeader();disableSuccessMessage()" /></td>
									<td>{{ student.fname }} {{ student.father }} {{ student.lname }}</td>
   							 		<td>{{ student.email }}</td>
   							 		<td>{{ student.contactno }}</td>
   						   
  							</tr>
                             
                                                    
                           </tbody>
</table>
              <pagination  ng-show="ShowStudentTable" ng-hide="!studentList.length"
      ng-model="currentPage"
      total-items="totallenght"
      max-size="maxSize"  
      boundary-links="true">
    </pagination> 
    
    <div class="alert alert-block alert-danger fade in" ng-show="!studentList.length">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>There are no student in This Division</strong> 
                              </div>
    </div>    
     </section>             
 	</section>
	
	</section> <!-- container section start --> <jsp:include
		page="/WEB-INF/jsp/components/defaultScript.jsp" /> </section>
	<!-- container section start -->
</body>
</html>