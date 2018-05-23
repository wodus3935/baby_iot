package edu.iot.butter.model;

import java.util.Date;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@Data
public class Member {
	@NotEmpty(message="아이디를 입력해주시오~")
	@Length(min=4, message="ID는 4글자 이상 입력해주시오~")
	private String userId;
	
	@NotEmpty(message="이름을 입력해주시오~")
	private String name;
	
	@NotEmpty(message="비밀번호를 입력해주시오~")
	@Length(min=4, message="PW는 4글자 이상 입력해주시오~")
	private String password;
	
	private String cellPhone;
	
	@NotEmpty(message="Email은 필수사항이오~")
	@Email(message="eamil형식으로 입력해주세요~")
	private String email;
	private String address;
	private int grade;
	private int newMessages;
	private Date regDate;
	private Date updateDate;
		
}
