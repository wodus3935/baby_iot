package edu.iot.butter.dao;

import java.util.List;

import edu.iot.butter.model.Member;
import edu.iot.butter.model.Password;

//BaseDao는
public interface MemberDao extends BaseDao<Member,String> {
	
/*	//페이지네이션 할때 총 페이지를 구할 메서드! ->basedao에 저장해놓고 두고두고 쓰자~~
	int getCount() throws Exception;
	
	List<Member> selectList(Map map) throws Exception;
	
	Member selectOne(String userId) throws Exception;
	
	int insert(Member member) throws Exception;
	
	int update(Member member) throws Exception;
	
	int delete(String userId) throws Exception;*/
	
	//int search(String owner, String keyword) throws Exception;
	
	int changePassword(Password password);
	
	List<Member> selectListWithMessages(String userId);
	
	//관리자 호출 메서드
	int updateByAdmin(Member member) throws Exception;
	
	int changePasswordByAdmin(Password password) throws Exception;
	
	
}
