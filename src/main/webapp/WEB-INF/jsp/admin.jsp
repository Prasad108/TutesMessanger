<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<%@page session="true"%>


<html>
<body>
	<h1>Title 1: ${title}</h1>
	<h1>Message : ${message}</h1>
	
	
	<c:url var="logoutUrl" value="/login?logout"/>
    <form:form action="${logoutUrl}"
            method="post">
    <input type="submit"
               value="Log out" />
    <input type="hidden"
                name="${_csrf.parameterName}"
                value="${_csrf.token}"/>
    </form:form>
	

	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>

	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h2>
			Welcome : ${pageContext.request.userPrincipal.name} | <a
				href="javascript:formSubmit()"> Logout</a>
		</h2>
	</c:if>

</body>
</html>