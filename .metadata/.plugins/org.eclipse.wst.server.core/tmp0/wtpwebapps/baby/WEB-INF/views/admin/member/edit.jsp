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
	<h1>회원정보 수정</h1>
	<form:form commandName="member">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<label for="userId">ID : </label>					
				</div>
				<div class="col-md-6">
					 ${member.userId}
					<form:hidden path="userId" />
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<label for="name">name : </label>					
				</div>
				<div class="col-md-6">
					 ${member.name}
					<form:hidden path="name" />
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<label for="password">password : </label>	
				</div>
				<div class="col-md-6">
					<form:password path="password" />
					<form:errors path="password" />
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<label for="address">before address : ${member.address}</label>		
				</div>
				<div class="col-md-6">
					<form:input path="address" />
					<form:errors path="address" />
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-6">
					<label for="cellPhone">before cellPhone : ${member.cellPhone}</label>
				</div>
				<br>
				<div class="col-md-6">
					<form:input path="cellPhone" />
					<form:errors path="cellPhone" />
				</div>
			</div>	

			
			<div class="row">
				<div class="col-md-6">
					<label for="email">before email : ${member.email}</label>
				</div>
				<div class="col-md-6">
					<form:input path="email" />
					<form:errors path="email" />
				</div>
			</div>
			
			<form:errors cssClass="error" element="div" />
			
			<div class="row">
				<div class="col-md-6">
					<input type=submit class="btn btn-primary" value="변경"></a>
				</div>
			</div>			
			<div class="row">
				<div class= "col-md-3">
					<a href="../view/${userId}?page=?${param.page}">돌아가기</a>
				</div>
			</div>
		</div>
	</form:form>
</body>
</html>