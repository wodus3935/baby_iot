package edu.iot.butter.service;

import java.util.List;

import edu.iot.butter.model.Avata;
import edu.iot.butter.model.Login;
import edu.iot.butter.model.Member;
import edu.iot.butter.model.Pagination;
import edu.iot.butter.model.Password;

public interface MemberService {
	Member checkLogin(Login login) throws Exception;
	
	Boolean CheckId(String userId) throws Exception;

	Boolean create(Member member) throws Exception;
	
	Boolean update(Member member) throws Exception;
	
	Member getMember(String userId) throws Exception;
	
	Boolean changePassword(Password password) throws Exception;
	
	Pagination getPagination(int page) throws Exception;
	
	List<Member> getList(Pagination pagination) throws Exception;
	
	Boolean updateByAdmin(Member member) throws Exception;
	
	Boolean changePasswordByAdmin(Password password) throws Exception;

	//사진 가져오기
	byte[] getAvata(String userId) throws Exception;
	
	//사진 넣기
	boolean insertAvata(Avata avata) throws Exception;
	
	//개인정보 수정
	boolean updateAvata(Avata avata) throws Exception;
	
	boolean deleteAvata(String userId) throws Exception;
	
	//리스트 가져오기
	List<Member> getListWithMessages(String userId) throws Exception;
}
