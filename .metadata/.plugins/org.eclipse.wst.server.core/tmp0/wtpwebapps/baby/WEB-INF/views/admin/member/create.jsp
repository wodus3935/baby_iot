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
<script>
	$(function(){
			
		
		$('#check-btn').click(function(e){
			
			//e.preventDefault();
			var userId=$('#userId').val();
			
			if(userId==""){
				alert("ID를 입력하세요");
				return;
			}
			/* idcheck url지정하기~ */
			<c:url value="/idcheck" var="idcheck"/>
			$.get('${idcheck}',{userId:userId},function(data){
					console.log("있으면 true 없으면 false : " +data);
					if(data){
						$(':submit').prop('disabled',true);
						$('#check-message').html("이미 사용중인 id 입니다.");
					}else{
						$(':submit').prop('disabled',false);
						$('#check-message').html("사용해도 되는 id 입니다.");
					}
			})	
		});
		//id일치 검사
		//data는 리턴값 

	//비밀번호 일치 검사 바로바로 알려면??
		$('#join-form').submit(function(e){
			//type이 password인것 중에 첫번째와 두번째 값비교
			var password1 = $(':password').eq(0).val();
			var password2 = $(':password').eq(1).val();
			
			if(password1 != password2){
				alert("password가 일치하지 않습니다.");
				$("#password").eq(0).focus();
				e.preventDefault();
			}
			
		})
		 
		
	});
</script>
<body>
	<div id="join-form" class="join-form">
		<h1>회원추가</h1>
		<form:form commandName="member">
		
		아이디 : <form:input path="userId"/><form:errors path="userId"/><br>
		<span id="check-message"></span>
		<p>
		<button type="button" id="check-btn" class="btn btn-primary">ID 중복체크</button><br>
		</p>
		비밀번호 : <form:password path="password"/><form:errors path="password"/><br>
		
		<!-- 어떻게 할까 ajax 쓰면 되지않을까? -->
		비밀번호 확인 : <input type="password" id="password2" name="password2">
		
		이름 : <form:input path="name"/><form:errors path="name"/><br>
		
		e-mail : <form:input path="email"/><form:errors path="email"/><br>
		
		연락처 : <form:input path="cellPhone"/><form:errors path="cellPhone"/><br>
		
		주소 : <form:input path="address"/><form:errors path="address"/><br>
		
		<div class="md-form text-center">
			<button type="submit" class="btn btn-primary" disabled>
				<i class="fa fa-check"></i>확인
			</button>
			<!-- page에는 이전 정보가 들어있어야함 -->
			<a href="list?page=${param.page}" class="btn btn-primary">
				<i class="fa fa-list"></i>목록
			</a>
		</div>
		
		</form:form>
	</div>

</body>
</html>