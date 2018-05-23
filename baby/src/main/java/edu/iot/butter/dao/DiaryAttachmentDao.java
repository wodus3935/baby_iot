package edu.iot.butter.dao;

import java.util.List;

import edu.iot.butter.model.Attachment;
import edu.iot.butter.model.DiaryAttachment;

public interface DiaryAttachmentDao {

	DiaryAttachment selectOne(int arttachmentId) throws Exception;
	
	List<DiaryAttachment> selectList(int diaryId) throws Exception;
	
	int insert(DiaryAttachment diaryAttachment) throws Exception;
	
	int delete(int attachmentId) throws Exception;
	
	int deleteByDiaryId(int diaryId) throws Exception;
}
