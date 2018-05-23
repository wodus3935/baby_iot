package edu.iot.butter.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Attachment {
	private int attachmentId; 
	private int boardId;	  //게시글 ID
	private String fileName;  //원본 파일명 
	private String location;  // 서버에서  파일명
	private Date reg_date;	 //등록일
	
	public Attachment(int boardId, String fileName, String location) {
		super();
		this.boardId = boardId;
		this.fileName = fileName;
		this.location = location;
	}
	
}
