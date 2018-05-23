<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>

<body>
	<c:if test="${not empty login.url}">
		<div class="mt-4 mb-4">
			<h1>
				로그인이 필요한 서비스 입니다. 로그인 하세요.
			</h1>
		</div>
	</c:if>
	<form:form commandName="login">
		<p>
		아이디 : 
		<form:input path="userId" />
		<form:errors path="userId"/>
		</p>
		<p>
		비밀번호 : 
		<form:password path="password" />
		<form:errors path="password"/>
		</p>
		<input type="submit">
		<%-- <form:errors /> --%>
		<c:if test="${not empty error}">
		${error}
		</c:if>
		<form:hidden path="url"/>
	</form:form>
</body>
</html>