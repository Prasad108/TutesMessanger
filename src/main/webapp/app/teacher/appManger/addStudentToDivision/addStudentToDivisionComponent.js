(function(){
	angular.module("myApp").component("addStudentToDivisionComponent",{
		 templateUrl: '../app/teacher/appManger/addStudentToDivision/addStudentToDivision.html',
		 controller: 'addStudentToDivisionController',
		 
		 bindings: {
			 studentList: '=',
			 branchList: '=',
		    }
	})
}())