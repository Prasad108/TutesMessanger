(function(){

angular.module("myApp").directive("tsNewSubjectInfo",function(){
		return {		 
			//templateUrl: '../app/commanDirectives/subjectInfo/subjectInfo.html',	

			restrict : "A",
//			scope :{
//				 sub:'=sub',
//				 InstTreeStructureWithSubject :'<'
//			 },

			 link: function($scope, iElm, iAttrs, controller) {

			    	console.log("$scope.sub is ");
			    	console.log($scope.sub);
			    	//console.log($scope.sub);
			    	console.log($scope.SubjectDivCompIDList );
			    	//$scope.customerInfo="New Hare Krishna";
			    	
			    	
			    	function traverseTillsubDivId(o, subDivId) {

						if ($scope.flag < 1) {
							for ( var i in o) {
								if ($scope.flag < 1) {
									if (o[i] !== null
											&& typeof (o[i]) == "object") {
										if (o[i].type == "Institute") {
											$scope.inst.label = o[i].label;
											console.log($scope.inst.label);
										}

										if (o[i].type == "Branch") {
											$scope.branch.label = o[i].label;
											console.log($scope.branch.label);
										}

										if (o[i].type == "Class") {
											$scope.classes.label = o[i].label;
											console.log($scope.classes.label);
										}

										if (o[i].type == "Division") {
											$scope.div.label = o[i].label;
											$scope.div.value = o[i].value;
											console.log($scope.div.label);
											console.log($scope.div.value);
										}

										if (o[i].type == "Subject"
												&& o[i].value == subDivId) {
											$scope.subject.label = o[i].label;
											console.log($scope.subject.label);
											$scope.flag = 2;
											console.log("break **************************");
											break;
										}

										//going one step down in the object tree!!
										traverseTillsubDivId(o[i], subDivId);
									}
								}
							}
						}
					};
					
					//for (var j = 0; j < $scope.SubjectDivCompIDList.length; j++) {
						$scope.flag = 0;
						$scope.inst = {};
						$scope.branch = {};
						$scope.classes = {};
						$scope.div = {};
						$scope.subject = {};

						$scope.flag = 0;

						traverseTillsubDivId(
								$scope.InstTreeStructureWithSubject,
								$scope.sub.id);

						if ($scope.flag > 0) {
							$scope.sub.inst = $scope.inst;
							$scope.sub.branch = $scope.branch;
							$scope.sub.classes = $scope.classes;
							$scope.sub.div = $scope.div;
							$scope.sub.subject = $scope.subject;
						}
						console.log($scope.sub);
					//}
					
						
			}
		 }
});

}());