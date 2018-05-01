(function(){
	angular.module("myApp").controller("paginationCtrl",homeController);
	//homeController.$inject=[""];
	function homeController($scope, $log)
	{
		console.log("this is from paginationCtrl");
		
		$scope.totalItems = 64;
		  $scope.currentPage = 4;

		  $scope.setPage = function (pageNo) {
		    $scope.currentPage = pageNo;
		  };

		  $scope.pageChanged = function() {
		    $log.log('Page changed to: ' + $scope.currentPage);
		  };

		  $scope.maxSize = 5;
		  $scope.bigTotalItems = 175;
		  $scope.bigCurrentPage = 1;
	};
}())