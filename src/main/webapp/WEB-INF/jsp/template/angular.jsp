<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Angular</title>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-route.js"></script>
</head>


<body ng-app="myApp">

<p><a href="#/!">Main</a></p>

<a href="#!banana">Banana</a>
<a href="#!tomato">Tomato</a>

<p>Click on the links to change the content.</p>

<p>Use the "otherwise" method to define what to display when none of the links are clicked.</p>




<div ng-view></div>

<script>
var app = angular.module("myApp", ["ngRoute"]);
app.config(function($routeProvider) {
    $routeProvider
    .when("/banana", {
    	templateUrl  : "main.html"
    })
    .when("/tomato", {
        template : "<h1>Tomato</h1><p>Tomatoes contain around 95% water.</p>"
    })
    .otherwise({
        template : "<h1>Nothing</h1><p>Nothing has been selected</p>"
    });
});
</script>

</body>
</html>
