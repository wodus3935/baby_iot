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
<%-- <script url="<c:url value="resourece/js/rest.js" />"></script> --%>
<script src="<c:url value="/resources/js/rest.js"/>"></script>
<script src="<c:url value="/resources/js/gallery.js"/>"></script>
<c:url value="/api/gallery" var="apiUrl" />
<script>
var api = new Rest('${apiUrl}');
$(function(){
/* 	api.list('',function(images){
		console.log(images);
	}) */
	
 	$('#gallery').gallery({
		url : '${apiUrl}'
	}) 
})
</script>
<body>
	<h1>gallery2</h1>
	<hr>
	<div id="gallery"></div>
</body>
</html>