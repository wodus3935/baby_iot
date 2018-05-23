<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<c:url value="/resources/bower_components/tinymce/tinymce.min.js"
var="tinymce"/>
<script src="${tinymce}"></script>

<script>
	$(function(){
		tinymce.init({
			selector : 'textarea',
			height : "300"
		});
		
		
		//e는 이벤트 객체 
		$('.attachment').click(function(e){
			e.preventDefault();
			//실제로 이벤트를 발생시키는 녀석 this
			var attachmentId = $(this).data('target')
			console.log("attachmentID : " + attachmentId);
			
			//상관은 없지만 폼내용을 한번 전달해보자~
			//폼을 ajax로 post할때 데이터 추출 메서드
			var data = $('#board').serialize();
			//data 값을 ajax 메서드의 data 필드에 지정
			console.log("formdata from board : "+data)
			
			//누른값의 부모가져오기 (지금은 a태그를 감싸고 있는 부모인 div를 의미한다.)
			var parent = $(this).parent();
			
			$.ajax({
				url:'../delete_attachment/'+attachmentId,
				type : 'delete',
				//data : data, 이것들을 전달할때는 put이나 post가 되야한다.
				success : function(result){//result는 컨트롤러가 내놓은 return값이다. 타입은 알아서 해석
					if(result){//boolean type이니 json으로 달라는 것이다.
						console.log(this); //이때의 this는 ajax를 의미한다.
						parent.remove();
					}else{
						alert('첨부 파일 삭제 실패');
					}
				}
			})
			
		})
	})
</script>

<h2 class="mt-5 mb-4">게시글 수정</h2>

<form:form commandName="board" enctype="multipart/form-data">
	<!-- 게시글 id와 작성자는 숨겨서 전달 -->
	<form:hidden path="boardId"/>
	<form:hidden path="writer"/>
	<div class="md-form">
		<label for="title">제목</label>
		<form:input path="title" required="required"/>
		<form:errors path="title" />
	</div>
	
	<div class="md-3">
		<label>작성자 : ${board.writer}</label>		
	</div>
	
	<div class="md-form">
		<label for="password">비밀번호</label>
		<form:password path="password" required="required" />
		<form:errors/>
	</div>
	
	<div class="row">
		<div class="col-md-2">첨부파일</div>
		<div class="col-md-5">
			<c:forEach var="file" items="${board.attachments}">
				<div>
					${file.fileName}
					<a class=attachment href="#" data-target="${file.attachmentId}">						
						<i class="fa fa-trash"></i>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<!-- 파일첨부버튼 -->
		
	<div>
		<label>파일첨부</label>
		<input type="file" name="files" multiple="multiple">
	</div>
	
	<!-- 게시글 내용 -->
	<form:textarea path="content"/>	
	<div class="text-center mt-3">
		<button type="submit" class="btn btn-primary btn-md"><i class="fa fa-check mr-2"></i>확인</button>
		<a href="javascript:history.back()" class="btn btn-primary">돌아가기</a>
	</div>
</form:form>
