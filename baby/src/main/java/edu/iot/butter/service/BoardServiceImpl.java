package edu.iot.butter.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.iot.butter.dao.AttachmentDao;
import edu.iot.butter.dao.BoardDao;
import edu.iot.butter.dao.ReplyDao;
import edu.iot.butter.model.Attachment;
import edu.iot.butter.model.Board;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.model.Reply;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao dao;
	
	@Autowired
	AttachmentDao attachmentDao;
	
	@Autowired
	ReplyDao replyDao;

	@Override
	public Pagination getPagination(int page) throws Exception {
		int total = dao.getCount();
		Pagination pagination = new Pagination(page, total);
		return pagination;
	}

	@Override
	public List<Board> getList(Pagination pagination) throws Exception {

		return dao.selectList(pagination);
	}
	
	@Transactional
	@Override
	public Board getBoard(int boardId) throws Exception {
		//조회수 증가
		dao.increaseReadCnt(boardId);
		Board board = dao.selectOne(boardId);
		//조인을 대신해준다.
		board.setAttachments(attachmentDao.selectList(boardId));
		
		return board;
	}
	
	@Transactional
	@Override
	public boolean create(Board board, List<MultipartFile> fileList) throws Exception {
		int result = dao.insert(board);
		//userGeneratedKeys에 의해서 boardId가 전달이된다.		
		upload(board.getBoardId(), fileList);
		return result==1;
	}


	@Transactional
	@Override
	public boolean update(Board board, List<MultipartFile> fileList) throws Exception {
		int result = dao.update(board);
		upload(board.getBoardId(), fileList);
		
		return result==1;
	}
	
	@Transactional
	private boolean upload(int boardId, List<MultipartFile> fileList) throws Exception {
		int result=0;
		for(MultipartFile file : fileList) {
			if(!file.isEmpty()) {
				Attachment attachment = save(boardId, file);
				result = attachmentDao.insert(attachment);
			}
		}		
		return result==1;		
	}
	
	
	public Attachment save(int boardId, MultipartFile file) throws Exception {
		Attachment attachment = new Attachment();
		long fileNo = System.currentTimeMillis();		
		String fname = file.getOriginalFilename();
		String newName = fileNo + "_" +fname;
		String path = "c:/temp/upload/" + newName;
		file.transferTo(new File(path));
		return new Attachment(boardId, fname, newName);
	}

	@Override
	public Attachment getAttachment(int attachmentId) throws Exception {
		return attachmentDao.selectOne(attachmentId);
	}
	
	@Transactional
	@Override
	public boolean deleteAttachment(int attachmentId) throws Exception {
		return attachmentDao.delete(attachmentId)==1;
	}
	
	@Transactional
	@Override
	public boolean deleteByUser(int boardId) throws Exception {
		Board board = dao.selectOne(boardId);
		return dao.deleteByUser(board)==1;
	}
	
	@Transactional
	@Override
	public boolean delete(int boardId) throws Exception {		
		return dao.delete(boardId)==1;
	}
	
}
