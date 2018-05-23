package edu.iot.butter.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Talk {
	private int talkId;
	private String userId;
	private String withTalk;
	private int received;//수신여부 0: 발신 , 1: 수신
	private int checked;//확인
	private String message;
	private int newMessages; //신규메세지갯수
	private Date regDate;
}
