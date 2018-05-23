package edu.iot.butter.model;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Login {
	
	@NotEmpty(message="아이디를 입력해주세요")
	private String userId;
	
	@NotEmpty(message="비밀번호를 입력해주세요")
	private String password;
	
	private String url;
}
