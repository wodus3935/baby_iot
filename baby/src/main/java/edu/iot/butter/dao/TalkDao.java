package edu.iot.butter.dao;

import java.util.List;

import edu.iot.butter.model.Talk;

public interface TalkDao {
	int getCount(Talk talk) throws Exception;
	Talk selectOne(int talkId) throws Exception;
	List<Talk> selectList(Talk talk) throws Exception;
	List<Talk> getNewTalks(String userId) throws Exception;
	int insert(Talk talk) throws Exception;
	int delete(int talkId) throws Exception;
	int updateCheck(Talk talk) throws Exception;
	List<Talk> selectOneListPerUser(String userId) throws Exception;
}
