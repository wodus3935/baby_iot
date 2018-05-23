package edu.iot.butter.model;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Diary {
	private int diaryId;
	@NotEmpty(message="제목은 필수항목입니다.")
	private String title;
	@NotEmpty(message="작성자는 필수항목입니다.")
	private String writer;
	@NotEmpty(message="비밀번호는 필수항목입니다.")
	private String password;
	private String content;
	private List<Attachment> attachments; // 첨부 파일 목록
	private Date regDate;
	private Date updateDate;
}
