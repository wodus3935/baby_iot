var talkTempl = {
		sendTempl : function(msg){
			// d-flex는 자동으로 크기를 맞춰준다.
			return `
			<div class="media my-1">
				<img src="/butter/member/avata?userId=${msg.userId}" class="d-flex mr-3 rounded-circle avata-small">
				<div class="media-body text-left ml-3 mr-5">
					<div class="small">${msg.regDate}</div>
					<div class="talk-message send-message">${msg.message}</div>
				</div>
			</div>`;		
			
		},

	receiveTempl : function(msg) {
		
		return `
		<div class="media my-1">
			<div class="media-body text-right mr-3 ml-5">
				<div class="small">${msg.regDate}</div>
					<div class="talk-message receive-message">${msg.message}</div>
				</div>
			<img src="/butter/member/avata?userId=${msg.withTalk}" class="d-flex mr-3 rounded-circle avata-small" >
		</div>`;
		
	}
}

class Talk {
	constructor(opt){
		this.opt = opt;
		
		// 웹 소켓 접속
		this.socket = new SockJS(this.opt.url + '/talk');
		
		// 이벤트 핸들러를 Talk 객체의 프로토타입 메서드로 설정
		// 호출된 이벤트 핸들러내에 this를 현재 인스턴스로 바인딩
		this.socket.onopen = this.onopen.bind(this);
		this.socket.onmessage = this.onmessage.bind(this);
		this.socket.onclose = this.onclose.bind(this);
		this.socket.onerror = this.onerror.bind(this);
		
		$.get(opt.url + '/talkList', {
			userId : this.opt.userId,
			withTalk : this.opt.withTalk
		}, this.initMessage.bind(this));
	}
	
	initMessage(messages){
		var self = this;
		messages.forEach(function(msg){
			msg.regDate = new Date(msg.regDate);
			if(msg.received==1){// 수신데이터
				self.opt.panel.append(talkTempl.receiveTempl(msg));				
			}else{// 전송데이터
				console.log("전송데이터  : " + msg);				
				self.opt.panel.append(talkTempl.sendTempl(msg));
			}			
		});
		
		// 맨아래로 스크롤 내리겠다.
		self.opt.panel.parent().scrollTop(self.opt.panel.height());
	}
	
	// 접속 성고 이벤트 핸들러
	onopen(){
		console.log('접속 성공');
	}
	
	// 접속 해제 이벤트 핸드러
	onclose(){
		console.log('접속 해제');
	}
	
	// 에러 이벤트 핸들러
	onerror(e){
		console.log('에러', e)
	}
	
	// 메시지 수신 템플릿 추가
	onmessage(msg){
		this.opt.panel.append(talkTempl.receiveTempl(msg));
		this.opt.panel.parent().scrollTop(this.opt.panel.height());
	}
	
	// 전송 메시지 템플릿 추가
	addSendTempl(msg){
		this.opt.panel.append(talkTempl.sendTempl(msg));
		this.opt.panel.parent().scrollTop(this.opt.panel.height());
	}
	
	// 메시지 전송
	send(message){
		
		var msg = {
				userId : this.opt.userId,
				withTalk : this.opt.withTalk,
				received : 0,
				message : message,
				checked : 1
		};
		
		console.log('send', JSON.stringify(msg));
		
		this.socket.send(JSON.stringify(msg));
		
		msg.regDate = new Date();
		
		return msg;
	}
	
}

// talk플러그인 정의
$.fn.talk = function(opt){
	opt = $.extend(opt, {panel: this}); // 메시지 출력 엘리먼트 설정
	var talk = new Talk(opt);
	
	function send() {
		var message = opt.sendMessage.val();		
		
		if(message.trim() == '') return; // 메세지가 없는 경우 취소		
		
		var msg = talk.send(message); // 메시지 전송
		
		console.log('regDate : '+msg.regDate);
		
		talk.addSendTempl(msg);			// 전송 Talk 화면 출력
		
		opt.sendMessage.val(' ').focus(); // 전송 메시지 입력창 지움
	}
	
	// 전송 버튼 이벤트 핸들러
	opt.sendBtn.click(send);
	
	//메시지 작성 input element의 엔터 처리
	opt.sendMessage.keypress(function(e){
		if(e.keyCode == 13){
			send();
		}
	})
}
