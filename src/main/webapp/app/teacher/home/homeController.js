(function() {
	angular.module("myApp").controller("homeController",homeController);
	//homeController.$inject=[""];
	function homeController($scope)
	{
		console.log("this is from HomeController");
		
		
		$scope.hubresponse={

		    "id": "8d410391-d673-49d9-9f09-49ddfa08d1f3",

		    "createdTime": "2018-07-23T13:29:57.672",

		    "updatedTime": "2018-07-23T13:30:07.021",

		    "chosenMean": "CAP",

		    "challenge": {1: "123456", 2: "987654"}

		};
		
		
		
		$scope.challange1=$scope.hubresponse.challenge["1"];
		//findObjectByKey(data, 'id', 2).value;
	};
	
}())