<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl" >
	<head>
 		<title>Add/Edit Exam</title>
   		<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
   		<%-- <jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" /> --%>
   		<%-- <jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" />  --%>
   		<style type="text/css">	
	   		.error {
	            border:2px solid red;
	        }
   		</style>
   		
   		 <script>

  		  var app = angular.module('myApp', []);
   		app.controller('teacherCtrl', function($scope, $http,$interval) {

   		
	   			$scope.teacher=JSON.parse('${teacherJSON}');
	   			$scope.permissions=JSON.parse('${permissions}');  
	   			$scope.institute=JSON.parse('${institute}');				
	   			console.log("teacher is "+$scope.teacher);
	   			console.log("teacher id is "+$scope.teacher["id"]);
	
	   			$scope.examList=[];
	   			$scope.examMode=[];
	   			$scope.examType=[];
	   			
	   			
	   			$scope.ExamCreateSuccess=false;
	   			$scope.ExamCreateError=false;
	   			$scope.ExamDeleteSuccess=false;
	   			$scope.ExamDeleteError=false;
	   			$scope.ExamUpdateSuccess=false;
	   			
	   			$scope.ExamRegularArray=[{id:0,discription:'Regular'},{id:1,discription:'Repeat'}];
	   			
	   			$scope.EditExamid=null;
	   			
//------------------------------Get the Exam List for Institute ----------------------------------------------------- 	   				
	   		 $http({
	             url: "GetExamsOFInstitute/"+$scope.institute.id,
	             method: "POST",          
	         })
	         .then(function(response) {
	                 // if success       	
	         	 console.log("WE got exams of this institute ");        	
	         	 $scope.examList=response.data;
	         	
	         	for( i=$scope.examList.length-1; i>=0; i--) {
		   	          console.log($scope.examList[i].id + $scope.examList[i].discription);    	
		        		}              
	         }, 
	         function(data) { // optional
	                 // failed
	                 
	         	 console.log(" failed to get the exam of institute");      
	         });  	

//------------------------------Get the Exam Modes -----------------------------------------------------------------------
	   		 $http({
	             url: "GetExamsMode/",
	             method: "POST",          
	         })
	         .then(function(response) {
	                 // if success       	
	         	 console.log("WE got examsModes");        	
	         	$scope.examMode=response.data;
	         	
	         	for( i=$scope.examMode.length-1; i>=0; i--) {
		   	          console.log($scope.examMode[i].id + $scope.examMode[i].modeName);    	
		        		}              
	         }, 
	         function(data) { // optional
	                 // failed
	                 
	         	 console.log(" failed to get the examMode");      
	         });

//------------------------------Get the Exam Types -----------------------------------------------------------------------
	   		$http({
	             url: "GetExamsType/",
	             method: "POST",          
	         })
	         .then(function(response) {
	                 // if success       	
	         	 console.log("WE got examType");        	
	         	$scope.examType=response.data;
	         	
	         	for( i=$scope.examType.length-1; i>=0; i--) {
		   	          console.log($scope.examType[i].id + $scope.examType[i].typeName);    	
		        		}              
	         }, 
	         function(data) { // optional
	                 // failed
	                 
	         	 console.log(" failed to get the examType");      
	         });
	   		
//------------------------------Create Exam Function-----------------------------------------------------------------------	   		
	   		$scope.CreateExam=function()
	   		{	   			
	   			$scope.ExamCreateSuccess=false;
	   			$scope.ExamCreateError=false;
	   			$scope.ExamUpdateSuccess=false;
	   			
	   			console.log("create exam");
	   			var exam={};	   			
	   			exam.examMode=$scope.selectedExamMode;
	   			exam.examType=$scope.selectedExamType;
	   			/* exam.institute=$scope.institute; */
	   			exam.discription=$scope.discription;
	   			exam.outOf=$scope.outOf;
	   			exam.passingMarks=$scope.passingMarks;
	   			exam.regular=$scope.selectedRegular.id;
	   			
	   			console.log(exam);
	   			
	   		 	 var data=JSON.stringify(exam);
	   			
	   			$http({
		             url: "SaveExam/"+$scope.institute.id,
		             contentType : 'application/json; charset=utf-8',
		   	    	 dataType : 'json', 
		             method: "POST",    
		             data :data
		         })
		         .then(function(response) {
		                 // if success       	
		         	 console.log("succcess  var data=JSON.stringify($scope.selectedstudentList);"); 
		         	
		         	$scope.examList.push(response.data); //add created exam to exam list
		         	
		         	$scope.selectedExamMode=null;
		   			$scope.selectedExamType=null;
		   			/* exam.institute=$scope.institute; */
		   			$scope.discription=null;
		   			$scope.outOf=null;
		   			$scope.passingMarks=null;
		   			$scope.selectedRegular.id=null;
		         	
		         	$scope.ExamCreateSuccess=true;            
		         	           
		         }, 
		         function(data) { // optional
		                 // failed
		                 
		         	 console.log(" failed to save the exam"); 
		         	$scope.ExamCreateError=true;
		         });
			
	   		};
	   		
//------------------------------Delete Exam Function-----------------------------------------------------------------------	   		
	   		$scope.DeleteExam=function(exam){
	   			
	   			$scope.ExamDeleteSuccess=false;
	   			$scope.ExamDeleteError=false;
	   			$scope.ExamUpdateSuccess=false;
	   			$scope.ExamCreateSuccess=false;
	   			$scope.ExamCreateError=false;
	   			
	   			console.log("delete exam function");
	   			
	   			$http({
		             url: "DeleteExam/"+exam.id,
		             contentType : 'application/json; charset=utf-8',
		   	    	 dataType : 'json', 
		             method: "POST"   
		           
		         })
		         .then(function(response) {
		                 // if success       	
		         	 console.log("succcess "); 
		                 if(response.data.message=="success")
		               	 {
		                	console.log("delettion successfull"); 	// delete exam from exam list
		                	for( i=$scope.examList.length-1; i>=0; i--) {
			  		   	         if($scope.examList[i].id ==exam.id)
			  		   	        	 {
			  		   	 			   $scope.examList.splice(i,1);
			  		   	  			  $scope.ExamDeleteSuccess=true;
			  		   	        	 }
		  		        		}
		                	
		               	 }
		                 else
		                	 {
		                	 	console.log("delettion failed"); 	
		                		 $scope.ExamDeleteError=true;
		                	 }  
		         	           
		         }, 
		         function(data) { // optional
		                 // failed
		                 
		         	 console.log(" failed to delete the exam");      
		         });
	   				   			
	   		};
//------------------------------Load Selected Exam containts in Modal Form-----------------------------------------------------------------------	   		
	   		$scope.LoadEditExam=function(exam)
	   		{	   			
	   			console.log("loading form data"+exam.id);
	   			$scope.ExamUpdateSuccess=false;
	   			$scope.ExamCreateSuccess=false;
	   			$scope.ExamCreateError=false;
	   		
	   			$scope.selectedExamModeEditExam=$scope.examMode[exam.examMode.id-1];
	   			$scope.selectedExamTypeEditExam=$scope.examType[exam.examType.id-1];	   				
	   			$scope.discriptionEditExam=exam.discription;
	   			$scope.outOfEditExam=exam.outOf;
	   			$scope.passingMarksEditExam=exam.passingMarks;
	   			$scope.selectedRegularEditExam=$scope.ExamRegularArray[exam.regular];
	   			$scope.EditExamid=exam.id;
	   			
	   			/* console.log($scope.selectedExamModeEditExam);
	   			console.log($scope.selectedExamTypeEditExam); */
	   			console.log($scope.EditExamid);	  
	   			console.log($scope.discriptionEditExam);
	   			console.log($scope.outOfEditExam);
	   			console.log($scope.passingMarksEditExam);
	   		/* 	console.log($scope.selectedRegularEditExam); */
	   			
	   			
	   		};
	   		
//------------------------------Update Exam get values from modal-----------------------------------------------------------------------	   		
	   		$scope.UpdateExam=function()
	   		{
	   			$scope.ExamUpdateSuccess=false;
	   			$scope.ExamCreateSuccess=false;
	   			$scope.ExamCreateError=false;
	   			
				console.log("Update Exam");			
				var UpdateExam={};	
	   			UpdateExam.id=	$scope.EditExamid;
	   			UpdateExam.examMode=$scope.selectedExamModeEditExam;
	   			UpdateExam.examType=$scope.selectedExamTypeEditExam;
	   			/* exam.institute=$scope.institute; */
	   			UpdateExam.discription=$scope.discriptionEditExam;
	   			UpdateExam.outOf=$scope.outOfEditExam;
	   			UpdateExam.passingMarks=$scope.passingMarksEditExam;
	   			UpdateExam.regular=$scope.selectedRegularEditExam.id;
	   			
	   			console.log(UpdateExam);
	   			
	   		 	 var data=JSON.stringify(UpdateExam);
	   			
	   			$http({
		             url: "UpdateExam/"+$scope.institute.id,
		             contentType : 'application/json; charset=utf-8',
		   	    	 dataType : 'json', 
		             method: "POST",    
		             data :data
		         })
		         .then(function(response) {
		                 // if success       	
		         	 console.log("succcess"); 
		         	 console.log(response.data); 
                 
		         	for( i=$scope.examList.length-1; i>=0; i--) {
	  		   	         if($scope.examList[i].id ==UpdateExam.id)  
	  		   	 			   $scope.examList.splice(i,1);// remove the updating exam 				  		   	   
	  		        		}
		         	$scope.examList.push(response.data);// add new modfied exam
		         	
		         	$scope.ExamUpdateSuccess=true;
     	           		         	           
		         }, 
		         function(data) { // optional
		                 // failed		                 
		         	 console.log(" failed to save the exam"); 	         	
		         });
	   			
	   			
	   		};
	   		
	   		

   					   		  			 			  			
   		});   	    
		
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


	          	            <!--tab nav start-->
                      <section class="panel">
                          <header class="panel-heading tab-bg-primary ">
                              <ul class="nav nav-tabs">
                                  <li class="active">
                                      <a data-toggle="tab" href="#home">Existing Exams</a>
                                  </li>
                                  <li class="">
                                      <a data-toggle="tab" href="#about">Create Exam</a>
                                  </li>
                                  <li class="">
                                      <a data-toggle="tab" href="#profile">Add Subjects to Exam</a>
                                  </li>
                                  <li class="">
                                      <a data-toggle="tab" href="#contact">Add Student To Exam</a>
                                  </li>
                              </ul>
                          </header>
                          <div class="panel-body">
                              <div class="tab-content">
                                  <div id="home" class="tab-pane active">
      								   <div class="row">
								                  <div class="col-lg-12">
								                      <section class="panel">
								                          <header class="panel-heading">
								                              Existing Exams
								                          </header>
								                           <div class="alert alert-info fade in" ng-show="ExamDeleteSuccess">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                  <strong>Exam Delete Successfully</strong> 
							                              </div>
							                              
							                              
							                               <div class="alert alert-block alert-danger fade in "  for="inputSuccess" ng-show="ExamDeleteError">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                <strong>Error in Deleting Exam</strong>
							                              </div>
							                              
							                              <div class="alert alert-info fade in" ng-show="ExamUpdateSuccess">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                  <strong>Exam Updated Successfully</strong> 
							                              </div>
							                              
								                          <div class="table-responsive">
								                            <table class="table">
								                              <thead>
								                                <tr>
								                                  <th>#</th>
								                                  <th>Discription</th>
								                                  <th>Max Marks</th>
								                                  <th>Passing Marks<th>
								                              	  <th>Exam Mode</th> 
								                                  <th>Exam Type</th>
								                                  <th>Repeat/Regular</th>
								                                 
								                                  <th><i class="icon_cogs"></i> Action</th>
								                                </tr>
								                              </thead>
								                              <tbody>
								                              	<tr ng-repeat="exam in examList | orderBy:'id'">
								                                  <td>{{exam.id}}</td>
								                                  <td>{{exam.discription}}</td>
								                                  <td>{{exam.outOf}}</td>
								                                  <td>{{exam.passingMarks}}</td>
								                               		<td> </td>
								                                  <td>{{examMode[exam.examMode.id -1].modeName}}</td>
								                                  <td>{{examType[exam.examType.id-1].typeName}}</td>
								                                  <td>{{ExamRegularArray[exam.regular].discription}}</td>
								                               	 	<td>	
								                               	 		 <a class="btn btn-primary"  data-toggle="modal" ng-click="LoadEditExam(exam)" href="#myModal" ><i  class="icon_plus_alt2"  ></i></a>     	
                                      									 <a class="btn btn-danger" ng-click="DeleteExam(exam)" href="#"><i   class="icon_close_alt2"></i></a>
                                      									 
                                      									  <!-- Modal -->
											                              <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											                                  <div class="modal-dialog">
											                                      <div class="modal-content">
											                                          <div class="modal-header">
											                                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											                                              <h4 class="modal-title">Edit Exam</h4>
											                                          </div>
											                                          <div class="modal-body">
											
											                                              
											                                               <form class="form-horizontal " name="EditExamForm" method="get">
																                                  <div class="form-group">
																                                      <label class="col-sm-2 control-label">Discription <span class="required">*</span></label>
																                                      <div class="col-sm-10">
																                                          <input ng-model="$parent.discriptionEditExam" type="text" class="form-control" required="required">
																                                      </div>
																                                        
																                                  </div>
																                                   <div class="form-group">
																                                      <label class="col-sm-2 control-label">Out Of<span class="required">*</span></label>
																                                      <div class="col-sm-10">
																                                          <input ng-model="$parent.outOfEditExam" type="number" class="form-control" required="required">
																                                      </div>
																                                  </div>
																                                   <div class="form-group">
																                                      <label class="col-sm-2 control-label">Passing Marks<span class="required">*</span></label>
																                                      <div class="col-sm-10">
																                                          <input ng-model="$parent.passingMarksEditExam"  ng-class="{error : passingMarksEditExam>outOfEditExam }" type="number" class="form-control" required="required">
																                                      </div>
																                                  </div>
																                                  <div class="form-group">
																	                                   <div class="form-group">
																	                                      <label class="col-sm-2 control-label">Examination Type<span class="required">*</span></label>
																	                                      <div class="col-sm-10">
																	                                          <select class="form-control m-bot15"  ng-model="$parent.selectedExamTypeEditExam" ng-options="examType.typeName for (x,examType) in examType"  required="required" required="required" required> </select>
																	                                      </div>
																	                                  </div>
																                                  </div>
																                                  
																                                  <div class="form-group">
																	                                   <div class="form-group">
																	                                      <label class="col-sm-2 control-label">Examination Mode<span class="required">*</span></label>
																	                                      <div class="col-sm-10">
																	                                          <select class="form-control m-bot15"  ng-model="$parent.selectedExamModeEditExam" ng-options="examMode.modeName for (x,examMode) in examMode"  required="required" required="required" required> </select>
																	                                      </div>
																	                                  </div>
																                                  </div>
																                                  <div class="form-group">
																	                                   <div class="form-group">
																	                                      <label class="col-sm-2 control-label">Regular/ Repeat<span class="required">*</span></label>
																	                                      <div class="col-sm-10">
																	                                          <select ng-model="$parent.selectedRegularEditExam" class="form-control m-bot15" ng-options="ExamRegularArray.discription for (x,ExamRegularArray) in ExamRegularArray"  required="required" required>                                              
																                                            </select>
																	                                      </div>
																	                                  </div>
																                                  </div>
																                                  
																                                   
																                                    <div class="form-group">
																                                      <div class="col-lg-offset-2 col-lg-10">
																                                          <button type="submit" data-dismiss="modal" class="btn btn-primary" ng-click="EditExamForm.$valid && UpdateExam()" ng-disabled="passingMarksEditExam>outOfEditExam || !EditExamForm.$valid || !EditExamForm.$dirty">Update Exam</button>
																                                      </div>
																                                  </div>
																                           
																                              </form>
											                                              
											                                              
											                                              
											                                              
											
											                                          </div>
											                                          <div class="modal-footer">
											                                              <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
											                                             <!--  <button class="btn btn-success" type="button">Save changes</button> -->
											                                          </div>
											                                      </div>
											                                  </div>
											                              </div>
											                              <!-- modal -->
                                      								</td>
								                                </tr>
								                               
								                              </tbody>
								                            </table>
								                          </div>
								                          
								
								                      </section>
								                  </div>
								              </div>
                                      
                                  </div>
                                  
                                  
                                  
                                  
                 <div id="about" class="tab-pane"><div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                             Add Exam
                          </header>
                          <div class="panel-body">
                         								 <div class="alert alert-info fade in" ng-show="ExamCreateSuccess">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                  <strong>Exam Added Successfully</strong> 
							                              </div>
							                              
							                               <div class="alert alert-block alert-danger fade in "  for="inputSuccess" ng-show="ExamCreateError">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                <strong>Error in saving Exam</strong>
							                              </div>
                              <form class="form-horizontal " name="ExamForm" method="get">
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">Discription <span class="required">*</span></label>
                                      <div class="col-sm-10">
                                          <input ng-model="discription" type="text" class="form-control" required="required">
                                      </div>
                                  </div>
                                   <div class="form-group">
                                      <label class="col-sm-2 control-label">Out Of<span class="required">*</span></label>
                                      <div class="col-sm-10">
                                          <input ng-model="outOf" type="number" class="form-control" required="required">
                                      </div>
                                  </div>
                                   <div class="form-group">
                                      <label class="col-sm-2 control-label">Passing Marks<span class="required">*</span></label>
                                      <div class="col-sm-10">
                                          <input ng-model="passingMarks"  ng-class="{error : passingMarks>outOf }" type="number" class="form-control" required="required">
                                      </div>
                                  </div>
                                  <div class="form-group">
	                                   <div class="form-group">
	                                      <label class="col-sm-2 control-label">Examination Type<span class="required">*</span></label>
	                                      <div class="col-sm-10">
	                                          <select class="form-control m-bot15"  ng-model="selectedExamType" ng-options="examType.typeName for (x,examType) in examType" ng-change="selectedBranch()" required="required" required="required" required> </select>
	                                      </div>
	                                  </div>
                                  </div>
                                  
                                  <div class="form-group">
	                                   <div class="form-group">
	                                      <label class="col-sm-2 control-label">Examination Mode<span class="required">*</span></label>
	                                      <div class="col-sm-10">
	                                          <select class="form-control m-bot15"  ng-model="selectedExamMode" ng-options="examMode.modeName for (x,examMode) in examMode" ng-change="selectedBranch()" required="required" required="required" required> </select>
	                                      </div>
	                                  </div>
                                  </div>
                                  <div class="form-group">
	                                   <div class="form-group">
	                                      <label class="col-sm-2 control-label">Regular/ Repeat<span class="required">*</span></label>
	                                      <div class="col-sm-10">
	                                          
                                             <select ng-model="selectedRegular" class="form-control m-bot15" ng-options="ExamRegularArray.discription for (x,ExamRegularArray) in ExamRegularArray"  required="required" required>                                              
											</select>
	                                      </div>
	                                  </div>
                                  </div>
                                  
                                   
                                    <div class="form-group">
                                      <div class="col-lg-offset-2 col-lg-10">
                                          <button type="submit" class="btn btn-primary" ng-click="ExamForm.$valid && CreateExam()" ng-disabled="passingMarks>outOf">Create Exam</button>
                                      </div>
                                  </div>
                           
                              </form>
                          </div>
                      </section>
                      
                  </div>
              </div></div>
                                  <div id="profile" class="tab-pane">Add Subjects to Exam</div>
                                  <div id="contact" class="tab-pane">Add Student To Exam</div>
                              </div>
                          </div>
                      </section>
                      <!--tab nav start--> 
	                       	


          </div>
          </section>
 </section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
  </body>
</html>