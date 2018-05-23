package edu.iot.butter.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;

@Data
public class Password {
	@NotEmpty(message="사용자 ID는 필수항목입니다.")
	private String userId;
	
	@NotEmpty(message="새로운 비밀번호는 필수항목입니다.")
	@Length(min=4, message="비밀번호는 4자리이상 이에요~")
	private String newPassword;
	
	@NotEmpty(message="이전 비밀번호는 필수항목입니다.")
	@Length(min=4, message="비밀번호는 4자리이상 이에요~")
	private String oldPassword;
}
