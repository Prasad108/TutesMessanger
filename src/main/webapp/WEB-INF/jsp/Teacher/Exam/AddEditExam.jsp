<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp" ng-controller="teacherCtrl" >
  <head>
 	<title>Add/Edit Exam</title>
 	<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 
  	<link href="<c:url value="/css/ivh-treeview.css" />" rel="stylesheet">
   	<link href="<c:url value="/css/ivh-treeview.min.css" />" rel="stylesheet">
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pikaday.css">
   	
   	<script src="<c:url value="/js/ivh_treeViewscript.js" />"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/pikaday.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script data-require="ui-bootstrap@*" data-semver="0.12.1" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.min.js"></script>
    
    <style type="text/css">	
	  .error {
	          border:2px solid red;
	         }
	        
	  #subStrong 
	         { 
	          display:inline-block;color:maroon;
	         }
	  
   </style>
   		
   <script>
        var app = angular.module('myApp', ['ivh.treeview','ui.bootstrap']);

		app.config(function(ivhTreeviewOptionsProvider) {
  			 ivhTreeviewOptionsProvider.set({
  			   defaultSelectedState: false,
  			   validate: true,
  			   // Twisties can be images, custom html, or plain text
  			   twistieCollapsedTpl: ' <span class="menu-arrow arrow_carrot-right"></span>',
  			   twistieExpandedTpl: ' <span class="menu-arrow arrow_carrot-down"></span>',
  			   twistieLeafTpl: ' <i class="icon_document_alt"></i>'
  			 });
  			});
  		
  	    app.controller('teacherCtrl', function($scope, $http,$interval,$filter) {
   			    $scope.teacher=JSON.parse('${teacherJSON}');
	   			$scope.permissions=JSON.parse('${permissions}');  
	   			$scope.institute=JSON.parse('${institute}');	
	   			
	   			$scope.ExamCreateSuccess=false;
	   			$scope.ExamCreateError=false;
	   			$scope.ExamDeleteSuccess=false;
	   			$scope.ExamDeleteError=false;
	   			$scope.ExamUpdateSuccess=false;
	   			
	   			$scope.EditExamid=null;
	   			
	   			$scope.ShowTreeStruct=false;
	   			$scope.ShowSubjectListVar=false;
	   			$scope.ShowAddSubjectTable=false;
	   		    $scope.ShowSelectedSubjectTable=false;
	   		    $scope.noneSelected=false;
	   		   // $scope.ShowSelectAll=true;
	   		   
				$scope.ExamRegularArray=[{id:0,discription:'Regular'},{id:1,discription:'Repeat'}];

				$scope.studentNotInExamList=[];
				$scope.studentInExamList=[];
			    $scope.filteredTodos = [],
			    $scope.filteredTodos1 = [],
			    $scope.currentPage = 1,
			    $scope.numPerPage = 10,
			    $scope.maxSize = 3,

		        $scope.totallenght=$scope.studentNotInExamList.length/$scope.numPerPage*10;
			    
	   			$scope.examList=[];
	   			$scope.examMode=[];
	   			$scope.examType=[];
	   			$scope.selectedSubject=[];
                $scope.selectedstudentList=[];
	   			//this.inst=[{"label":"Vidya", "value":50,"type":"Institute","children": [{"label":"Pune", "value":15,"type":"Branch","children":[{"label":"10th ", "value":18,"type":"Class","children":[{"label":"A", "value":19,"type":"Division"},{"label":"B", "value":20,"type":"Division"},{"label":"C", "value":21,"type":"Division"}]},{"label":"11th", "value":19,"type":"Class","children":[{"label":"PCM", "value":22,"type":"Division","children":[{"label":"English", "value":1,"type":"Subject","SubjectId":1},{"label":"Marathi", "value":2,"type":"Subject","SubjectId":2}]},{"label":"PCB", "value":23,"type":"Division","children":[{"label":"English", "value":3,"type":"Subject","SubjectId":1}]}]}]},{"label":"Mumbai", "value":16,"type":"Branch"}]}];

	   			/* var o = [{"label":"Vidya", "value":50,"type":"Institute","children": [{"label":"Pune", "value":15,"type":"Branch","children":[{"label":"10th ", "value":18,"type":"Class","children":[{"label":"A", "value":19,"type":"Division"},{"label":"B", "value":20,"type":"Division"},{"label":"C", "value":21,"type":"Division"}]},{"label":"11th", "value":19,"type":"Class","children":[{"label":"PCM", "value":22,"type":"Division","children":[{"label":"English", "value":1,"type":"Subject","SubjectId":1},{"label":"Marathi", "value":2,"type":"Subject","SubjectId":2}]},{"label":"PCB", "value":23,"type":"Division","children":[{"label":"English", "value":3,"type":"Subject","SubjectId":1}]}]}]},{"label":"Mumbai", "value":16,"type":"Branch"}]}];

	   				//called with every property and its value
	   				function process(key,value) {
	   				    console.log(key + " : "+value);
	   				}
	   				
	   				function traverse(o,func) {
	   				    for (var i in o) {
	   				    	
	   				        func.apply(this,[i,o[i]]);
	   				        
	   				        if (o[i] !== null && typeof(o[i])=="object") {
	   				        	/* if(o[i].type=="Subject" )
	   				        		{
	   				        		$scope.selectedSubject.push(o[i]);
	   				        		} 
	   				            //going one step down in the object tree!!
	   				            traverse(o[i],func);
	   				        }
	   				    }
	   				} 

	   				//that's all... no magic, no bloated framework
	   				traverse(o,process);
	   				
	   				*/
//------------------------------Tree Traverlsal and Add the selected Items in respective array ----------------------------------------------------- 		   				
	   				$scope.TreeTraversalForSelectedItems=function (o) {
	   				    for (var i in o) {
	        
	   				        if (o[i] !== null && typeof(o[i])=="object") {
	   				        	
	   				        	if(o[i].type=="Institute" && o[i].selected==true)
   				        		{
   				        			//console.log("Selected Institute is "+o[i].label);
   				        			$scope.selectedInstitute.push(o[i]);
   				        		}
	   				        	
	   				        	if(o[i].type=="Branch" && o[i].selected==true)
   				        		{
   				        			//console.log("Selected Branch is "+o[i].label);
   				        			$scope.selectedBranch.push(o[i]);
   				        		}
	   				        	
	   				        	if(o[i].type=="Class" && o[i].selected==true)
   				        		{
   				        			//console.log("Selected Class is "+o[i].label);
   				        			$scope.selectedClass.push(o[i]);
   				        		}
	   				        	
	   				        	if(o[i].type=="Division" && o[i].selected==true)
   				        		{
   				        			//console.log("Selected Division is "+o[i].label);
   				        			$scope.selectedDivision.push(o[i]);
   				        		}
	   				        	
	   				        	
	   				        	if(o[i].type=="Subject" && o[i].selected==true)
	   				        		{
	   				        			//console.log("Selected subject is "+o[i].label);
	   				        			$scope.selectedSubject.push(o[i]);
	   				        		}
	   				            //going one step down in the object tree!!
	   				            $scope.TreeTraversalForSelectedItems(o[i]);
	   				        }
	   				    }
	   				}
	   		 	

	   		  this.awesomeCallback = function(node, tree) {
	   		    // Do something with node or tree
	   			console.log("#");
	   		  };
//------------------------------Callback Function on select of any tree node -----------------------------------------------------
	   		$scope.OnSelectCallback = function(node, isSelected, tree) {
	   			
	
				// initially make all the arrays empty
	   			$scope.selectedInstitute=[];
	   			$scope.selectedBranch=[];
	   			$scope.selectedClass=[];
	   			$scope.selectedDivision=[];
	   			$scope.selectedSubject=[];

	   	      $scope.SubjectDivCompIDList=[];
	   			
	   			// call tree traversal function to get the selected itmes in arrays
	   			$scope.TreeTraversalForSelectedItems(tree);   
	   		
	   			console.log("Total Institute Selected are  "+$scope.selectedInstitute.length);
	   			console.log("Total Branch Selected are  "+$scope.selectedBranch.length);
	   			console.log("Total Class Selected are  "+$scope.selectedClass.length);
	   			console.log("Total Division Selected are  "+$scope.selectedDivision.length);
	   			console.log("Total Subjects Selected are  "+$scope.selectedSubject.length);
	   			console.log($scope.selectedSubject);
	   			console.log("*************************************************************************");
	   		
  
	   		  }
	   					
//------------------------------Get the Exam List for Institute ----------------------------------------------------- 	   				
	   		 $http({
	             url: "GetExamsOFInstitute/"+$scope.institute.id,
	             method: "POST",          
	         })
	         .then(function(response) {
	                 // if success       	
	         	 console.log("WE got exams of this institute ");        	
	         	 $scope.examList=response.data;
	         	
	         	/* for( i=$scope.examList.length-1; i>=0; i--) {
		   	          console.log($scope.examList[i].id + $scope.examList[i].discription);    	
		        		}      */         
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
	         	
	         	/* for( i=$scope.examMode.length-1; i>=0; i--) {
		   	          console.log($scope.examMode[i].id + $scope.examMode[i].modeName);    	
		        		}       */        
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
	         	
	         	/* for( i=$scope.examType.length-1; i>=0; i--) {
		   	          console.log($scope.examType[i].id + $scope.examType[i].typeName);    	
		        		}    */           
	         }, 
	         function(data) { // optional
	                 // failed
	                 
	         	 console.log(" failed to get the examType");      
	         });
	         
	   	//------------------------------Get Subject Tree Struct -----------------------------------------------------------------------	         
	         console.log($scope.institute.id);
	         
	   		$http({
	             url: "GetSubjectTreeStruct/"+$scope.institute.id,
	             method: "POST",          
	         })
	         .then(function(response) {
	                 // if success       	
	         	 console.log("WE got SubjectTreeStruct");
	                 console.log(response.data);
	                 $scope.InstTreeStructureWithSubject=response.data;
	         	          
	         }, 
	         function(data) { // optional
	                 // failed
	                 
	         	 console.log(" failed to get the SubjectTreeStruct");      
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
	   		
	   		$scope.ShowTree=function()
	   		{
	   			
	   			$scope.ShowTreeStruct=true;
	   			$scope.ShowSubjectListVar=false;
	   			$scope.ShowAddSubjectTable=false;
	   		};
	   		
	   		$scope.ShowSubjectList=function(){
	   			
	   			
	   			$scope.ShowTreeStruct=false;
	   			$scope.ShowSubjectListVar=true;
	   			$scope.ShowAddSubjectTable=false;
	   			
	   		};
	   		
	   		
	   		
	   		var o = [{"label":"Vidya", "value":50,"type":"Institute","children": [{"label":"Pune", "value":15,"type":"Branch","children":[{"label":"10th ", "value":18,"type":"Class","children":[{"label":"A", "value":19,"type":"Division"},{"label":"B", "value":20,"type":"Division"},{"label":"C", "value":21,"type":"Division"}]},{"label":"11th", "value":19,"type":"Class","children":[{"label":"PCM", "value":22,"type":"Division","children":[{"label":"English", "value":1,"type":"Subject","SubjectId":1},{"label":"Marathi", "value":2,"type":"Subject","SubjectId":2}]},{"label":"PCB", "value":23,"type":"Division","children":[{"label":"English", "value":6,"type":"Subject","SubjectId":1}]}]}]},{"label":"Mumbai", "value":16,"type":"Branch"}]}];

				//called with every property and its value
				
			
			$scope.inst={};
			$scope.branch={};
			$scope.classes={};
			$scope.div={};
			$scope.subject={};
			
			$scope.flag=0;
				
			function traverseTillsubDivId(o,subDivId) {
	
					if($scope.flag < 1)
					{ 
                     for (var i in o)
                      {
						if($scope.flag < 1)
						  {
						    if (o[i] !== null && typeof(o[i])=="object") 
							  {
							   if(o[i].type=="Institute")
					        	{
					        	 $scope.inst.label=o[i].label;
								 console.log($scope.inst.label);
					        	}
						        	
						       if(o[i].type=="Branch")
					        	{
					        	 $scope.branch.label=o[i].label;
								 console.log($scope.branch.label);
					        	}
						        	
						       if(o[i].type=="Class")
					        	{
					        	 $scope.classes.label=o[i].label;
								 console.log($scope.classes.label);
					        	}
						        	
						       if(o[i].type=="Division")
					        	{
					        	 $scope.div.label=o[i].label;
					        	 $scope.div.value=o[i].value;
								 console.log($scope.div.label);
								 console.log($scope.div.value);
		                        }
						        	
						       if(o[i].type=="Subject" && o[i].value==subDivId)
						        {
						         $scope.subject.label=o[i].label;
								 console.log($scope.subject.label);
								 $scope.flag=2;
								 console.log("break **************************");
								 break;
						        }
						        	 
						         //going one step down in the object tree!!
						         traverseTillsubDivId(o[i],subDivId);
							  }
						  }
					  }
					}
                };
				
				$scope.ShowSubjectTable=function()
				{
					$scope.ShowTreeStruct=false;
		   			$scope.ShowSubjectListVar=false;
		   			$scope.ShowAddSubjectTable=true;
	            };

//------------------------------------To show selected subject for exam----------------------------------------------------
				$scope.ShowSelectedSubject=function()
				{
					console.log($scope.selectedExamForAddStudent.id);

		//*************************http post request to get subDiv composit id of selected exam***************** 
					$http({
			             url: "GetSubjectDivCompID/"+$scope.selectedExamForAddStudent.id,
			             method: "POST",          
			         })
			         .then(function(response) { // if success       	
			         	 console.log("WE got ids");
			         	 
			                 $scope.SubjectDivCompIDList=response.data;
			                 $scope.ShowSelectedSubjectTable=true;
			                 $scope.subjectNotInExam=false;  	
                          
			                 for(var j=0;j< $scope.SubjectDivCompIDList.length; j++)
	        				 {
			                	$scope.flag=0;
			                	$scope.inst={};
			         			$scope.branch={};
			         			$scope.classes={};
			         			$scope.div={};
			         			$scope.subject={};
			         			
			         			$scope.flag=0;

			                	 
			                     traverseTillsubDivId( $scope.InstTreeStructureWithSubject, $scope.SubjectDivCompIDList[j].id);
			                   
			                     if( $scope.flag>0)
			                   		{
				                    	 $scope.SubjectDivCompIDList[j].inst=$scope.inst;
				                    	 $scope.SubjectDivCompIDList[j].branch=$scope.branch;
				                    	 $scope.SubjectDivCompIDList[j].classes=$scope.classes;
				                    	 $scope.SubjectDivCompIDList[j].div=$scope.div;	
				                    	 $scope.SubjectDivCompIDList[j].subject=$scope.subject;	
				                    }
			                     console.log( $scope.SubjectDivCompIDList[j]);
	        				 }
		             }, 
			         function(data) { // optional // if failed
			            $scope.subjectNotInExam=true; 
			            $scope.ShowSelectedSubjectTable=false;    
			         	 console.log(" failed to get the ids");      
			         });
				};
				
				  
	             $scope.datepickerActivate=function()
				 {
					 $('.datepicker').pikaday({ firstDay: 1 });
				 };
				 
				 $scope.AddSubjectToExam=function(){
					 
					 $scope.ExamSubjectList=[];
					 console.log($scope.selectedSubject);
					 
					  for(var i=0;i<$scope.selectedSubject.length;i++){
						  var ExamSubject={};
						  ExamSubject.exam={};
						  ExamSubject.subjectDivComposit={};
						 
						 ExamSubject.exam.id=$scope.selectedExamForAddSubject.id;
						 ExamSubject.subjectDivComposit.id=$scope.selectedSubject[i].value;
						 ExamSubject.dateTime=new Date($scope.selectedSubject[i].ExamDate);
						 ExamSubject.durationInMinutes= $scope.selectedSubject[i].DurationInMinutes;
						 ExamSubject.outOfMarks=$scope.selectedSubject[i].OutOF;
						 ExamSubject.passingMarks=$scope.selectedSubject[i].PassingMarks;
						 $scope.ExamSubjectList.push(ExamSubject);
						 
					 } 
					  
					  console.log($scope.ExamSubjectList);
					  
					  var data=JSON.stringify($scope.ExamSubjectList);
					  
					  $http({
				             url: "AddSubjectToExam",
				             contentType : 'application/json; charset=utf-8',
				   	    	 dataType : 'json', 
				             method: "POST",    
				             data :data
				         })
				         .then(function(response) {
				                 // if success       	
				         	 console.log("succcess"); 
				                 var resp=response.data;
				                 
				                 if(resp.message="success")
				                	 {// subjecte added to exam 
				                	 $scope.SubjectAddedSuccess=true;
				                	 $scope.SubjectAddedFailed=false;
				                	 
				                	 }
				                 else
				                	 {// failed to add subject to exam
				                	 $scope.SubjectAddedFailed=true;
				                	 $scope.SubjectAddedSuccess=false;
				                	 }
		                 }, 
				         function(data) { // optional
				                 // failed		                 
				         	 console.log(" failed to AddSubjectToExam the exam"); 	         	
				         });
			 };
				 
//-------------------------------to check wheather all subjects have passing marks less than OutOf marks-------------				 
				 $scope.ValidateOutOFandPassing=function(){
					 
					 var result=true;
					 for(var i=0;i<$scope.selectedSubject.length;i++){
						 
						 if($scope.selectedSubject[i].OutOF < $scope.selectedSubject[i].PassingMarks)
							 {
							 result=false;
							 break;
							 }
					 }
					 return result;
				 };
				 
				
		
//------------------------------on change function after changing exam in dropdown select-----------------------		   		  			 			  			
				$scope.selectExam=function(){
					 $scope.subjectNotInExam=false; 
					 $scope.ShowSelectedSubjectTable=false;
					
					};

//---------------------------To show students not added in exam of perticular subject------------------------
			$scope.OpenAdd=function(sub,SubjectDivCompIDList){
				 $scope.selectStudentFirstMessage=false;
				 $scope.ShowSelectAll=true;
				 sub.student_filter="";
				for(var i=0; i<SubjectDivCompIDList.length;i++)
				{

				if(SubjectDivCompIDList[i].id==sub.id)
					{
										
						$("#add"+sub.id).collapse('show');
						$("#show"+sub.id).collapse('hide');
										
						}else{
										
						$("#add"+SubjectDivCompIDList[i].id).collapse('hide');
						$("#show"+SubjectDivCompIDList[i].id).collapse('hide');
						}
					}

				    console.log(sub.div.value);
		            console.log(sub.id);

		       //********************* http post request to get student not added in exam ************************
		             $http({
					     url: "GetStudentListNotInExamJSON/"+sub.id+"/"+sub.div.value+"/"+$scope.selectedExamForAddStudent.id,
					     contentType : 'application/json; charset=utf-8',
					   	 dataType : 'json',
					   	 method: "POST" ,               
					   	  }).then(function successCallback(response) {
					   	          // if success   then generate student table
						   	                
						   	      console.log("response came"); 
						   	      if(response.data.ErrorMessage)
						   	       {
						   	          console.log("there is error no students");

						   	          $scope.studentNotInExamList.splice(0,$scope.studentNotInExamList.length);
						   	          $scope.filteredTodos=$scope.studentNotInExamList;
						   	          //$scope.ShowStudentNotInExam=false;    //do not show student table
						   	         // $scope.NoStudentInDivision=true;
						   	        }
						   	        else{
						   	         console.log("succesess students are there");
						   	         // $scope.ShowStudentNotInExam=true; //show student table
						   	         //$scope.studentNotInExamList.splice(0,$scope.studentNotInExamList.length);
					   	             //$scope.filteredTodos.splice(0,$scope.filteredTodos.length);
						   	           
						   	            $scope.NoStudentInDivision=false;   
						   	            $scope.studentNotInExamList=response.data;	
 	
						   	             console.log($scope.studentNotInExamList);

						   	          for (var i = 0; i < $scope.studentNotInExamList.length; i++) {
						   	   				$scope.studentNotInExamList[i].Selected=false;
						   	            };
						   	            
						   	     	$scope.totallenght=$scope.studentNotInExamList.length/$scope.numPerPage*10;
						   	    
						   	             $scope.CheckUncheckHeader(sub);
						   	        	 for( i=$scope.studentNotInExamList.length-1; i>=0; i--) {
								   	          console.log($scope.studentNotInExamList[i].fname);    	
								        		} 
						   	        	 console.log("current page: "+$scope.currentPage);
						   	        	 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
						        		    , end = begin + $scope.numPerPage;
						        		    console.log("begin is "+begin+" end is "+end)
						        		    $scope.filteredTodos = $scope.studentNotInExamList.slice(begin, end);
						   	        	} 
					   	        }, 
					   	    		 function errorCallback(response) {
					   	                // failed
					   	                console.log("error response came");    	          
					   	        }); 

			};	

//---------------------------To show students added in exam for perticular subject------------------------	
						$scope.OpenShow=function(sub,SubjectDivCompIDList){		
							 console.log(sub.id);
							 $scope.selectStudentFirstMessage=false;
							 $scope.ShowSelectAll1=true;
							 sub.student_filter1="";			
							for(var i=0; i<SubjectDivCompIDList.length;i++)
							{
								console.log("in for loop : "+SubjectDivCompIDList[i].id);
								
								if(SubjectDivCompIDList[i].id==sub.id)
								{
									console.log("in if condition");
									console.log($("#add"+sub.id));
									$("#add"+sub.id).collapse('hide');
									$("#show"+sub.id).collapse('show');
									
								}else{

									console.log("in else condition");
									console.log($("#add"+SubjectDivCompIDList[i].id));
									$("#add"+SubjectDivCompIDList[i].id).collapse('hide');
									$("#show"+SubjectDivCompIDList[i].id).collapse('hide');
								}
							}

     //****************************** http post request to get student added in exam ************************
							   $http({
					   	            url: "GetStudentListOfExamJSON/"+sub.id+"/"+sub.div.value+"/"+$scope.selectedExamForAddStudent.id,
					   	         	contentType : 'application/json; charset=utf-8',
					   	    	 	dataType : 'json',
					   	            method: "POST" ,               
					   	        })
					   	        .then(function successCallback(response) {
					   	                // if success   then generate student table
						   	                
						   	             console.log("response came"); 
						   	         	if(response.data.ErrorMessage)
						   	         		{
						   	         		 console.log("there is error no students");

						   	         		$scope.studentInExamList.splice(0,$scope.studentInExamList.length);
						   	         	    $scope.filteredTodos1=$scope.studentInExamList;
						   	         		 //$scope.ShowStudentNotInExam=false;    //do not show student table
						   	         		// $scope.NoStudentInDivision=true;
						   	         		}
						   	         	else{
						   	         	console.log("succesess students are there");
						   	            // $scope.ShowStudentNotInExam=true; //show student table
						   	            //$scope.studentNotInExamList.splice(0,$scope.studentNotInExamList.length);
					   	         		//$scope.filteredTodos.splice(0,$scope.filteredTodos.length);
						   	           
						   	            //$scope.NoStudentInDivision=false;   
						   	            $scope.studentInExamList=response.data;	
	
						   	             console.log($scope.studentInExamList);

						   	          for (var i = 0; i < $scope.studentInExamList.length; i++) {
						   	   				$scope.studentInExamList[i].Selected=false;
						   	            };
						   	            
						   	     	$scope.totallenght=$scope.studentInExamList.length/$scope.numPerPage*10;
						   	    
						   	            $scope.CheckUncheckHeader1(sub);
						   	        	 for( i=$scope.studentInExamList.length-1; i>=0; i--) {
								   	          console.log($scope.studentInExamList[i].fname);    	
								        		} 
						   	        	 console.log("current page: "+$scope.currentPage);
						   	        	 var begin = (($scope.currentPage - 1) * $scope.numPerPage)
						        		    , end = begin + $scope.numPerPage;
						        		    console.log("begin is "+begin+" end is "+end)
						        		    $scope.filteredTodos1 = $scope.studentInExamList.slice(begin, end);
						   	        	} 
					   	        }, 
					   	    		 function errorCallback(response) {
					   	                // failed
					   	                console.log("error response came");    	          
					   	        }); 
							
						};

	//------------------------check uncheck function on chekbox at table header for add student------------------------
						$scope.CheckUncheckHeader = function (sub) {
			   			    sub.IsAllChecked = true;
			                
			                for (var i = 0; i < $scope.studentNotInExamList.length; i++) {
				                console.log($scope.studentNotInExamList[i].Selected);
			                    if (!$scope.studentNotInExamList[i].Selected) {
			                        sub.IsAllChecked = false;
			                        break;
			                    }
			                };
			            };

    //------------------------check uncheck function on chekbox at table header for show student------------------------
                        $scope.CheckUncheckHeader1 = function (sub) {
			   			    sub.IsAllChecked1 = true;
			                
			                for (var i = 0; i < $scope.studentInExamList.length; i++) {
				                console.log($scope.studentInExamList[i].Selected1);
			                    if (!$scope.studentInExamList[i].Selected1) {
			                        sub.IsAllChecked1 = false;
			                        break;
			                    }
			                };
			            };

			           // $scope.CheckUncheckHeader();
    //------------------------check uncheck all function on chekbox in table for add student------------------------
						 $scope.CheckUncheckAll = function (sub) {
				            	$scope.selectStudentFirstMessage=false;
				                //$scope.deleteSucessStudent=false;
				               
				            	console.log("CheckUncheckAll :"+sub.IsAllChecked)
				            	
				                for (var i = 0; i < $scope.studentNotInExamList.length; i++) {
				                	 $scope.studentNotInExamList[i].Selected = sub.IsAllChecked;
				                }
				                
				                for (var i = 0; i < $scope.studentNotInExamList.length; i++) {
				                	console.log($scope.studentNotInExamList[i].Selected);  
				                }
				            };

    //------------------------check uncheck all function on chekbox in table for show student------------------------
				            $scope.CheckUncheckAll1 = function (sub) {
				            	$scope.selectStudentFirstMessage=false;
				                //$scope.deleteSucessStudent=false;
				               
				            	console.log("CheckUncheckAll :"+sub.IsAllChecked1)
				            	
				                for (var i = 0; i < $scope.studentInExamList.length; i++) {
				                	$scope.studentInExamList[i].Selected1 = sub.IsAllChecked1;
				                }
				                for (var i = 0; i < $scope.studentInExamList.length; i++) {
				                	console.log($scope.studentInExamList[i].Selected1);
				                }
				            };

    //---------------------------watch function for add student table------------------------------------------
				           	$scope.$watch('currentPage + numPerPage', function() {
				           		console.log("current page: "+$scope.currentPage);
         	          		    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
         	          		    , end = begin + $scope.numPerPage;
         	          		    console.log("begin is "+begin+" end is "+end);
         	          		    $scope.filteredTodos = $scope.studentNotInExamList.slice(begin, end);
         	          		  });

    //---------------------------watch function for show student table------------------------------------------
				         	$scope.$watch('currentPage + numPerPage', function() {
				           		console.log("current page: "+$scope.currentPage);
         	          		    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
         	          		    , end = begin + $scope.numPerPage;
         	          		    console.log("begin is "+begin+" end is "+end);
         	          		    $scope.filteredTodos1 = $scope.studentInExamList.slice(begin, end);
         	          		  });

    //----------------------------filter student on add student table to add in exam--------------------------------------------
				            $scope.filterStudent=function(sub)
				        	{
                             if((sub.student_filter.length) > 0 )
				        	  {
				        		$scope.ShowSelectAll=false;
				        		var searchFilter=sub.student_filter;
				        		console.log(searchFilter);
				        			 
				        		$scope.filteredTodos= $filter('filter')($scope.studentNotInExamList,searchFilter);
				        		console.log($scope.filteredTodos.length);
				        			 
				        		$scope.totallenght=$scope.filteredTodos.length/$scope.numPerPage*10;
				        			 	
				        		$scope.filteredCheckUncheckHeader(sub);
				        	  }
				        	 else
				        	  {
				        	   $scope.totallenght=$scope.studentNotInExamList.length/$scope.numPerPage*10;
				        	   $scope.ShowSelectAll=true;
				        			 
				        	   var begin = (($scope.currentPage - 1) * $scope.numPerPage),
				        	       end = begin + $scope.numPerPage;
					        	   console.log("begin is "+begin+" end is "+end);
					        	   $scope.filteredTodos = $scope.studentNotInExamList.slice(begin, end);
				        	  }
				        	};

	  //----------------------------filter student on show student table delete from exam--------------------------------------------
				        	 $scope.filterStudent1=function(sub)
					        	{
                                 if((sub.student_filter1.length) > 0 )
					        	  {
					        	   $scope.ShowSelectAll1=false;
					        	   var searchFilter=sub.student_filter1;
					        	   console.log(searchFilter);
					        			 
					        	   $scope.filteredTodos1= $filter('filter')($scope.studentInExamList,searchFilter);
					        	   console.log($scope.filteredTodos1.length);
					        			 
					        	   $scope.totallenght=$scope.filteredTodos1.length/$scope.numPerPage*10;
					        			 	
					        	   $scope.filteredCheckUncheckHeader1(sub);
					        	  }
					        	 else
					        	  {
					        	   $scope.totallenght=$scope.studentInExamList.length/$scope.numPerPage*10;
					        	   $scope.ShowSelectAll1=true;
					        			 
					        	   var begin = (($scope.currentPage - 1) * $scope.numPerPage),
					        	       end = begin + $scope.numPerPage;
						        	   console.log("begin is "+begin+" end is "+end)
						        	   $scope.filteredTodos1 = $scope.studentInExamList.slice(begin, end);
					        	  }
					        	};

		//-----------------------------	check uncheck all function on chekbox on filtered table for add student-----------------				        	
				        	$scope.filterCheckUncheckAll=function(sub)
				        	{
				        		$scope.selectStudentFirstMessage=false;
				        		//$scope.deleteSucessStudent=false;
				        		
				        		 for (var i = 0; i < $scope.filteredTodos.length; i++) {
				                     			 
				        			 $scope.filteredTodos[i].Selected = sub.IsFilteredAllChecked;
				        			 
				        			 for(var j=0;j< $scope.studentNotInExamList.length; j++)
				        				 {
				        				 if( $scope.filteredTodos[i] == $scope.studentNotInExamList[j] )
				        					 {  
				        					 $scope.studentNotInExamList[j].Selected = sub.IsFilteredAllChecked;
				        					 break;
				        					 }
				        				 }
				                 }
				        	};

		//-----------------------------	check uncheck all function on chekbox on filtered table for show student-----------------				        	
				        	$scope.filterCheckUncheckAll1=function(sub)
				        	{
				        		$scope.selectStudentFirstMessage=false;
				        		//$scope.deleteSucessStudent=false;
				        		
				        		 for (var i = 0; i < $scope.filteredTodos1.length; i++) {
				                     			 
				        			 $scope.filteredTodos1[i].Selected1 = sub.IsFilteredAllChecked1;
				        			 
				        			 for(var j=0;j< $scope.studentInExamList.length; j++)
				        				 {
				        				 if( $scope.filteredTodos1[i] == $scope.studentInExamList[j] )
				        					 {  
				        					 $scope.studentInExamList[j].Selected1 = sub.IsFilteredAllChecked1;
				        					 break;
				        					 }
				        				 }
				                 }
				        	};

		 //------------------------check uncheck function on chekbox at filtered table header for add student------------------------	        	
				        	$scope.filteredCheckUncheckHeader = function (sub) {
				                sub.IsFilteredAllChecked = true;
				                $scope.selectStudentFirstMessage=false;
				               // $scope.deleteSucessStudent=false;
				                
				                for (var i = 0; i < $scope.filteredTodos.length; i++) {
				                    if (!$scope.filteredTodos[i].Selected) {
				                       sub.IsFilteredAllChecked = false;
				                        break;
				                    }
				                };
				            };

	     //------------------------check uncheck function on chekbox at filtered table header for show student------------------------
				        	$scope.filteredCheckUncheckHeader1 = function (sub) {
				              sub.IsFilteredAllChecked1 = true;
				                $scope.selectStudentFirstMessage=false;
				               // $scope.deleteSucessStudent=false;
				                
				                for (var i = 0; i < $scope.filteredTodos1.length; i++) {
				                    if (!$scope.filteredTodos1[i].Selected1) {
				                        sub.IsFilteredAllChecked1 = false;
				                        break;
				                    }
				                };
				            };
				          	
	   //----------------------------------add selected students to exam ---------------------------------      
				            $scope.addStudentToExam = function (sub) {
				            	 var index =[];   
				            	 sub.student_filter="";	          
				            	 for (var i = 0; i < $scope.studentNotInExamList.length; i++) {
				                     if ($scope.studentNotInExamList[i].Selected) {
				                         console.log($scope.studentNotInExamList[i].fname);
				                         index.push(i);
				                         $scope.selectedstudentList.push($scope.studentNotInExamList[i]);  //--------push selected student in selectedStudentList array
				                     }
				                 }
				            	
				            	 for (var i = 0; i < $scope.studentNotInExamList.length; i++){
				            		 for (var j = 0; j < $scope.selectedstudentList.length; j++){
				            			 if( $scope.studentNotInExamList[i] == $scope.selectedstudentList[j])
				            				 {
				            				 $scope.studentNotInExamList.splice(i,1);              //remove selected student from studentList
				            				 }
				            		 }
				            	 }
				       
				            	 console.log($scope.studentNotInExamList);
				            		 
				            		 $scope.totallenght=$scope.studentNotInExamList.length/$scope.numPerPage*10;
				            		 console.log("current page: "+$scope.currentPage);
				            		 var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin + $scope.numPerPage;
					        		 console.log("begin is "+begin+" end is "+end);
					        		 $scope.filteredTodos = $scope.studentNotInExamList.slice(begin, end);
				            
				            	 if($scope.selectedstudentList.length != 0)           //----check selectedStudentList is empty or not
				            		 {
				            		// $scope.deleteSucessStudent=false; 
				            		$scope.selectStudentFirstMessage=false;
				            		  console.log("selectedstudentList is not empty");
				            		  
				      //****************** http post request to add selected student *******************
				                    $http({
							   	            url: "addSelectedStudentToExam/"+sub.id+"/"+$scope.selectedExamForAddStudent.id+"/"+sub.div.value,
							   	         	contentType : 'application/json; charset=utf-8',
							   	    	 	dataType : 'json',
							   	            method: "POST" ,        
							   	            data: JSON.stringify($scope.selectedstudentList)
							   	         })
							   	        .then(function successCallback(response) {
							   	                // if success   
							   	        	//$scope.deleteSucessStudent=true; 
							   	        	console.log("success response came"); 
							   	        	$scope.ShowSelectAll=true;
							   	        	$scope.PaginationInitialSetup(sub);
							   	        }, 
							   	    		 function errorCallback(response) {
							   	                // failed
							   	              //  $scope.deleteSucessStudent=false;
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


//---------------------------------------------delete selected students from exam -----------------------------------   

				            $scope.deleteStudentFromExam = function (sub) {
				            	 var index =[]; 
				            	 sub.student_filter1="";	 
				            	 console.log($scope.studentInExamList);           
				            	 for (var i = 0; i < $scope.studentInExamList.length; i++) {
				                     if ($scope.studentInExamList[i].Selected1) {
				                         console.log($scope.studentInExamList[i].fname);
				                         index.push(i);
				                         $scope.selectedstudentList.push($scope.studentInExamList[i]);  //--------push selected student in selectedStudentList array
				                     }
				                 }
				            	
				            	 for (var i = 0; i < $scope.studentInExamList.length; i++){
				            		 for (var j = 0; j < $scope.selectedstudentList.length; j++){
				            			 if( $scope.studentInExamList[i] == $scope.selectedstudentList[j])
				            				 {
				            				 $scope.studentInExamList.splice(i,1);              //remove selected student from studentList
				            				 }
				            		 }
				            	 }
				       
				            	 console.log($scope.studentInExamList);
				            		 
				            		 $scope.totallenght=$scope.studentInExamList.length/$scope.numPerPage*10;
				            		 console.log("current page: "+$scope.currentPage);
				            		 var begin = (($scope.currentPage - 1) * $scope.numPerPage), end = begin + $scope.numPerPage;
					        		    console.log("begin is "+begin+" end is "+end)
					        		    $scope.filteredTodos1 = $scope.studentInExamList.slice(begin, end);
				            
				            	 if($scope.selectedstudentList.length != 0)           //----check selectedStudentList is empty or not
				            		 {
				            		// $scope.deleteSucessStudent=false; 
				            		  $scope.selectStudentFirstMessage=false;
				            		  console.log("selectedstudentList is not empty");
				            		  
				 //************************ http post request to delete selected student**********************
				                    $http({
							   	            url: "deleteSelectedStudentFromExam/"+sub.id+"/"+$scope.selectedExamForAddStudent.id+"/"+sub.div.value,
							   	         	contentType : 'application/json; charset=utf-8',
							   	    	 	dataType : 'json',
							   	            method: "POST" ,        
							   	            data: JSON.stringify($scope.selectedstudentList)
							   	               
							   	        })
							   	        .then(function successCallback(response) {
							   	                // if success   
							   	        	//$scope.deleteSucessStudent=true; 
							   	        	console.log("success response came"); 
							   	     	    $scope.ShowSelectAll1=true;
							   	        	$scope.PaginationInitialSetup1(sub);
							   	        }, 
							   	    		 function errorCallback(response) {
							   	                // failed
							   	              //  $scope.deleteSucessStudent=false;
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


				                  $scope.PaginationInitialSetup=function(sub){
				            	   $scope.totallenght=$scope.studentNotInExamList.length/$scope.numPerPage*10;
				            		$scope.CheckUncheckHeader(sub);
				            		$scope.filteredCheckUncheckHeader(sub);
				            		console.log("current page: "+$scope.currentPage);
				                  	var begin = (($scope.currentPage - 1) * $scope.numPerPage),
				                  	end = begin + $scope.numPerPage;
				           		    console.log("begin is "+begin+" end is "+end);
				           		    $scope.filteredTodos = $scope.studentNotInExamList.slice(begin, end);
				              	   };	 	

				                   $scope.PaginationInitialSetup1=function(sub){
					            	   $scope.totallenght=$scope.studentInExamList.length/$scope.numPerPage*10;
					            		$scope.CheckUncheckHeader1(sub);
					            		$scope.filteredCheckUncheckHeader(sub);
					            		console.log("current page: "+$scope.currentPage);
					                    var begin = (($scope.currentPage - 1) * $scope.numPerPage),
					                    end = begin + $scope.numPerPage;
					           		    console.log("begin is "+begin+" end is "+end);
					           		    $scope.filteredTodos1 = $scope.studentInExamList.slice(begin, end);
					               };

				     /*   $scope.expand=function($event){
						console.log("in expand function");
						   if($($event.target).find('.collapse').hasClass('in')){
							   console.log("if condition");
							   $($event.target).find('.collapse').removeClass('in')
						   }else{
							   console.log("else condition");
						        $($event.target).find('.collapse').addClass('in')
						   }
						};  */ 
    });   	    

   </script> 
 </head>
 
<body ng-cloak class="ng-cloak">

<section id="container" class="">
<!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 

<!-- Default Menu -->
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
                                      <a data-toggle="tab" href="#ExistingExam">Existing Exams</a>
                                  </li>
                                  <li class="">
                                      <a data-toggle="tab" href="#CreateExam">Create Exam</a>
                                  </li>
                                  <li class="">
                                      <a data-toggle="tab" href="#AddSubjectToExam">Add Subjects to Exam</a>
                                  </li>
                                  <li class="">
                                      <a data-toggle="tab" href="#AddStudentToExam">Add Student To Exam</a>
                                  </li>
                              </ul>
                          </header>
                          <div class="panel-body">
                              <div class="tab-content">
<!-- ------Existing Exam----------------------------------- -->
                                  <div id="ExistingExam" class="tab-pane active">
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
<!-- ------Create Exam------------------------------------- -->                                    
                				  <div id="CreateExam" class="tab-pane"><div class="row">
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
							                              
							<!-- ------------------------------------Form Start------------------------------------------------------ -->                             
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
						                              
						  <!-- ------------------------------------Form End------------------------------------------------------ -->
						                          </div>
						                      </section>
						                      
						                  </div>
             					 </div>
             					 
             					 </div>
<!-- ------Add Subject To Exam ----------------------------------- -->                                 
                                  <div id="AddSubjectToExam" class="tab-pane">
                                  
										<section class="panel">
				                          <div class="panel-body">
					                              <form class="form-horizontal "  name="SelectExamForm"  method="get">
					                                  <div class="form-group">
					                                      <label class="control-label col-lg-2" for="inputSuccess">Select Exam To Add Subjects</label>
					                                      <div class="col-lg-10">
					                                          
					
					                                          <select class="form-control input-lg m-bot15" ng-model="selectedExamForAddSubject" ng-options="exam.discription for (x,exam) in examList"  required="required" required="required" required></select>
					                                         
					                                      </div>
					                                  </div>
					                              </form>
					                               <button id="add-max" class="btn btn-primary  btn-sm" ng-disabled="SelectExamForm.$invalid" ng-click="ShowTree()" >Add Subject From Institute Structure</button>
					                               <button id="add-without-image" class="btn btn-info  btn-sm" ng-disabled="SelectExamForm.$invalid" ng-click="ShowSubjectList()">Add Subject From Subject List</button>
					                              </div>
                                  		  </section>
								                        
										<section class="panel">
				                          <div class="panel-body">	
				                          
				                        	<div id="ShowTreeStrct" ng-show="ShowTreeStruct" >													
										
													
													<div>Search <input type="text" ng-model="bagSearch" /></div>											
													  	<div
														    ivh-treeview="InstTreeStructureWithSubject"
														    ivh-treeview-filter="bagSearch"
															ivh-treeview-validate="true"
														    ivh-treeview-default-selected-state="false"
														    ivh-treeview-on-cb-change="OnSelectCallback(ivhNode, ivhIsSelected, ivhTree)"
															>
													  	</div>
												  
												  	<button  ng-show="selectedSubject.length>0" class="btn btn-primary  btn-sm" ng-click="ShowSubjectTable();datepickerActivate()">Add Subjects</button>
  
                                  			</div>
                                  			
                                  			<div class="table-responsive" ng-show="ShowAddSubjectTable" ng-mouseover="datepickerActivate()">
                                  			
                                  						<div class="alert alert-info fade in" ng-show="SubjectAddedSuccess">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                  <strong>Subjects Successfully added to Exam</strong> 
							                              </div>
							                              
							                              
							                               <div class="alert alert-block alert-danger fade in "  for="inputSuccess" ng-show="SubjectAddedfailed">
							                                  <button data-dismiss="alert" class="close close-sm" type="button">
							                                      <i class="icon-remove"></i>
							                                  </button>
							                                <strong>Failed to add Subjects  to Exam</strong>
							                              </div>
							                              
							                     <button type="button" class="btn btn-info" ng-click="ShowTree()"> < Add Remove subjects from Exam</button>
	                                  			
	                                  			<form class="form-inline" role="form" name="AddSubjectToExamForm">
	                                  			
	                                  			<table class="table">
	                                  				<tr>
	                                  					<th>Selected Subject</th>
	                                  					<th>Out Of Marks</th>
	                                  					<th>Passing Marks</th>
	                                  					<th>Duration in Min</th>
	                                  					<th>Date</th>
	                                  				</tr>
	                                  			
	                                  					<tr ng-repeat="subject in selectedSubject" >
	                                  							<td>
	                                  							{{subject.label}}
	                                  							</td>
	                                  							<td> 
																      <div class="form-group">
									                                      <input type="number" ng-model="subject.OutOF" class="form-control" id="exampleInputEmail2" placeholder="Out Of Marks" required="required">
									                                  </div>
									                             </td>
									                             <td>
									                                  <div class="form-group">
									                                      <input type="number" ng-model="subject.PassingMarks" class="form-control" ng-class="{error : subject.PassingMarks>subject.OutOF }"  attrs="{data-tip= ' Passing are greater than Out Of Marks ': subject.PassingMarks>subject.OutOF }" id="exampleInputPassword2" placeholder="Passing Marks" required="required">
									                                  </div>
									                              </td>
									                              <td>
									                                  <div class="form-group">
									                                      <input type="number" ng-model="subject.DurationInMinutes" class="form-control" id="exampleInputPassword2" placeholder="Duration in Minutes" required="required">
									                                  </div>
																 </td>
																  <td>
									                                  <div class="form-group">
									                                      <input type="text" ng-model="subject.ExamDate" class="form-control datepicker" id="datepicker-topleft-forreal" placeholder="Date" required="required" >
									                                  </div>
																 </td>
	                                  						</tr>
	                                  				
	                                  				</table>
	                                  				<button type="submit" id="submitBtnAddSub" class="btn btn-primary" ng-click="AddSubjectToExamForm.$valid && ValidateOutOFandPassing() &&  AddSubjectToExam()">Save Subjects</button>
	                                  				 </form>
                                  			</div>
                                  			
                                  			
                                  			
                                  			<div  ng-show="ShowSubjectListVar">
                                  			<h1>Student List Here</h1>
                                  			</div>
                                  			
                                  			</div>
                                  		  </section>
                                  
                                    </div>
								      
	<!-- ----------------------------Add Student To Exam ----------------------------------- -->   
	                              
                                  <div id="AddStudentToExam" class="tab-pane" >
                                  
										<section class="panel">
				                          <div class="panel-body">
					                              <form class="form-horizontal "  name="SelectExamFormToAddStudent"  method="get">
					                                  <div class="form-group">
					                                      <label class="control-label col-lg-2" for="inputSuccess">Select Exam To Add Students</label>
					                                      <div class="col-lg-10">

					                                          <select class="form-control input-lg m-bot15" ng-model="selectedExamForAddStudent" ng-options="exam.discription for (x,exam) in examList"  required="required" required="required" required ng-change="selectExam()"></select>
					                                         
					                                      </div>
					                                  </div>
					                              </form>
					                               <button id="add-max" class="btn btn-primary  btn-sm" ng-disabled="SelectExamFormToAddStudent.$invalid" ng-click="ShowSelectedSubject()" style="margin-left: 17%">Show Selected Subjects</button>
					                              <!--  <button id="add-without-image" class="btn btn-info  btn-sm" ng-disabled="SelectExamForm.$invalid" ng-click="ShowSubjectList()">Add Subject From Subject List</button> -->
					                              </div>
                                  		  </section>
								                        
										<!-- <section class="panel">
				                          <div class="panel-body">	
				                          
				                          <div id="ShowTreeStrct" ng-show="ShowTreeStruct" >	
												{{$parent.selectedSubject}}
												
											
												<div  ng-controller="teacherCtrl as fancy">
													
													<div>Search <input type="text" ng-model="bagSearch" /></div>											
													  <div
													    ivh-treeview="InstTreeStructureWithSubject"
													    ivh-treeview-filter="bagSearch"
														ivh-treeview-validate="true"
													    ivh-treeview-default-selected-state="false"
													    ivh-treeview-on-cb-change="OnSelectCallback(ivhNode, ivhIsSelected, ivhTree)"
														>
													  </div>
												  
												  <button  ng-show="selectedSubject.length>0" class="btn btn-primary  btn-sm" ng-click="ShowSubjectTable()">Add Subjects</button>
												
											  
											 
											  </div>
                                  
                                  			</div>
                                  			
                                  			<div ng-show="ShowAddSubjectTable" ><h1>Add subject Table is shown</h1></div>
                                  			
                                  			<div  ng-show="ShowSubjectListVar">
                                  			<h1>Student List Here</h1>
                                  			</div>
                                  			
                                  			</div>
                                  		  </section> -->
                                  
                                    </div>      
                                
                              </div>    
                          </div>
                      </section>
                    
					<div ng-show="subjectNotInExam" class="alert alert-block alert-danger fade in">
		               <button data-dismiss="alert" class="close close-sm" type="button">
		                    <i class="icon-remove"></i>
		              </button>
				      <strong>There is no subject selected for this exam</strong> 
				   </div>
                         
                                   <section class="panel" ng-show="ShowSelectedSubjectTable">
				                        <div class="panel-body">	
				                             <div id="ShowSelectedSubjectTable" >
				                             <h2>Selected Subject List</h2>
				                           <div class="panel-group m-bot20" id="accordion"> 
				                                   
													  <div ng-repeat="sub in SubjectDivCompIDList" ng-class="{selectedrow:sub.Selected}">
														 <div class="panel panel-default">
														      <div class="panel-heading">
																 <h4 class="panel-title">
																      <i style="display: none;">{{ sub.div.value }}</i>{{ sub.inst.label }}>{{ sub.branch.label }}>{{ sub.classes.label }}>{{ sub.div.label }}><strong id="subStrong">{{ sub.subject.label }}</strong>
																	<span style="position: relative;top: -30px">
																	  <button type="button" class="btn btn-success btn-sm pull-right" ng-click="OpenShow(sub,SubjectDivCompIDList)" style="margin-right: 10px">Exam's Students</button>
																	  <button type="button" class="btn btn-success btn-sm pull-right" ng-click="OpenAdd(sub,SubjectDivCompIDList)" style="margin-right: 10px">Add Student</button>
																    </span> 
																 </h4>   
															  </div>
															 
															   <div id="add{{sub.id}}" class="collapse">
																	<div class="panel-body">
																	
																	<div ng-show="!studentNotInExamList.length" class="alert alert-block alert-danger fade in">
													                     <button data-dismiss="alert" class="close close-sm" type="button">
													                          <i class="icon-remove"></i>
													                     </button>
													                     <strong>Selected division does not contain any student or All student are added in Exam</strong> 
													                 </div>
																	
																	<div ng-show="studentNotInExamList.length">
																	     <div class="row">
									                                          <div class="col-lg-3">
									                                            
									                                              <input type="text" class="form-control" placeholder="Search Student"  ng-model="sub.student_filter" ng-change="filterStudent(sub);disableSuccessMessage()">
									                                          </div>
									                                          <div class="col-lg-2">
									                                               <button class="btn btn-primary" ng-click="addStudentToExam(sub);disableSuccessMessage()" id="addStudentSubmitBTN" type="submit" style="margin-left: 150px">Add To Exam</button>
									                                          </div>
																	     </div>
																	     <br>
																	     <div class="alert alert-block alert-danger fade in col-lg-6" ng-show="selectStudentFirstMessage">
			                                                               <button data-dismiss="alert" class="close close-sm" type="button">
			                                                               <i class="icon-remove"></i>
			                                                               </button>
			                                                               <strong>No Student Selected</strong>
			                                                             </div>
																	     <br>
																	    <table  class="table">
													                           <tbody>
													                             <tr>
													                             	<th>
													                             	   <label ng-show="ShowSelectAll">                              <!-- ;disableSuccessMessage() -->
                                                                                       <input type="checkbox" ng-model="sub.IsAllChecked" ng-change="CheckUncheckAll(sub)" /> Select All</label>
                                                                                       <label ng-show="!ShowSelectAll">
                                                                                       <input type="checkbox" ng-model="sub.IsFilteredAllChecked" ng-change="filterCheckUncheckAll(sub);disableSuccessMessage()" /> Select Filtered All</label>
                                                                                    </th>
																				    <th>
																				       <i class=""></i>Student Name
																				   </th>                                                          
													                               
													                             </tr>
													                             <tr ng-repeat="student in filteredTodos | orderBy : 'fname' | filter : sub.student_filter" ng-class="{selectedrow:student.Selected}">
																						<td><input  type="checkbox" ng-model="student.Selected" ng-change="CheckUncheckHeader(sub);filteredCheckUncheckHeader(sub);disableSuccessMessage()" /></td>
																						<td> {{ student.fname }} {{ student.father }} {{ student.lname }}</td>
													   							 </tr>
													                          </tbody>
												                      </table> 
												                      
																     									                      
														              <pagination  ng-hide="!studentNotInExamList.length"
																	      ng-model="$parent.currentPage"
																	      total-items="$parent.totallenght"
																	      max-size="$parent.maxSize"  
																	      boundary-links="true">
																	    </pagination>
																	
																	</div>
																	</div>
															  </div>
															 
															  <div id="show{{sub.id}}" class="collapse">
																 <div class="panel-body">
																	
																	<div ng-show="!studentInExamList.length" class="alert alert-block alert-danger fade in">
													                     <button data-dismiss="alert" class="close close-sm" type="button">
													                          <i class="icon-remove"></i>
													                     </button>
													                     <strong>Selected division does not contain any student added for selected Exam</strong> 
													                 </div>
																	
																	<div ng-show="studentInExamList.length">
																	     <div class="row">
									                                          <div class="col-lg-3">
									                                            
									                                              <input type="text" class="form-control" placeholder="Search Student"  ng-model="sub.student_filter1" ng-change="filterStudent1(sub);disableSuccessMessage()">
									                                          </div>
									                                          <div class="col-lg-2">
									                                               <button class="btn btn-primary" ng-click="deleteStudentFromExam(sub);disableSuccessMessage()" id="deleteStudentSubmitBTN" type="submit" style="margin-left: 150px">Remove From Exam</button>
									                                          </div>
																	     </div>
																	     <br>
																	     <div class="alert alert-block alert-danger fade in col-lg-6" ng-show="selectStudentFirstMessage">
			                                                               <button data-dismiss="alert" class="close close-sm" type="button">
			                                                               <i class="icon-remove"></i>
			                                                               </button>
			                                                               <strong>No Student Selected</strong>
			                                                             </div>
																	     <br>
																	    <table  class="table">
													                           <tbody>
													                             <tr>
													                             	<th>
													                             	   <label ng-show="ShowSelectAll1">                              <!-- ;disableSuccessMessage() -->
                                                                                       <input type="checkbox" ng-model="sub.IsAllChecked1" ng-change="CheckUncheckAll1(sub)" /> Select All</label>
                                                                                       <label ng-show="!ShowSelectAll1">
                                                                                       <input type="checkbox" ng-model="sub.IsFilteredAllChecked1" ng-change="filterCheckUncheckAll1(sub);disableSuccessMessage()" /> Select Filtered All</label>
                                                                                    </th>
																				    <th>
																				       <i class=""></i>Student Name
																				   </th>                                                          
													                               
													                             </tr>
													                             <tr ng-repeat="student in filteredTodos1 | orderBy : 'fname' | filter : sub.student_filter1" ng-class="{selectedrow:student.Selected1}">
																						<td><input  type="checkbox" ng-model="student.Selected1" ng-change="CheckUncheckHeader1(sub);filteredCheckUncheckHeader1(sub);disableSuccessMessage()" /></td>
																						<td> {{ student.fname }} {{ student.father }} {{ student.lname }}</td>
													   							 </tr>
													                          </tbody>
												                      </table> 
												                      
																     									                      
														              <pagination  ng-hide="!studentInExamList.length"
																	      ng-model="$parent.currentPage"
																	      total-items="$parent.totallenght"
																	      max-size="$parent.maxSize"  
																	      boundary-links="true">
																	    </pagination>
																	
																	</div>
																	</div>
															  </div> 
														</div>
													</div> 
													
						                             
						                             
						                           <!--   <div ng-repeat="sub in SubjectDivCompIDList" ng-class="{selectedrow:sub.Selected}">
								                              <p><i style="display: none;">{{ sub.div.value }}</i>{{ sub.inst.label }}>{{ sub.branch.label }}>{{ sub.classes.label }}>{{ sub.div.label }}><strong id="subStrong">{{ sub.subject.label }}</strong>
								                               
								                               <button class="btn btn-primary btn-sm pull-right accordion-toggle" data-toggle="collapse"  ng-href="#collapseOne{{sub.id}}" ng-click="addStudentSubmitButton(sub)" id="addStudentSubmitBTN" type="submit" style="margin-right: 10px">Add Student</button>
								                               <button class="btn btn-primary btn-sm pull-right accordion-toggle" data-toggle="collapse"  ng-href="#collapseTwo{{sub.id}}" ng-click="expand($event)" id="showStudentSubmitBTN" type="submit" style="margin-right: 10px">Exam's Student</button> 
								                              </p>
								                                 <div id="collapseOne{{sub.id}}" class="panel-collapse collapse">
				                                                   <div class="panel-body" ng-show="ShowStudentNotInExam">
								                                            <table  class="table" ng-show="ShowStudentNotInExam">
													                           <tbody>
													                             <tr>
																				   <th><i class=""></i>Student Name</th>                                                          
													                               <th><i class=""></i>Add Action</th>
													                             </tr>
													                             <tr ng-repeat="student in sub.studentNotInExamList | orderBy : 'fname'" ng-class="{selectedrow:student.Selected}">
																						<td> {{ student.fname }} {{ student.father }} {{ student.lname }}</td>
													   						
													   							 		<td>
													                                      <a class="btn btn-danger" ng-click="addStudent(student,sub)" style="margin-left: 3%"><i class="icon_plus_alt2"></i></a>
													                                    </td>
													   							 </tr>
													                          </tbody>
												                          </table>
							                                       </div>
							         
				                                                </div>
				                                          
								                              <br> 
						                             </div> -->
         					 				</div> 
         					 	</div>
         			 	</div>
          </section>
 </section>
 

     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
   
   <script>
   /*!
    * Pikaday jQuery plugin.
    *
    * Copyright © 2013 David Bushell | BSD & MIT license | https://github.com/dbushell/Pikaday
    */

   (function (root, factory)
   {
       'use strict';

       if (typeof exports === 'object') {
           // CommonJS module
           factory(require('jquery'), require('pikaday'));
       } else if (typeof define === 'function' && define.amd) {
           // AMD. Register as an anonymous module.
           define(['jquery', 'pikaday'], factory);
       } else {
           // Browser globals
           factory(root.jQuery, root.Pikaday);
       }
   }(this, function ($, Pikaday)
   {
       'use strict';

       $.fn.pikaday = function()
       {
           var args = arguments;

           if (!args || !args.length) {
               args = [{ }];
           }

           return this.each(function()
           {
               var self   = $(this),
                   plugin = self.data('pikaday');

               if (!(plugin instanceof Pikaday)) {
                   if (typeof args[0] === 'object') {
                       var options = $.extend({}, args[0]);
                       options.field = self[0];
                       self.data('pikaday', new Pikaday(options));
                   }
               } else {
                   if (typeof args[0] === 'string' && typeof plugin[args[0]] === 'function') {
                       plugin[args[0]].apply(plugin, Array.prototype.slice.call(args,1));

                       if (args[0] === 'destroy') {
                           self.removeData('pikaday');
                       }
                   }
               }
           });
       };

   }));
   
   </script>
  
    
  
	
  </body>
</html>