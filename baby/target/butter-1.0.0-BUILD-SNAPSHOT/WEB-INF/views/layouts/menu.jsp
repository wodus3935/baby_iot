<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--  material design bootstrap stylesheet -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/css/mdb.min.css" />
<!-- font awesome -->
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js" integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js" integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c" crossorigin="anonymous"></script>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	.menu{
		width:100%;
		height:50px;
		background-color:pink;
	}
	
	.left-menu{
		float:left;
	}
	
	.right-menu{
		float:right;
	}
</style>
<body>
	<div class="menu">
		<div class="left-menu">
			<a href="/butter" class="btn btn-primary btn-sm">home</a>
			<a href="${root}gallery/lightbox" class="btn btn-primary btn-sm">gallery</a>
			<a href="${root}gallery/api_view" class="btn btn-primary btn-sm">gallery2</a>
			<a href="${root}gallery/flickr" class="btn btn-primary btn-sm">flickr</a>
			<a href="${root}board/list" class="btn btn-primary btn-sm">list</a>			
		</div>
		<div class="right-menu">			
			<c:if test="${not empty USER}">
			<img src="${root}member/avata?userId=${USER.userId}" class="avata-small" style="width:30px"/>
			${USER.name}님 안녕하세요
			</c:if>			
			<a href="${root}join"	class="btn btn-primary btn-sm">join</a>
			<c:choose>
				<c:when test="${empty USER}">
					<a href="${root}login" class="btn btn-primary btn-sm">login</a>					
				</c:when>
				<c:otherwise><a href="${root}/logout" class="btn btn-primary btn-sm">logout</a></c:otherwise>
			</c:choose>
			<c:if test="${not empty USER}">
				<a href="${root}member/profile" class="btn btn-primary btn-sm">profile</a>	
			</c:if>
			<c:if test="${not empty USER}">				
				<a href="${root}talk/home" class="btn btn-primary btn-sm">토크해염 뿌</a>
				<c:if test="${newTalks>0}">
					<span class="badge badge-pill pink">
						${newTalks}
					</span>
				</c:if>	
			</c:if>
			<c:if test="${USER.grade==0}">
				<a href="${root}admin/member/list" class="btn btn-danger btn-sm">회원관리 </a>
			</c:if>
		</div>
	</div>
</body>
</html>