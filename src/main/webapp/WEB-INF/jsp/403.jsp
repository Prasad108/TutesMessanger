<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    

    <title>404</title>
 <jsp:include page="/WEB-INF/jsp/components/defaultHead.jsp" />
</head>

<body>
<div class="page-404">
    <p class="text-404">403</p>

    <h2><strong>Aww Snap!</strong></h2>
    <h2><strong> Access is denied</strong></h2>
    <p>	<h3> You do not have permission to access this page! </h3><br><a onclick="history.back()" href="#">Return Back</a></p>
   
  </div>
	<!-- <h1>HTTP Status 403 - Access is denied</h1> -->

	<%-- <c:choose>
		<c:when test="${empty username}">
			<h2>You do not have permission to access this page!</h2>
		</c:when>
		<c:otherwise>
			<h2>Username : ${username} <br/>You do not have permission to access this page!</h2>
		</c:otherwise>
	</c:choose> --%>

</body>
</html>