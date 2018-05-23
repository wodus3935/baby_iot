package edu.iot.butter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.iot.butter.dao.TalkDao;
import edu.iot.butter.model.Talk;

@Service
public class TalkServiceImpl implements TalkService {

	@Autowired
	TalkDao dao;

	@Override
	public List<Talk> getTalkList(Talk talk) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectList(talk);
	}

	@Override
	public Talk getTalk(int talkId) throws Exception {
		return dao.selectOne(talkId);
	}

	@Transactional
	@Override
	public boolean create(Talk talk) throws Exception {
		System.out.println("service talk : " +  talk);
		try {
		int insert = dao.insert(talk);
		System.out.println("service insert : " + insert);
		return insert==1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		 return true;
		}

	@Transactional
	@Override
	public boolean send(Talk talk) throws Exception {
		return dao.insert(talk)==1;		
	}

	@Transactional
	@Override
	public boolean delete(int talkId) throws Exception {
		return dao.delete(talkId) ==1;
	}

	@Override
	public List<Talk> getNewTalks(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.getNewTalks(userId);
	}

	@Transactional
	@Override
	public boolean updateCheck(Talk talk) throws Exception {
		// TODO Auto-generated method stub
		return dao.updateCheck(talk)>0;
	}

	@Override
	public List<Talk> selectOneListPerUser(String userId) throws Exception {
		
		return dao.selectOneListPerUser(userId);
	}
	
	
}
