<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="studentCtrl">
<head>
<title>Teacher Profile</title>
<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />
<%-- <jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" /> --%>

 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
 <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 
 
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
  		var app = angular.module('myApp', []);
  		
  		
  		
   		app.controller('studentCtrl', function($scope, $http) {
   			
   			
   			$scope.branchList=JSON.parse('${branchListJSON}');
   			
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}');  				
   			console.log("teacher is "+$scope.teacher);
   			console.log("teacher id is "+$scope.teacher["id"]); 
   			$scope.studentList=[];
   			
   			$scope.divisionList=[];
   			
   			$scope.NoStudentInDivision=false;
   			$scope.ShowStudentTable=false;
   			
   		
   			
   			console.log($scope.branchList);
   		
   			
//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
   			$scope.selectedBranch=function(){ //on change of branch
   				
   				$scope.NoStudentInDivision=false; //to remove error message	
   				$scope.ShowStudentTable=false;    //do not show student table
   				
   			 for( i=$scope.divisionList.length-1; i>=0; i--) {   //to clean the division list
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
					   	        	 

					   	   			for (var i = 0; i < $scope.studentList.length; i++) {
					   	   				$scope.studentList[i].Selected=false;
					   	            };
					   	            
					   	            $scope.CheckUncheckHeader();

					   	        	 for( i=$scope.studentList.length-1; i>=0; i--) {
							   	          console.log($scope.studentList[i].fname);    	
							        		} 
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
            	
            	console.log("CheckUncheckAll :"+$scope.IsAllChecked)
            	
                for (var i = 0; i < $scope.studentList.length; i++) {
                	
                    $scope.studentList[i].Selected = $scope.IsAllChecked;
                }
                for (var i = 0; i < $scope.studentList.length; i++) {
                	console.log($scope.studentList[i].Selected)
                   
                }
            };
            
            
   			
   }); 
   		
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

<body>

	<section id="container" class="">
	       <!-- Default header --> 
	<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 
	       <!-- Default Menue -->
	<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" />
	
	<!-- <div ng-include="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp"></div> -->

	<section id="main-content">
	 <section class="wrapper">
	
	 <div class="panel-group m-bot20" id="accordion">
	                 <div class="panel panel-warning">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" ng-click="getBranch()">
                                          Select Branch, Class and Division to show Students
                                      </a>
                                  </h4>
                              </div>
                              
                              <div id="collapseOne" class="panel-collapse collapse">
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
                              
                              <table id="example" class="table  " ng-show="ShowStudentTable">
                            <tbody>
                              <tr>
								<th align="left"><label>
                       <input type="checkbox" ng-model="IsAllChecked" ng-change="CheckUncheckAll()" /> Select All</label></th>
								
								<th><i class="icon_profile"></i> Full Name</th>                               
                            <th><i class="icon_mail_alt"></i> Email</th>                            
                                 <th><i class="icon_mobile"></i> Mobile</th>
                               
                              </tr>
                              <tr ng-repeat="m in studentList" ng-class="{selectedrow:m.Selected}"  >
								
								 
									<td> <label>
                            <label for="chkCustomer_{{m.CustomerId}}">
                            <input id="chkCustomer_{{m.CustomerId}}" type="checkbox" ng-model="m.Selected" ng-change="CheckUncheckHeader()" />
                            {{m.CustomerId}}
                        </label></td>
									<td>{{ m.fname }}  {{ m.lname }}</td>
   							 		<td>{{ m.email }}</td>
   							 		<td>{{ m.contactno }}</td>
   							 		
                                
  							</tr>
                             
                                                    
                           </tbody>
</table>
                              
                              
                       
 
			</section>
	
	</section> <!-- container section start --> <jsp:include
		page="/WEB-INF/jsp/components/defaultScript.jsp" /> </section>
	<!-- container section start -->
</body>
</html>

