package edu.iot.butter.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Image {	
	private int imageId;
	private String title;
	private String description;
	private String fileName;
	private String NewName; //업로드시 사용할 새로운 이름
	private String thumbNail;
	private	long fileSize;
	private String mimeType;
	private Date regDate;
	

}
