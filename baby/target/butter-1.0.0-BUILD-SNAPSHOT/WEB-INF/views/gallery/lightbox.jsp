<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="iot" tagdir="/WEB-INF/tags/util"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- contextPath 붙여주기 -->
<c:url value="/" var="root" />
<!-- lightbox -->
<link	href="${root}resources/bower_components/lightbox2/dist/css/lightbox.css" rel="stylesheet">
<script	src="${root}resources/bower_components/lightbox2/dist/js/lightbox.js"></script>

	<h1>Gallery</h1>

	<a href="carousel" class="btn btn-primary btn-sm">carousel</a>
	<a href="upload" class="btn btn-primary btn-sm">파일 업로드</a>
	<hr/>
	<div class="text-right mb-2">
		보기 모드 : 
		<a href = "lightbox?page=${param.page}&mode=tile">타일형</a>
		<a href = "lightbox?page=${param.page}&mode=list">리스트형</a>
	</div>
	
	<c:if test="${param.mode!='list'}">
		<jsp:include page="lightbox_tile.jsp"></jsp:include>
	</c:if>
	
	<c:if test="${param.mode=='list'}">
		<jsp:include page="lightbox_list.jsp"></jsp:include>
	</c:if>
	
	<div>
		<iot:pagination pagination="${pagination}" link="" params="&mode=${param.mode}"></iot:pagination>
	</div>
