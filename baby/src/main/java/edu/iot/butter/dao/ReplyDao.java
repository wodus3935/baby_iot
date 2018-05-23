package edu.iot.butter.dao;

import java.util.List;

import edu.iot.butter.model.Reply;

public interface ReplyDao {
	
	int getCount(int boardId) throws Exception;
	
	Reply selectOne(int replyId) throws Exception;
	
	List<Reply> selectList(int boardId) throws Exception;
	
	int insert(Reply reply) throws Exception;
	
	int update(Reply reply) throws Exception;
	
	int delete(int replyId) throws Exception;
}
