package edu.iot.butter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.iot.butter.dao.ReplyDao;
import edu.iot.butter.model.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyDao dao;

	@Override public List<Reply> getList(int boardId) throws Exception{
			return dao.selectList(boardId);
		}
	
	@Override public Reply get(int replyId) throws Exception {
			return dao.selectOne(replyId);
		}
	

	@Transactional
	@Override
	public Reply create(Reply reply) throws Exception {
		dao.insert(reply);
		return dao.selectOne(reply.getReplyId());
	}
	
	@Transactional
	@Override
	public Reply update(Reply reply) throws Exception {
		dao.update(reply);
		return dao.selectOne(reply.getReplyId());
	}
	
	@Transactional
	@Override
	public boolean delete(int replyId) throws Exception {
		return dao.delete(replyId)==1;
	}
	
}
