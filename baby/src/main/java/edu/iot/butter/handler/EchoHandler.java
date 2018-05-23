package edu.iot.butter.handler;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import edu.iot.butter.model.Member;

@Component
public class EchoHandler extends TextWebSocketHandler {
	
	//접속 끉키고나서~
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Member member = (Member) session.getAttributes().get("USER");
		if(member != null) {
			System.out.println(member.getUserId() + "해제");
		}else {
			System.out.println(" 해제");
		}
		
		super.afterConnectionClosed(session, status);
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		Member member = (Member) session.getAttributes().get("USER");
		
		if(member != null) {
			System.out.println(member.getUserId() + "접속");
		}else {
			System.out.println(" 접속");
		}
		super.afterConnectionEstablished(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		System.out.println(message);
		
		//메시지 전송 : echo
		
		session.sendMessage(message);
		
		super.handleTextMessage(session, message);
	}
}
