<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
	$(function(){
		$(".password-form").submit(function(e){
			var passoword1 = $(":password").ep(1).val();
			var passoword2 = $(":password").ep(2).val();
			
			if(passoword1!=password2){
				alert("새로운 비밀번호가 서로 틀립니다.");
				$("#newPassoword").focus();
				e.preventDefault();
			}
		})
		
	})
</script>
<body>
<form:form commandName="password">
	<div class="password-form">
		<div class="row">
			<div>
				<input type="hidden" name="userId" value="${USER.userId}">
				<div>
					<label for="oldPassword">이전 비밀번호</label>
					<form:password path="oldPassword"/>
					<form:errors path="oldPassword"/>
				</div>
				
				<div>
					<label for="newPassword">새 비밀번호</label>
					<form:password path="newPassword"/>
					<form:errors path="newPassword"/>
				</div>
				
				<div>
					<label for="newPassword">새 비밀번호 확인</label>
					<input type="password" id="newPassword2" name="newPasswrd2"/>
					<form:errors path="newPassword"/>
				</div>
				
				<form:errors cssClass="error" element="div" />
				
				<input type="submit" class="btn btn-primary" value="변경">
				<a href="javascript:history.back" class="btn btn-primary">뒤로</a>		
			</div>
		</div>
	</div>
</form:form>
</body>
</html>