package edu.iot.butter.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.iot.butter.dao.AvataDao;
import edu.iot.butter.dao.MemberDao;
import edu.iot.butter.exception.LoginFailException;
import edu.iot.butter.model.Avata;
import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.model.Password;
import edu.iot.butter.utill.ImageUtil;

@Service
public class MemberServiceImpl implements MemberService {

	// 멤버다오 형태로 인스턴스가 만들어져있고(스캐너가 만들어줌), 그 DAO의 빈을 만들어줌
	@Autowired
	MemberDao dao;
	
	@Autowired
	AvataDao avataDao;
	
	@Override
	public Member checkLogin(Login login) throws Exception {

		Member member = dao.selectOne(login.getUserId());
		
		if (member!=null) {
			if (member.getPassword().equals(login.getPassword())) {
				return member;
			}else {
				throw new LoginFailException("사용자 비밀번호가 일치하지 않네요");
			}
		}else {		
			throw new LoginFailException("사용자 ID가 없습니다.");		
		}
	}

	@Override
	public Boolean CheckId(String id) throws Exception {
			Member member = dao.selectOne(id);
			//Id가 있을때 true 없을때 false
			return member != null;
	}
	
	@Transactional
	@Override
	public Boolean create(Member member) throws Exception {
		int result = dao.insert(member);
		return result==1;
	}
	
	@Transactional
	@Override
	public Boolean update(Member member) throws Exception {
		int result = dao.update(member);
		return result==1;
	}

	@Override
	public Member getMember(String userId) throws Exception {
		Member member = dao.selectOne(userId);
		return member;
	}
	
	@Transactional
	@Override
	public Boolean changePassword(Password password) throws Exception {
		int result = dao.changePassword(password);
		return result==1;
	}

	@Transactional
	@Override
	public Boolean updateByAdmin(Member member) throws Exception { 
		return dao.updateByAdmin(member)==1;
	}
	
	@Transactional
	@Override
	public Boolean changePasswordByAdmin(Password password) throws Exception {
		// TODO Auto-generated method stub
		return dao.changePasswordByAdmin(password)==1;
	}
	
	@Override
	public Pagination getPagination(int page) throws Exception {
		int total = 1000; //dao.getCount();
		return new Pagination(page, total);
	}

	@Override
	public List<Member> getList(Pagination pagination) throws Exception {
		
		return dao.selectList(pagination);
	}

	@Override
	public byte[] getAvata(String userId)  {
		try {
			
				Avata avata = avataDao.selectOne(userId);
				//avata가 없는 경우 디폴트 아바타 입력
				if(avata == null) {
					avata = avataDao.selectOne("anonymous");
				}		
				return avata.getImage();
				
		}catch(Exception e) {
			
				e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public boolean insertAvata(Avata avata) throws Exception {
		//avata 이미지 세팅
		try {
			avata.setImage(ImageUtil.makeThumb(avata.getImage()));		
			return avataDao.insert(avata)==1;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return true;
		
	}

	@Override
	public boolean updateAvata(Avata avata) throws Exception {
		avata.setImage(ImageUtil.makeThumb(avata.getImage()));
		System.out.println(avata);
		if(avataDao.update(avata)==1) {
			return true;
		} else {
			//존재하지 않는 경우
			return avataDao.insert(avata) == 1;
		}
	}

	@Override
	public boolean deleteAvata(String userId) throws Exception {
		
		return avataDao.delete(userId)==1;
	}

	@Override
	public List<Member> getListWithMessages(String userId) throws Exception {
		
		return dao.selectListWithMessages(userId);
	}
}
