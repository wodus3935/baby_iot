package edu.iot.butter.service;

import java.util.List;

import edu.iot.butter.model.Talk;

public interface TalkService {

	List<Talk> getTalkList(Talk talk) throws Exception;
	
	Talk getTalk(int talkId) throws Exception;
	
	boolean create(Talk talk) throws Exception;
	
	boolean send(Talk talk) throws Exception;
	
	boolean delete(int talkId) throws Exception;
	
	List<Talk> getNewTalks(String userId) throws Exception;
	
	boolean updateCheck(Talk talk) throws Exception;
	
	List<Talk> selectOneListPerUser(String userId) throws Exception;
	
}
