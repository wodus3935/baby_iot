<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<c:url value="/" var="root" />

<script>
var api = "${root}api/reply/";
var boardId = ${board.boardId};
var replyId;
function getCount(){
	$.get(api+'getCount', {boardId : boardId}, function(result){
		console.log('첫댓글 갯수 : ' + result);		
		$('.count').empty();
		$('.count').append('댓 글   ' + result);
	})	
}

//수정 폼 출력
function updateForm(replyId, textForm) {
	   console.log(replyId);
	      var form = 
	        `
	        <div><textarea class="ET"></textarea></div>
	        <div>
	           <a class="editText"><i class="fa fa-edit"></i></a>
	     	</div>
	        `
	        //console.log(textForm);
	       textForm.empty();
	       textForm.append(form);
	}

//대댓글 리스트 출력
function childList(replyId, replyList) {
	
	console.log(replyId);
	console.log()
	
	var data = {			
			replyId : replyId
	}
	
	$.get({
		url :  api+'childList',
		data,
		success : function(data){
					
					console.log(data);
			/* 		$.each(data, function(index, item){
						table = `
										<td></td>
										<td>${item.replyWriter}  ${item.replyContent}</td>
								`
						$('.reReplyList').children('reReply').append(table);
					}) */
					replyList.empty();
			
					data.forEach(function(item,ix){
						console.log(item.replyContent);
						var table = `									
										<div style="margin-left:10%">										
											<div style="color : red;">\${item.replyWriter} \${item.replyContent}</div>									
										</div>	

							`;
							
						//replyList.append(table);
						replyList.prepend(table);
					})
					
					
				}	
	})

			
}

//첫댓글 출력
function list() {
	
	$.get(api+'replyList' ,
		{boardId : boardId} ,
		function(data){//배열이다.

		console.log(data);

		$.each(data, function(index, item){
		
		table =			
			`<div style="margin-left:5%; width:700px">
				<div class="replyList">
					<span style="color:blue; margin-top:10%">\${item.replyWriter}</span>
					<div style="margin-left:10%">\${item.replyContent}</div>
					<div style="font-size:15px;">\${item.replyRegDate}</div>
					<span style="margin:70%; display:inline">
					
					<a class="edit" data-reply-id="\${item.replyId}" data-writer-id="\${item.replyWriter}"><i class="fa fa-edit"></i></a>
					<a class="delete-btn" data-reply-id="\${item.replyId}" data-writer-id="\${item.replyWriter}"><i class="fa fa-trash"></i></a></td>
					
				</span>					
			
				<div>
					<div></div>
					<div><button class="reReplyBtn" data-id="\${item.replyId}">대댓글<i class="fa fa-caret-down"></i></button></div>
				</div>
				
				<div style="display:none">
				
				</div>				
				<div class="reReplyForm" style="display:none">
					<div></div>
					<div>					
					<textarea class="reReplyCtt" name="reReplyCtt" class="form-control z-depth-1" rows="3" cols="80" placeholder="내용을 입력해주세요" ></textarea>
					<button class="reReplyAdd" data-rere-id="\${item.replyId}" >댓글 등록</button>								
					</div>
				</div>
			</div>
			`
		
		$("#replyList").append(table);
			//$("#replyList").prepend(table);
		});	
	
		getCount();
	})
}


//이것은 document가 load되었을때 먼저 실행이 되기 때문에 먼저 된다.
$(function(){
	
	var sensor_values;
	var table;
	//boardid를 프로퍼티에 설정하여 보내준다.
	
	list();
	
	//댓글 추가
	$('#add').click(function(e){
		
		var data={
				replyWriter : $('#replyWriter').val(),
				replyContent : $('#replyContent').val(),
				boardId : ${board.boardId},
				parentId : 0,
				depth : 0
		}
		
		$.ajax({
			url : api,
			type : 'post',
			data : JSON.stringify(data),
			contentType : 'application/json',
			success : function(result){
				console.log("댓글을 데이터베이스에 넣었네요! result : " + result);
				$("#replyList").empty();				
				$("#replyContent").val("");      //야매
				getCount();
				list();				
			}
		})
	})
	
 $('#replyList').on('click','.edit',function(){
      var textForm = $(this).parent().prev().prev();
       replyId = $(this).data("reply-id"); 
      var replyWriter = $(this).data("writer-id");
       //console.log('이 댓글의 아이디 1 : ' + $(this).data('writer-id'));
      console.log('replyId : ' + replyId);
      //console.log(textForm);
      //console.log("되니");
       
       data={
                replyId : replyId,
                  replyWriter : $('#replyWriter').val(),
                  replyContent : $('.content').val(),
                  boardId : ${board.boardId}
            };
        
       console.log(data.replyContent);
      $.ajax({
         url : api + 'form',
         //url : api + {boardId},
         type : 'get',
         data : data,
         success : function(result) {
        	console.log('이 댓글의 아이디 : '+ replyWriter);
        	console.log('접속 아이디 : ' + data.replyWriter);
        	
        	if(data.replyWriter != replyWriter){
         		alert('수정 권한이 없습니다.')
           	}else{
           		updateForm(data.replyId, textForm);
           	 	$("#replyContent").val("");
           	}     	           

            
            //alert("되니");
            //$("#replyList").empty();
             //$("#replyList").append(table);
            
         }
      })
      
   })
   
   $('#replyList').on('click','.editText',function(){
      
      var textForm2 = $(this).parent().prev();
      console.log(textForm2);
       
       data={
            replyId : replyId,
            replyWriter : $('#replyWriter').val(),
               replyContent : $('.ET').val(),
               boardId : ${board.boardId}
            }
        
       console.log( $('.content').val());
      $.ajax({
         url : api,
         //url : api + {boardId},
         type : 'put',
         data : JSON.stringify(data),
         contentType : 'application/json',
         success : function(result) {
            console.log(data);
             $("#replyList").empty();
             list();
         }
      })
      
   })    
   
   //로그인 됐을때만 댓글입력
 $('#replyContent').click(function(e){
	 
      if(!"${USER.userId}"){
      var check=confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?");
      if(check){
         location.href= "${root}/login";   
      }
    }
   })
	
   //댓글 지우기
   
   $('#replyList').on('click', '.delete-btn', function(){
       replyId = $(this).data("reply-id");
       var replyWriter = $(this).data("writer-id");
       console.log('1'+replyWriter);
       console.log('2'+$('#replyWriter').val());
        
       $.ajax({
           url : "${root}api/reply/" + replyId,
           type : 'delete',        
           success : function(result) {
        	   
  			if(replyWriter == $('#replyWriter').val()){
  				
  				if (result==1) {          //삭제 성공시
  	                 console.log(this);   //this는 ajax 태그 
  	                 $("#replyList").empty();   
  	                 list();
  	               }
  				
  			}else{
  				alert('구현중..');
  				list();
  			}	
              
          }
       });      
       // url : '~/' + replyId
       // ajax type은 delete
    })

		
	//대댓글 추가
	$('#replyList').on('click','.reReplyAdd',function(){
		//console.log("눌리니");
		console.log($('#replyWriter').val());
		console.log($(this).siblings('.reReplyCtt').val());
		console.log($(this).data('rere-id'));
		console.log(${board.boardId});
		
		var data={
				replyWriter : $('#replyWriter').val(),
				replyContent : $(this).siblings('.reReplyCtt').val(),
				parentId : $(this).data('rere-id'),
				boardId : ${board.boardId}
		}
		
		$.ajax({
			url : api,
			type : 'post',
			data : JSON.stringify(data),
			contentType : 'application/json',
			success : function(result){				
				console.log("대댓글을 데이터베이스에 넣었네요! result : " + result);
				
				$("#reReplyList").empty();
				//list();
				
				//var listLocation=$(this).parent().parent();
				//replyId=$(this).data('rere-id');
				//childList(listLocation,replyId);
			}
		})		
	})
	
		//대댓글 리스트
	$('#replyList').on('click','.reReplyBtn',function(){
		//console.log("눌렸니");
		//console.log($(this).parent().parent().next());
		console.log($(this).data('id'));
		var replyList = $(this).parent().parent().next();
			replyId = $(this).data('id');
		var replyLocation = replyList.next();
		childList(replyId, replyList);
		replyList.toggle();
		replyLocation.toggle();
	})
	
	//댓글 갯수 구하기
	

});

            
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

<!-- <button id="edit">수정</button>
<button id="delete" data-target="5">삭제</button> -->

<!-- Grid row -->
<div class="row">
	<p>
	<div class="form-group basic-textarea rounded-corners ml-5 mb-4">
		<input type="hidden" id="replyWriter" name="replyWriter" value="${USER.userId}">
	</div>

	<div>
		<textarea id="replyContent" name="replyContent"
			class="form-control z-depth-1" rows="3" cols="80" placeholder="내용을 입력해주세요"></textarea>
		<button id="add">댓글 등록</button>
	</div>
	</p>
</div>
<br>
<span class="count" style="margin-left : 5%; margin-top : 5%" ></span>
<!-- Grid column -->

<hr />
<div class="table table-striped" >	
	<div id="replyList">
	</div>
</div>

</div>

