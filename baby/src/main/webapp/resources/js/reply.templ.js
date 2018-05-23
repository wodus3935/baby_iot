/**
 * 
 */

var replyTempl = {
		//댓글추가
		replyAddTempl : `
			<div class="card card-body p-2">
				<h6 class="card-title">댓글 쓰기</h6>
				<textarea id="reply-content" class="card-text" row="4"></textarea>
				<div class="flex-row text-right">
					<a id="reply-add" class="card-link btn btn-primary btn-sm">
					<i class="fa fa-share-square"></i> 등록</a>
				</div>
			</div>
		
		`,
		
		//미디어 오브젝트로 댓글 보여주기 
		mediaObjectTempl : function(reply, writer){
			var obj = $(`
			<div class="media d-block d-md-flex mt-3" data-reply-id="${reply.replyId}" data-reply-level="${reply.replyLevel}">
			
			<img class="d-flex mb-3 mx-auto avatar rounded-circle“ width="80" src="/butter/member/avata?userId=${reply.writer}">
			
				<div class="media-body text-center text-md-left ml-md-3 ml-0">
						<div style="overflow:hidden">
						  <h5 class="mt-0 font-weight-bold float-left"> ${reply.writer}</h5>
						  <div class="buttons float-right ml-3"></div>
						  <div class="float-right">작성일:${reply.regDate}</div>
						</div>
						<div class="reply-content">${reply.content}</div>
						<div class="work"></div>
						<div class="children"></div>
				</div>
			</div>`);
			//로그인 사용자에 따라 버튼의 종류 구분하여 추가.
			this.buttonsTempl(obj, reply, writer);
			return obj;
			
		},
		
		buttonsTempl : function(item, reply, writer){
			
			//삭제 글이 아닌 경우
			if(!reply.deleted){
				//로그인 사용자인 경우 댓글버튼 추가
				if(writer != ''){
					item.find('.buttons').append('<button class="reply-add-show"><i class="fa fa-reply"></i></button>')
				}
				//자신이 작성한 댓글인 경우 수정 버튼과 삭제 버튼 추가
				if(reply.deleted==0 && reply.writer==writer){
					item.find('.buttons').append('<button class="reply-edit-show"><i class="fa fa-edit"></i></button>'+
							'<button class="reply-delete"><i class="fa fa-trash"></i></button>');
				}
			} else	{ //삭제된 댓글
				item.addClass('deleted-reply')
			}
		},
		
		//추가 버튼 
		addTempl : `
			<textarea></textarea>
			<button class="reply-add">
			<i class="fa fa-share-square"></i></button>
			<button class="reply-cancel">
			<i class="fa fa-undo"></i></button>`,
			
		editTempl : `
			<textarea></textarea>
			<button class="reply-edit"><i class="fa fa-share-square"></i></button>
			<button class="reply-edit-cancel"><i class="fa fa-undo"></i></button>
		`,
		
}