<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<body>

	<div style="width:70%" class="mt-4 mb-3 ml-auto mr-auto">
		<h1>이미지 업로드</h1>
		<!-- 인코딩 타입을 꼭 빼먹지 말자~ -->		
		<form:form commandName="image" enctype="multipart/form-data">
			<div class="md-form">
				<label for="title">제목</label>
				<form:input path="title" required="required"/>
				<form:errors path="title" />
			</div>
			<div>
				<label for="description">설명</label>
				<form:textarea path="description" row="4" />
			</div>
			<div>
				<label>이미지 파일들</label>
			</div>
			<div>
			<!-- multiple은 복수 선택, accept는 범위지정(image파일 종류에 상관없이 모든 파일 선택) -->
				<input type="file" name="imageFiles" multiple="multiple" accept="image/*" required>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary btn-md">
				<i class="fa fa-check-circle mr-2"></i> 확인</button>		
				<a href="javascript:history.back()"	class="btn btn-primary btn-md">돌아가기</a>
			</div>
			</form:form>
	</div>
</body>