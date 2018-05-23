package edu.iot.butter.dao;

import java.util.List;
import java.util.Map;

import edu.iot.butter.model.Member;
import edu.iot.butter.model.Pagination;

public interface BaseDao<M,K> {
	//페이지네이션 할때 총 페이지를 구할 메서드!
	int getCount() throws Exception;
	
	List<M> selectList(Pagination pagination) throws Exception;
	
	M selectOne(K k) throws Exception;
	
	int insert(M m) throws Exception;
	
	int update(M m) throws Exception;
	
	int delete(K k) throws Exception;
}
