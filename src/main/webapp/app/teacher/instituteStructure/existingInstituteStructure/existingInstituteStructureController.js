(function(){

angular.module("myApp").controller("existingInstituteStructureController",existingInstituteStructureController);
existingInstituteStructureController.$inject=['$scope','$http'];

function existingInstituteStructureController($scope,$http){
	
	console.log("*******existingInstituteStructureController*********");
	
	$scope.structure;
	 
	  
	  $http({
		    url: 'getInstituteStructure',
		    contentType : 'application/json; charset=utf-8',
		  	 dataType : 'json', 
		    method: 'POST',    
		    
		}).then(function successCallback(response) {
		    $scope.structure = response.data;
		}, function errorCallback(response) {
		 console.log(response.statusText);
		});
	  
}

}())