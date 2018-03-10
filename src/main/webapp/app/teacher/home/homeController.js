(function() {
	angular.module("myApp").controller("homeController",homeController);
	//homeController.$inject=[""];
	function homeController()
	{
		console.log("this is from HomeController");
	};
	
}())