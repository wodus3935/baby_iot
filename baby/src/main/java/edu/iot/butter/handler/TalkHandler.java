package edu.iot.butter.handler;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import edu.iot.butter.model.Member;
import edu.iot.butter.model.Talk;
import edu.iot.butter.service.TalkService;

@Component
public class TalkHandler extends TextWebSocketHandler {
	//동기화 맵 생성
	Map<WebSocketSession, String> sessionMap = Collections.synchronizedMap(new HashMap<>());
	//멤버아이디로 websocketsession을 가져온다.
	Map<String, WebSocketSession> memberMap = Collections.synchronizedMap(new HashMap<>());			

	@Autowired
	TalkService service;

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		String memberId = sessionMap.remove(session);
		memberMap.remove(memberId);
		super.afterConnectionClosed(session, status);
	}

	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Member member = (Member) session.getAttributes().get("USER");
		sessionMap.put(session, member.getUserId());
		
		memberMap.put(member.getUserId(), session);
				
		super.afterConnectionEstablished(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//메시지 수신자 식별 및 처리
		Gson gson = new Gson();
		
		//json으로 받아서 talk형태로 만들어주자
		//Talk.clss는 뭘까용 result를 talk 형태로 만든다 이말인가?
		Talk talk = gson.fromJson(message.getPayload(), Talk.class);
		
		System.out.println("talk에 저장되는 메세지 : "+talk.getMessage());
		System.out.println("토크 : "+talk);
		//전송자의 전송 talk 저장
		service.create(talk);
		
		//System.out.println("talk1 : " + talk);
		
		send(talk, message);	
		
		//System.out.println("talk2 : " + talk);
		
		super.handleTextMessage(session, message);
	}
	
	public void send(Talk talk, TextMessage message) throws Exception{
		WebSocketSession s = memberMap.get(talk.getWithTalk());
		if( s!= null) {//수신자 접속 시 checked 1
			s.sendMessage(message); //메세지 전송
			saveTalk(talk, 1);
		}else {
			saveTalk(talk, 0);
		}
	}
	
	public void saveTalk(Talk talk, int checked) throws Exception {
			//수신자 측 수신 talk 저장
			Talk talk2 = Talk.builder().userId(talk.getWithTalk()).withTalk(talk.getUserId()).checked(checked).received(1).message(talk.getMessage()).build();
			service.create(talk2);			

	}
}
