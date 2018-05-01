(function(){
	
	angular.module("myApp").directive("tsDeleteSubjectFromExams",function(){
		return {
		
		 templateUrl: '../app/teacher/Exam/addEdit/modifyExamSubjects/deleteSubjectsFromExam/deleteSubjectFromExam.html',	
		 
		 restrict : "E",
		 controller: function($scope, $http, $interval, $filter,ivhTreeviewMgr,shairedDataService){
			 
			 
			 $scope.deledeSubjectMessage=false;		
			 $scope.DeleteSubjectMessages=false;
			 $scope.SubjectDeletionfailed=false;
			 
			 $scope.deleteMessageHide=function(){
				 $scope.deledeSubjectMessage=false;		
				 $scope.DeleteSubjectMessages=false;
				 $scope.SubjectDeletionfailed=false;
			 }
			 
			 $scope.deleteMessageSuccess=function(){
				 $scope.deledeSubjectMessage=true;		
				 $scope.DeleteSubjectSuceessMessages=true;
				 $scope.SubjectDeletionfailed=false;	
				 $scope.ShowDeleteSubjectTable=false;
			 }
			 
			 $scope.deleteMessagefailed=function(){				 
				 $scope.deledeSubjectMessage=true;		
				 $scope.DeleteSubjectSuceessMessages=false;
				 $scope.SubjectDeletionfailed=true;		
				 
			 }
			 
			 $scope.subjectsDeleted=false;
			 $scope.subjectsAdded=false;
			 
			 $scope.ShowTreeStructDeleteSubjetcs=true;
			 $scope.ShowDeleteSubjectTable=false;
			 
			 $scope.ShowSubjectToBeDeletedTable=function(){
				 $scope.ShowTreeStructDeleteSubjetcs=false;
				 $scope.ShowDeleteSubjectTable=true;
				 
			 }
			 
			 $scope.ShowTreeAddDeleteSubjects=function(){
				 $scope.ShowTreeStructDeleteSubjetcs=true;
				 $scope.ShowDeleteSubjectTable=false;
			 }
			 
			 
			 $scope.DeleteSelectedSubjects=function(){
				 $scope.DeleteSubDivId=[];
				 
				 for (var i = 0; i < $scope.selectedSubjectForDelete.length; i++) {							 
					 $scope.DeleteSubDivId.push($scope.selectedSubjectForDelete[i].value);
				 }
				 console.log($scope.DeleteSubDivId);

					var data = JSON.stringify($scope.DeleteSubDivId);
					
					$http(
							{
								url : "DeleteSubjectsFromExam/"+$scope.selectedExamForAddSubject.id,
								contentType : 'application/json; charset=utf-8',
								dataType : 'json',
								method : "POST",
								data : data
							})
							.then(
									function(response) {
										// if success       	
										console.log("succcess");
										var resp = response.data;
										if(response.data.status=="success"){$scope.deleteMessageSuccess();
											$scope.DeleteSuccessCount=response.data.SuccessCount;
											$scope.DeleteFailureList=response.data.FailedToDelet;
											$scope.deleteMessageSuccess();
											
										}else{
											$scope.deleteMessagefailed();
										}
												

										console.log(response.data);
									},
									function(data) { // optional
										// failed		                 
										console.log(" failed to AddSubjectToExam the exam");
									});

				 
				 
			 }
			 
			 
			//------------------------------Tree Traverlsal and Add the selected Items in respective array ----------------------------------------------------- 		   				
				$scope.TreeTraversalForSelectedItemsInDeleteSubjects = function(o) {
					for ( var i in o) {

						if (o[i] !== null
								&& typeof (o[i]) == "object") {

		

							if (o[i].type == "Subject"
									&& o[i].selected == true) {
								//console.log("Selected subject is "+o[i].label);
								$scope.selectedSubjectForDelete.push(o[i]);
							}
							//going one step down in the object tree!!
							$scope.TreeTraversalForSelectedItemsInDeleteSubjects(o[i]);
						}
					}
				}
			 
			 
			//------------------------------Callback Function on select of any tree node -----------------------------------------------------
				$scope.OnSelectCallbackForDelete = function(node,
						isSelected, tree) {

					// initially make all the arrays empty
					
					$scope.selectedSubjectForDelete = [];

					$scope.SubjectDivCompIDList = [];

					// call tree traversal function to get the selected itmes in arrays
					$scope.TreeTraversalForSelectedItemsInDeleteSubjects(tree);

					
					console.log("Total Subjects Selected are  "+ $scope.selectedSubjectForDelete.length);
					console.log($scope.selectedSubject);
					console.log("*************************************************************************");

				}
			 
			 
			 $scope.GetTreeStructSubjectsOfExam=function(InstId,ExamId){
				 
				 $http(
							{
								url : "TreeStructureSujectsOfExam/"+InstId+"/"+ExamId,
								contentType : 'application/json; charset=utf-8',
								dataType : 'json',
								method : "POST",
							})
							.then(
									function(response) {
										// if success       	
										console.log("succcess");
										console.log(response.data);
										$scope.InstTreeStructureWithSubjectOfExam=response.data;
									},
									function(data) { // optional
										// failed		                 
										console.log(" failed to get TreeStructureSujectsNotInExam");
									});
				 
			 }
			 		
			 
			 },
		 }
		 
		 
	})
}())