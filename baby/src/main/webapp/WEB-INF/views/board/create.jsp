<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<c:url value="/resources/bower_components/tinymce/tinymce.min.js" var="tinymce"/>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="${tinymce}"></script>
<script>
$(function(){
	tinymce.init({
		selector : 'textarea',
		height : "300"
	});
})
</script>

<h2 class="mt-5 mb-4">게시글 작성</h2>

<form:form commandName="board" enctype="multipart/form-data">
	
	<div class="md-form">
			<label>제목</label>
			<br>
			<form:input path="title" required="required" />
			<form:errors path="title" />
	</div>
	<div class="md-3">
		<label>작성자 : ${USER.userId} </label>
		<input type="hidden" name="writer" value="${USER.userId}" />
	</div>	
	<div class="md-form">
		<label>비밀번호</label>
		<br>
		<form:password path="password" required="required" />
		<form:errors path="password" />
	</div>
	<div>
		<label>파일첨부</label>
		<input type="file" name="files" multiple="multiple">
	</div>
	<form:textarea path="content" />
	<div class="text-center mt-3">
		<button type="submit" class="btn btn-primary">확인</button>
		<a href="javascript:history.back()" class="btn btn-primary">돌아가기</a>
	</div>
</form:form>