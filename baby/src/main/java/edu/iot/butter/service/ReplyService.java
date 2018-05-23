package edu.iot.butter.service;

import java.util.List;

import edu.iot.butter.model.Reply;

public interface ReplyService {
	
	List<Reply> getList(int boardId) throws Exception;
	
	Reply get(int replyId) throws Exception;
	
	Reply create(Reply reply) throws Exception;
	
	Reply update(Reply reply) throws Exception;
	
	boolean delete(int replyId) throws Exception;
		
}
