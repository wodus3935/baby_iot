package edu.iot.butter.model;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private int replyId; // 댓글 번호
	private int boardId; // 글 그룹(게시글 ID)
	private int replyLevel; // 댓글 수준
	private int parent; // 상위 글 번호
	private String writer; // 작성자 ID
	private String content; // 내용
	private int deleted; // 삭제여부
	private Date regDate;
	private Date updateDate;
}
