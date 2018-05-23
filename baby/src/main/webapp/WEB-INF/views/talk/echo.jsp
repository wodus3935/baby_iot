<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.js">
</script>
<script>
	$(function(){
		//상대경로로 websocket지원 가능
		var socket = new SockJS("echo");
		var userId = '${USER.userId}';
		socket.onopen = function(){
			console.log('접속 성공');
			console.log(userId);
			//접속 후 바로 데이터 전송
			socket.send('나는 자바킹이야 너는 누구니?');
			socket.send('나는 주형이야 전병래 친구지');
			socket.send('너진짜 나쁜아이구나');
			socket.send('술먹자');			
			
		}
		
		socket.onclose = function(){
			console.log('접속 해제');
		}
		
		socket.onmessage = function(msg){
			console.log('데이터 수신 : ', msg.data);
			
			$('#receive-message').append( $(`<h1>\${userId} :  \${msg.data} </h1>`))
			
		}
		
		socket.onerror = function(err){
			console.log('에러  : ', err)
		}
		
		$('#send').click(function(){
			var message = $('#message').val();
			socket.send(message);
		})
	});
</script>

<h1>웹 소켓 test</h1>
<div>
	<input type="text" id="message">
	<button id="send">전송</button>
</div>
<div>
	수신데이터
	<div id="receive-message">
	
	</div>	
</div>