<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:url value="/" var="root"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--  material design bootstrap stylesheet -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/css/mdb.min.css" />
<!-- font awesome -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"
	integrity="sha384-+Ga2s7YBbhOD6nie0DzrZpJes+b2K1xkpKxTFFcx59QmVPaSA8c7pycsNaFwUK6l"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
	integrity="sha384-7ox8Q2yzO/uWircfojVuCQOZl+ZZBg2D2J5nkpLqzH1HY0C1dHlTKIbpRz/LG23c"
	crossorigin="anonymous"></script>

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.menu {
	width: 100%;
	height: 50px;
	background-color: pink;
}

.left-menu {
	float: left;
}

.right-menu {
	float: right;
}
</style>


<body>

<nav
	class="navbar fixed-top navbar-expand-lg navbar-dark pink scrolling-navbar">
<a class="navbar-brand" href="#"><strong>Navbar</strong></a>
<button class="navbar-toggler" type="button" data-toggle="collapse"
	data-target="#navbarSupportedContent"
	aria-controls="navbarSupportedContent" aria-expanded="false"
	aria-label="Toggle navigation">
	<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarSupportedContent">
	<ul class="navbar-nav mr-auto">
		<li class="nav-item active"><a class="nav-link" href="/butter">Home
				<span class="sr-only">(current)</span>
		</a></li>
		<li class="nav-item"><a class="nav-link" href="${root}board/list">게시판</a>
		</li>
		<li class="nav-item"><a class="nav-link" href="#">중고장터</a></li>
		<li class="nav-item"><a class="nav-link" href="#">다이어리</a></li>
	</ul>
	<ul class="navbar-nav nav-flex-icons">
		
			<c:if test="${not empty USER}">
				<li class="nav-item"><a class="nav-link">
					<img src="${root}member/avata?userId=${USER.userId}" class="avata-small" style="width: 30px" />${USER.name}님 안녕하세요
				</li>
			</c:if>		
		
		<li>
			<a href="${root}join" class="nav-link">join</a>
		</li>		
			
			<c:choose>
				<c:when test="${empty USER}">
					<li class="nav-item">	
						<a href="${root}login" class="nav-link">login</a>
					</li>
				</c:when>
				<c:otherwise>
					<li>
						<a href="${root}/logout" class="nav-link">logout</a>
					</li>
				</c:otherwise>
			</c:choose>	
							
		

			<c:if test="${not empty USER}">
				<li>
					<a href="${root}member/profile" class="nav-link">profile</a>
				</li>
			</c:if>

		
			<c:if test="${not empty USER}">
				<li>
				<a href="${root}talk/home" class="nav-link">토크해염 뿌</a>
				</li>
				<c:if test="${newTalks>0}">

						<span class="badge badge-pill pink"> ${newTalks} </span>

				</c:if>
			</c:if>

			<c:if test="${USER.grade==0}">
				<li>
					<a href="${root}admin/member/list" class="nav-link">회원관리
					</a>
				</li>
			</c:if>

	</ul>
</div>
</nav>

</body>
</html>