<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<script src="<c:url value="/resources/js/rest.js"/>"></script>
<script src="<c:url value="/resources/js/reply.templ.js"/>"></script>
<script src="<c:url value="/resources/js/reply.js"/>"></script>
<c:url value="/" var="root" />
<c:url value="/api/reply/${board.boardId}" var="apiUrl" />
<script>


var api = new Rest('${apiUrl}');

$(function(){
	
	var opt ={
			api : api,					//ajax 통신 지원 객체
			boardId : ${board.boardId},	//현재 게시글
			writer : '${USER.userId}',	//신규 댓글 작성자 id
			replyList : $('#reply-list') //댓글 목록			
	};
	
	//reply prototype에 option 넣기(글쓰기 폼)
	$('#reply-board').replyBoard(opt);
	$('#reply-list').replyList(opt);
})

            
</script>
<div class="mt-5 mb-4">게시글 보기</div>

<div class="row">
	<div class="col-md-2">제목</div>
	<div class="col-md-10">${board.title}</div>
</div>

<div class="row">
	<div class="col-md-2">작성자</div>
	<div class="col-md-10">${board.writer}</div>
</div>

<div class="row">
	<div class="col-md-2">조회수</div>
	<div class="col-md-10">${board.readCnt}</div>
</div>

<div class="row">
	<div class="col-md-2">첨부파일</div>
	<div class="col-md-10">
		<c:forEach var="file" items="${board.attachments}">
			<div>
				<a href="../download/${file.attachmentId}"> <i
					class="fa fa-download"></i> ${file.fileName}
				</a>
			</div>
		</c:forEach>
	</div>
</div>
<div class="row">
	<div class="col-md-2">작성일</div>
	<div class="col-md-10">
		<fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" />
	</div>
</div>
<div class="row">
	<div class="col-md-2">수정일</div>
	<div class="col-md-10">
		<fmt:formatDate value="${board.updateDate}" pattern="yyyy-MM-dd" />
	</div>
</div>
<hr />
<div>${board.content}</div>
<div class="text-center">
	<c:if test="${USER.userId==board.writer||USER.grade==0}">
		<a href="../edit/${board.boardId}" class="mr-4"><i
			class="fa fa-edit mr-2"></i>수정</a>
		<a href="../delete/${board.boardId}" class="mr-4"><i
			class="fa fa-trash mr-2"></i>삭제</a>
	</c:if>
	<a href="javascript:history.back()"><i class="fa fa-undo mr-2"></i>목록보기</a>
</div>

<!-- 댓글쓰기영역 -->
<c:if test="${not empty USER.userId}">
	<div id="reply-board"></div>
</c:if>

<!-- 댓글 목록 영역 -->
<div id="reply-list"></div>

<!-- <button id="edit">수정</button>
<button id="delete" data-target="5">삭제</button> -->


