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
</script>
<body>
	<div class="text-right">
		(총 ${pagination.totalCount} 명 /
		<!--  -->
		<a href="create?page=${param.page}"><i class="fa fa-user-plus"></i>추가</a>)
	</div>
	
	<table class="table table-stripped">
		<thead>
			<tr>
				<th style="width:60">No</th>
				<th>사용자 ID</th>
				<th>이름</th>
				<th>email</th>
				<th>전화번호</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<!-- 컨트롤러에서 저장한 날짜를 가져오자~ -->			
			<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" var="todayStr"></fmt:formatDate>
			<fmt:formatDate value="${nowdate}" pattern="yyyy-MM-dd" />
			<c:forEach var="member" items="${list}" varStatus="status">
				<tr>
					<!-- 페이지의 첫번째 번호 -->
					<td>${pagination.start + status.index}</td>
					<td>
						<fmt:formatDate value="${member.regDate}" pattern="yyyy-MM-dd" var="regDate" />
						<!-- userId??를 url로 쓴다고??? -->			
						<%-- <a href="view/${member.userId}?page=${param.page}">${member.userId}</a> --%>
						<a href="view/${member.userId}">${member.userId}</a>
						<c:if test="${todayStr2==regDate}">
							<span class="badge badge-primary">new</span>
						</c:if>
					</td>					
					<td>
					</td>
					<td>${member.email}</td>
					<td>${member.cellPhone}</td>
					<td>${regDate}</td>
				</tr>
			</c:forEach>
		</tbody>		
	</table>
		<div class="text-center mt-4 mb-4">
			<!-- 현재 블록이 1보다 클때 -->
			<c:if test="${pagination.currentBlock > 1}">
				<!-- 첫번째 페이지보기~~ -->
				<a href="list?page=1">처음</a>
				<a href="list?page=${pagination.prevBlockPage}">◀</a>
			</c:if>
				<!-- 시작 페이지와 끝 페이지 -->
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="i">
				<!-- 현재 페이지와 같으면 비링크 -->
				<c:if test="${i==pagination.page}">
					${i}
				</c:if>
				<!-- 다르면 링크 -->
				<c:if test="${i!=pagination.page}">
					<a href="list?page=${i}">${i}</a>
				</c:if>
			</c:forEach>						
				<c:if test="${pagination.currentBlock<pagination.totalBlock}">
					<a href="list?page=${pagination.nextBlockPage}">▶</a>
					<a href="list?page=${pagination.totalPage}">마지막</a>
				</c:if>
		</div>
</body>
</html>