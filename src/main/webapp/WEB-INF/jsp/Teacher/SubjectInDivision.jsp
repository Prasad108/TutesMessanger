<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="subjectCtrl" >
	<head>
 		<title>Teacher </title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		<jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />
   		<%-- <jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />  --%>
   		
   		 <script>

        var app = angular.module('myApp',[]);
  		
   		app.controller('subjectCtrl', ['$scope', '$http', '$filter', function($scope,$http,$filter) {
   			
   			$scope.branchList=JSON.parse('${branchListJSON}');
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}');
   			
   			console.log("teacher is "+$scope.teacher);
   			console.log("teacher id is "+$scope.teacher["id"]);
   			
   		//--------initialise arrayt for different list-----	
   			$scope.subjectList=[];
   			$scope.classList=[];
   			$scope.divisionList=[];
   		
   			
   	//--------initialise variable to show/hide some division-----
   			$scope.NoSubjectInDivision=false;
   			$scope.ShowSubjectTable=false;
   	
   			console.log($scope.branchList);
   		
   			
//--------------------------------------------- For getting dynamic Classes on change branch angular js----------------------------   			
   			$scope.selectedBranch=function(){ //on change of branch
   				
   				$scope.NoSubjectInDivision=false; //to remove error message	
   				$scope.ShowSubjectTable=false;    //do not show student table
   				
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
   			};
   			
//--------------------------------------------- For getting dynamic division on change class angular js----------------------------   			
			$scope.selectedClass=function(){
	
				$scope.NoSubjectInDivision=false; //to remove error message	
				$scope.ShowSubjectTable=false;    //do not show student table
   				
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


   		
 

//--------------------------------------------- To get Subject list on click button ----------------------------   			
   			$scope.getSubject=function(){
   				$scope.NoSubjectInDivision=false; //to remove error message	
   				$scope.ShowSubjectTable=false;    //do not show student table
   				
	   			if (!($scope.selectDivision === undefined || $scope.selectDivision === null))	
	   			{
			   			 var data = JSON.stringify({id:$scope.selectDivision.id,name:$scope.selectDivision.name});
			   			 	
			   		//*********to get the subject list of selected division ******
				   			 $http({
				   	            url: "GetSubjectOfDivisionInJSON",
				   	         	contentType : 'application/json; charset=utf-8',
				   	    	 	dataType : 'json',
				   	            method: "POST" ,        
				   	            data: data
				   	               
				   	        })
				   	        .then(function successCallback(response) {
				   	                // if success   then generate subject table
					   	                
					   	                console.log("response came"); 
					   	         	if(response.data.ErrorMessage)
					   	         		{
					   	         		 console.log("there is error or no subject in division");
					   	         		 $scope.NoSubjectInDivision=true;      //to add error message	
					   	         		 $scope.ShowSubjectTable=false;    //do not show student table
					   	         		}
					   	         	else{
					   	         	console.log("succesess subjects are there");
					   	             $scope.ShowSubjectTable=true;    //show student table
					   	        	 $scope.subjectList=response.data;	
					   	        	 
					   	             console.log($scope.subjectList);
					   	   			
					   	        	 for( i=$scope.subjectList.length-1; i>=0; i--) {
							   	          console.log($scope.subjectList[i].name);    	
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


   		//-------------delete subject from division function-------------------
		    $scope.deleteSubject=function(subject)
		    { 

		      console.log("hello from delete subject from division function console");

		      if (!($scope.selectDivision === undefined || $scope.selectDivision === null))	
	   			{
		        $http({
		            url: "deleteSubjectFromDivision/"+subject.id+"/"+$scope.selectDivision.id,
		            method: "GET",          
		        })
		        .then(function successCallback(response) {

		        
		        	 console.log(" Subject is deleted : "+subject.id);
		        	 console.log("Subject is deleted and response recieved is :"+response.data.message);

		        	if(response.data.status=="success"){
		                // if success       	
		        	

		 			
		        	 $scope.deletemessage=response.data.message;
		        	//delete the role from array
		        	 for( i=$scope.subjectList.length-1; i>=0; i--) {
		        		    if( $scope.subjectList[i].id ==subject.id) $scope.subjectList.splice(i,1);
		        		}  
		        	}            
		        }, 
		      function errorCallback(response) {
		                // failed
		                 $scope.message=data.message;
		        	 console.log(" subject deletion failed and response is "+data.message);      
		        });

	   			}
		      else
 				{
 						console.log("division not selected");
 				}

		    };
		
   		}]);
   			
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
                                     
										<form name="SelectDivisionForm" class="form-validate form-horizontal " id="SelectDivisionToShowSubjects" >
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
			                                              <button class="btn btn-primary" ng-click="getSubject()" id="showSubjectSubmitBTN" type="submit">Show Subjects</button>
			                     					 </div>
			                                </div>
										</form>
										</div>
                                  </div>
                              </div>
                             </div>  
                             
                             
                             <div ng-show="NoSubjectInDivision" class="alert alert-block alert-danger fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>Selected division does not contain any subject</strong> 
                              </div>
                             
                             
                         <section class="panel">
                       <div class="panel-body" ng-show="ShowSubjectTable">
                         <table id="example" class="table  " ng-show="ShowSubjectTable"  ng-hide="!subjectList.length">
                           <tbody>
                             <tr>
							   <th><i class=""></i>Subject Name</th>                               
                               <th>Subject Description</th>                            
                               <th><i class="icon_cogs"></i>Delete Action</th>
                             </tr>
                             <tr ng-repeat="subject in subjectList" ng-class="{selectedrow:subject.Selected}">
									<td> {{ subject.name }}</td>
   							 		<td> {{ subject.discription }}</td>
   							 		<td>
                                      <a class="btn btn-danger" ng-click="deleteSubject(subject)" style="margin-left: 10%"><i class="icon_close_alt2"></i></a>
                                    </td>
   							 </tr>
                          </tbody>
</table>
       
        <div class="alert alert-block alert-danger fade in" ng-show="!subjectList.length">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>There are no subject in This Division</strong> 
       </div>
   </div> 
  </section>             	
 </div>
 </div>
</section>
</section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>