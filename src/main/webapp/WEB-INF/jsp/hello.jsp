<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
	   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<h1>Title : ${title}</h1>
	<h1>Message : ${message}</h1>
	<h3>sfsdfsfsd</h3>
	
	<c:url var="logoutUrl" value="/login?logout"/>
    <form:form action="${logoutUrl}"
            method="post">
    <input type="submit"
               value="Log out" />
    <input type="hidden"
                name="${_csrf.parameterName}"
                value="${_csrf.token}"/>
    </form:form>

	<sec:authorize access="hasRole('ROLE_USER')">
		<!-- For login user -->
		<c:url var="logoutUrl" value="/login?logout"/>
    <form:form action="${logoutUrl}"
            method="post">
    <input type="submit"
               value="Log out" />
    <input type="hidden"
                name="${_csrf.parameterName}"
                value="${_csrf.token}"/>
    </form:form>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>


	</sec:authorize>
</body>
</html>