<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib tagdir="/WEB-INF/tags/util" prefix="iot"%>
<body>
	<h2 class="mt-5 mb-4">게시글 목록</h2>
	<div class="text-right">
		(총 ${pagination.totalCount}건/
		<a href="create"><i class="fa fa-plus"></i>추가</a>)
	</div>
	
	<table class="table table-stripped">
		<thead>
			<tr>
				<th style="width:60px">No</th>
				<th>제목</th>
				<th style="width:100px">작성자</th>
				<th style="width:90px">조회수</th>
				<th style="width:120px">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list}" varStatus="status">
				<tr>
					<td>${board.boardId}</td>
					<td>
					<a href="view/${board.boardId}">${board.title}</a>
					</td>
					<td>${board.writer}</td>
					<td>${board.readCnt}</td>					
					<td>
						<fmt:formatDate value="${board.regDate}" pattern="yyyy-mm-dd" />
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<iot:pagination pagination="${pagination}" link="list"/>
</body>
