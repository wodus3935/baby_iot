package edu.iot.butter.service;

import static org.mockito.Matchers.intThat;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.iot.butter.dao.DiaryAttachmentDao;
import edu.iot.butter.dao.DiaryDao;
import edu.iot.butter.model.Attachment;
import edu.iot.butter.model.Diary;
import edu.iot.butter.model.DiaryAttachment;
import edu.iot.butter.model.Pagination;

public class DiaryServiceImpl implements DiaryService {
	
	@Autowired
	DiaryDao dao;
	
	@Autowired
	DiaryAttachmentDao diaryAttachmentDao;	
	
	
	@Override
	public Pagination getPagination(int page) throws Exception {
		int total = dao.getCount();
		Pagination pagination = new Pagination(page, total);
		return pagination;
	}

	@Override
	public List<Diary> getList(Pagination pagination) throws Exception {
		
		return dao.selectList(pagination);
	}
	
	
	@Override
	public Diary getDiary(int diaryId) throws Exception {
		// TODO Auto-generated method stub
		Diary diary = dao.selectOne(diaryId);
		
		return diary;
	}

	@Transactional
	@Override
	public boolean create(Diary diary, List<MultipartFile> fileList) throws Exception {
		int result = dao.insert(diary);
		upload(diary.getDiaryId(), fileList);
		return result==1;
	}
	
	//파일 업로드
	@Transactional
	private boolean upload(int diaryId, List<MultipartFile> fileList) throws Exception {
		int result=0;
		for(MultipartFile file : fileList) {
			if(!file.isEmpty()) {
				//데이터 베이스에 넣자
				DiaryAttachment attachment = save(diaryId, file);
				result = diaryAttachmentDao.insert(attachment);
			}
		}		
		return result==1;	
	}
	
	//서버에 저장할 새로운 이름 만들기
	public DiaryAttachment save(int diaryId, MultipartFile file) throws Exception{
		//파일이름 앞에 번호는 현재시각으로
		long fileNo = System.currentTimeMillis();
		String fname = file.getOriginalFilename();
		//새로운 이름으로 바꾸기
		String newName = fileNo + "_"+ fname;
		String path = "c:/temp/upload/" + newName;
		file.transferTo(new File(path));
		return new DiaryAttachment(diaryId, fname, newName);
	}

	@Override
	public boolean update(Diary diary, List<MultipartFile> fileList) throws Exception {
		int result = dao.update(diary);
		upload(diary.getDiaryId(),fileList);
		return result==1;
	}

	@Override
	public boolean delete(int diaryId) throws Exception {
		
		
		return dao.delete(diaryId)==1;
	}

	@Override
	public DiaryAttachment getAttachment(int attachmentId) throws Exception {
		
		return diaryAttachmentDao.selectOne(attachmentId);
	}

	@Override
	public boolean deleteAttachment(int attachmentId) throws Exception {
		
		return diaryAttachmentDao.delete(attachmentId)==1;
	}

}
