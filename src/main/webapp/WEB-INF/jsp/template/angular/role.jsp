<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>role</title>
	<jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />  

<!--  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

   

    Bootstrap CSS    
    <link href="/TutesMessanger/css/bootstrap.min.css" rel="stylesheet">
    bootstrap theme
    <link href="/TutesMessanger/css/bootstrap-theme.css" rel="stylesheet">
    external css
    font icon
    <link href="/TutesMessanger/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="/TutesMessanger/css/font-awesome.min.css" rel="stylesheet" />    
    full calendar css
    <link href="/TutesMessanger/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" rel="stylesheet" />
	<link href="/TutesMessanger/assets/fullcalendar/fullcalendar/fullcalendar.css" rel="stylesheet" />
    easy pie chart
    <link href="/TutesMessanger/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
    owl carousel
    <link rel="stylesheet" href="/TutesMessanger/css/owl.carousel.css" type="text/css">
	<link href="/TutesMessanger/css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
    Custom styles
	<link rel="stylesheet" href="/TutesMessanger/css/fullcalendar.css">
	<link href="/TutesMessanger/css/widgets.css" rel="stylesheet">
    <link href="/TutesMessanger/css/style.css" rel="stylesheet">
    <link href="/TutesMessanger/css/style-responsive.css" rel="stylesheet" />
	<link href="/TutesMessanger/css/xcharts.min.css" rel=" stylesheet">	
	<link href="/TutesMessanger/css/jquery-ui-1.10.4.min.css" rel="stylesheet"> -->
    

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.js"></script>


<script>
var app = angular.module('myApp', []);

app.controller('roleCtrl', function($scope, $http) {
   
   // get all the roles from server as soon as page loads
    $http.get("getRoles").then(function (response) {
        $scope.roles = response.data;
    });

  //-------------delete fucntion-------------------
    $scope.delete=function(r)
    { 
        $http({
            url: "deleteRole/"+r.id,
            method: "POST",          
        })
        .then(function(response) {
                // if success       	
        	 console.log(" role is deleted : "+r.id+" name :"+r.name);
        	 console.log("role is deleted and response recieved is :"+response.data.message);

 			
        	 $scope.deletemessage=response.data.message;
        	//delete the role from array
        	 for( i=$scope.roles.length-1; i>=0; i--) {
        		    if( $scope.roles[i].id == r.id) $scope.roles.splice(i,1);
        		}              
        }, 
        function(data) { // optional
                // failed
                 $scope.deletemessage=data.message;
        	 console.log(" role is deletion failed and response is "+data.message);      
        });

    };
     
           
  //-------------Save fucntion-------------------
    $scope.save = function () {
        var name=$scope.rolename;
        var data = JSON.stringify({name:$scope.rolename});
        $http({
            url: 'saveRole',
            method: "POST",
            data: data
        })
        .then(function(response) {
                // success                
              $scope.SaveResponse="Role is "+$scope.rolename+" saved in db "
				// addin
               $scope.roles.push(response.data);             
              console.log(" role is saved and response is "+data);
        }, 
        function(response) { // optional
                // failed
                    $scope.SaveResponse="Error has accured in saving role"
        	 $scope.SaveResponse = data;
        	 console.log(data);
        });       
    }

    $scope.getDetailsInUpdateform=function(r){

    	$scope.roleIdUpdate=r.id;
    	$scope.roleNameUpdate=r.name;

        }

//-------------update fucntion-------------------
    $scope.Updatefunction=function(){
    	  var data = JSON.stringify({id:$scope.roleIdUpdate,name:$scope.roleNameUpdate});
    	$http({
            url: 'UpdateRole',
            method: "POST",
            data: data
        })
        .then(function(response) {
                // success              
              $scope.UpdateResponse=response.data;                       
              console.log(" role is updated  and response is "+response.data.message);         			
			var obj = {}
			obj.id=$scope.roleIdUpdate;
			obj.name=$scope.roleNameUpdate;

			var updateObj=JSON.stringify(obj);

			// delete the object from the array						  
			  for( i=$scope.roles.length-1; i>=0; i--) {
	      		    if( $scope.roles[i].id == $scope.roleIdUpdate) $scope.roles.splice(i,1);
	      		}
	      			
			console.log("updated role is"+updateObj);
			// update the roles array and push the updated role object into it
              $scope.roles.push(obj);  
              
              
        }, 
        function(response) { // optional
                // failed
                    $scope.SaveResponse="Error has accured in saving role"
        	 $scope.UpdateResponse = response.data;
        	 console.log(data);
        });
    	
     }
//-------------------------------------------------------------------------------------------   
    
  
   
});
</script>

</head>


<body ng-app="myApp" ng-controller="roleCtrl">

<section id="container" class="">
   <!-- Default header -->
<jsp:include page="/WEB-INF/jsp/components/defaultHeader.jsp" /> 

<!-- Default Menue -->
<jsp:include page="/WEB-INF/jsp/Teacher/components/teacherMenu.jsp" />  
<section id="main-content">
          <section class="wrapper">
          <div class="row">

<div >
<form ng-submit="save()">
Role name: <input type="text" ng-model="rolename"  required>
<br>
 <input type="submit" value="Save Role">
</form>

<p>{{SaveResponse}}</p>
<p>{{deletemessage}}</p>
<p>{{UpdateResponse.message}}</p>
</div>

<div >
<p>Find :
 <input type="text" ng-model="test"></p>
<table>
<tr>
<th>Id</th>
<th>Name</th>
<th>Delete</th>
<th>Edit/Update</th>
</tr>
  <tr ng-repeat="r in roles | filter : test | orderBy:'id'" >
  
    <td>{{ r.id }}</td>
    <td>{{ r.name }}</td>
    <td ng-click="delete(r)"> X</td>
    
     
    <td ><button type="button" ng-click="getDetailsInUpdateform(r)">Update</button> </td>
  </tr>
</table>
</div>
<br>
<br>

<div>
<form name="updateForm" ng-submit="Updatefunction()">
Role id: <input type="text" ng-model="roleIdUpdate"  required  disabled>
<br>
Role name is <input type="text" ng-model="roleNameUpdate" required>
<br>
 <input type="submit" value="Update Role" ng-disabled="updateForm.$pristine" >
</form>


</div>

<style>
table, th , td {
  border: 1px solid grey;
  border-collapse: collapse;
  padding: 5px;
}
table tr:nth-child(odd) {
  background-color: #f1f1f1;
}
table tr:nth-child(even) {
  background-color: #ffffff;
}
</style> 
</section>
 </section>   
     <!-- container section start -->
<jsp:include page="/WEB-INF/jsp/components/defaultScript.jsp" />
   </section>
 <!-- container section start -->
</body>
</html>
