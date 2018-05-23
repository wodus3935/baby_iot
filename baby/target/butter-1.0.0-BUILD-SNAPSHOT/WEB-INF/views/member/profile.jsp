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
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<h1>회원정보</h1>
	
	<div id="container">
		<div class="row">
			<div class="col-md-2">ID</div>
			<div class="col-md-10">${member.userId}</div>
		</div>
		<div class="row">
			<div class="col-md-2">name</div>
			<div class="col-md-10">${member.name}</div>
		</div>
		
		<div class="row">
			<div class="col-md-2">아바타</div>
			<div class="col-md-10"><img src="avata?userId=${member.userId}" class="avata"></div>
		</div>
		
		<div class="row">
			<div class="col-md-2">address</div>
			<div class="col-md-10">${member.address}</div>
		</div>
		<div class="row">
			<div class="col-md-2">cellPhone</div>
			<div class="col-md-10">${member.cellPhone}</div>
		</div>
		<div class="row">
			<div class="col-md-2">email</div>
			<div class="col-md-10">${member.email}</div>
		</div>
		
		<div class="row">
			<div class="col-md-2">REGDATE</div>
			<div class="col-md-10">${member.regDate}</div>
		</div>
		
		<div class="row">
			<div class="col-md-2">UPDATEDATE</div>
			<div class="col-md-10">${member.updateDate}</div>
		</div>
		
		<div class="row">
			<div class="col-md=2"></div>
			<div class="col-md=10">
			<a href="${root}memgber/changePassword" class="btn btn-danger">비밀번호수정</a>
			<a href="${root}member/edit" class="btn btn-primary">회원정보수정</a>			
			</div>
		</div>
			
	</div>
</body>
</html>