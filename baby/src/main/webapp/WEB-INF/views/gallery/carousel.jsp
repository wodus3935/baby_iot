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

	
</body>

<style>
	#myCarousel{
		margin : 10px auto;
		width : 80%;
	}
	#demo img{
		width : 100%;
	}

</style>
<body>
	<h1>Gallery</h1>
	<a href="lightbox" class="btn btn-primary btn-sm">lightbox</a>
	<a href="upload" class="btn btn-primary btn-sm">파일 업로드</a>
	<hr/>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- indicators -->
			<ul class="carousel-indicators">
				<c:forEach items="${list}" varStatus="status">
					<li data-target="#myCarousel" data-slide-to="${image.imageId}" <c:if test="${status.first}">class="active"</c:if>></li>
				</c:forEach> 
			</ul>
		
		<div class="carousel-inner">
	 		<c:forEach var ="image" items="${list}" varStatus="status">
	 			<div class="carousel-item<c:if test = "${status.first}"> active</c:if>">
					<img src="image/${image.imageId}" alt="${image.title}">
				</div>
			</c:forEach>		
		</div>
	<!-- Left and right controls -->
	  <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
	     <span class="carousel-control-prev-icon"></span>
	  </a>
	  <a class="carousel-control-next" href="#myCarousel" data-slide="next">
	   <span class="carousel-control-next-icon"></span>
	  </a>
	</div>
</html>