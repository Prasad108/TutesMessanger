<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<title>StudentManager</title>
 <jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" /> 

<%-- <jsp:include page="/WEB-INF/jsp/Teacher/components/angular.jsp" /> --%>


	<script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.0-rc.0/angular.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />



<link data-require="bootstrap-css@*" data-semver="3.3.1" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />

    <script data-require="ui-bootstrap@*" data-semver="0.12.1" src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.1.min.js"></script>

<style> 
  .selectedrow {	  
    background-color:red;   
	}
	
	tr:hover {
  background-color: pink;
	}
	
	tr:hover td {
	  color: blue;
	}
	
	</style>

  <script>


  

  		var app = angular.module('myApp', ['ui.bootstrap']);
  		
   		app.controller('myCtrl', function($scope, $http, $filter) {


   		
   			$scope.studentList=JSON.parse('${StudentListJSON}');
   			$scope.teacher=JSON.parse('${teacherJSON}');
   			$scope.permissions=JSON.parse('${permissions}'); 


   		 $scope.filteredTodos = []
   	  ,$scope.currentPage = 1
   	  ,$scope.numPerPage = 5
   	  ,$scope.maxSize = 6,
   	  
   	$scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;
   	   	console.log("total length"+$scope.totallenght)
   			 
   		 console.log("hello console");

   		$scope.idSelectedStudent = null; 

   		 $scope.selected= []; 


   		$scope.setSelected = function (idSelectedVote) {
   		   $scope.idSelectedVote = idSelectedVote;
   		}
   		
   		$scope.Selecte = function (student) {
   	   		console.log("inside the function");
   	   		console.log($scope.selected);

		   	   	var hasMatch =false;
		
		   	 for (var index = 0; index < $scope.selected.length; ++index) {
		
		   	  var stud = $scope.selected[index];
		
		   	  if(stud.id == student.id){
		   	    hasMatch = true;
		   	    break;
		   	  }
		   	 }

   	   		if(hasMatch)  
   	   	   		{
   	   	   		console.log("object was in the array but removed now");
   	   	//delete student from array
           	 for( i=$scope.selected.length-1; i>=0; i--) {
           		    if( $scope.selected[i].id == student.id) $scope.selected.splice(i,1);
           		} 
   	   	   		
   	   	   		}
   	   		else
   	   	   		{
   	   		$scope.selected.push(student)
   	   	   		console.log("object was not in the array added it now");
   	   	   		}

   	   	console.log("after function executed"+$scope.selected);
    		  
    		}



   		$scope.IsContains=function (student) {
   	   		console.log("inside the Iscontains function")
   			var hasMatch =false;
   			
		   	 for (var index = 0; index < $scope.selected.length; ++index) {
		
		   	  var stud = $scope.selected[index];
		
		   	  if(stud.id == student.id){
		   	    hasMatch = true;

		   	    console.log("match found");
		   	    break;
		   	  }
		   	 }
		   	 return hasMatch;
   		}

   		$scope.add=function () {
   	   		console.log("inside the add function")
   			var length=$scope.selected.length-1
	   	   	for( i=length; i>=0; i--) {
	
		   	   	   	var tempStudent=$scope.selected[i];
		
				   	   	 for( j=$scope.studentList.length-1; j>=0; j--) {
				 		    if( $scope.studentList[j].id == tempStudent.id)
				 		    {
					 		     $scope.studentList.splice(j,1);	
					 		   
					 		     
					 		    		 		 		 
				 		    }
				 		}   
				   	  for( j=$scope.filteredTodos.length-1; j>=0; j--) {
				 		    if( $scope.filteredTodos[j].id == tempStudent.id)
				 		    {
					 		     $scope.filteredTodos.splice(j,1);	
					 		   
					 		     
					 		    		 		 		 
				 		    }
				 		}    
				   	$scope.totallenght=$scope.studentList.length/$scope.numPerPage*10;		   
	   		} 

   	   	 for( i=$scope.selected.length-1; i>=0; i--) {
 		     $scope.selected.splice(i,1);
 		}   
		
   		}



   		$scope.$watch('currentPage + numPerPage', function() {
   		    var begin = (($scope.currentPage - 1) * $scope.numPerPage)
   		    , end = begin + $scope.numPerPage;
   		    console.log("begin is "+begin+" end is "+end)
   		    $scope.filteredTodos = $scope.studentList.slice(begin, end);
   		  });
     		  			  			   			  			 			  			
   		}); 
   		
   		  		
   		</script>

   		
   		

</head>
<body ng-app="myApp" ng-controller="myCtrl" >

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 


 <!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" /> 

<aside>
  <section id="main-content">
          <section class="wrapper">  
          
          
          <h1>Add Student to Division</h1>
          <br>{{selected}}
          <a class="btn btn-success" ng-click="add()" href="#"> Add to Division</a>
            <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                             Student who are not in any Division are {{studentList.length}}
                          </header>
                           <div class="row">
                <div class="col-lg-3">
                   <input type="text" class="form-control"  ng-model="test">
                </div>
               </div>
                          
                          <table id="example" class="table  ">
                           <tbody>
                              <tr>
                                 <th><i class="icon_profile"></i> Full Name</th>                               
                                 <th><i class="icon_mail_alt"></i> Email</th>                            
                                 <th><i class="icon_mobile"></i> Mobile</th>
                               
                              </tr>
                              <tr ng-repeat="student in filteredTodos | filter : test | orderBy:'fname' "  ng-class="{selectedrow:IsContains(student)}" ng-click="Selecte(student)">
    								<td>{{ student.fname }}  {{ student.lname }}</td>
   							 		<td>{{ student.email }}</td>
   							 		<td>{{ student.contactno }}</td>
   							 		
                                 
  							</tr>
                             
                                                    
                           </tbody>
                        </table>
                       <pagination 
      ng-model="currentPage"
      total-items="totallenght"
      max-size="maxSize"  
      boundary-links="true">
    </pagination>
                               
                              <div ng-show="!studentList.length" class="alert alert-info fade in">
                                  <button data-dismiss="alert" class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>No pending request for approval</strong>
                              </div>
                      </section>
                  </div>
              </div>
          
          
  </section>   
   </section> 
    </aside>  
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->                    


</body>
</html>