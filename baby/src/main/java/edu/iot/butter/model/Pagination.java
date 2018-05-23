package edu.iot.butter.model;

import lombok.Data;

@Data
public class Pagination {
	//인스턴스마다 무관한 상수가 되기위해 sataic을 빼고 초기화는 하지 않는다.
	public final int PER_PAGE; //1페이지당 데이터 건수
	public final int PER_BLOCK; //1블럭당 페이지 수
	
	private int totalCount; //전체 데이터 건 수
	private int page; //현재 페이지
	private int start; //현재 페이지 시작 번호
	private int end; //현재 페이지 끝번호
	
	private int totalPage; //전체 페이지 수
	private int startPage; //현재 페이이지 블럭에서의 시작 페이지 번호
	private int endPage; //현재 페이이지 블럭에서의 마지막 페이지번호
	
	private int currentBlock; //현재 페이지 블럭
	private int totalBlock; //이전페이지 블럭의 시작 페이지 번호
	private int prevBlockPage; //이전 페이지 블럭의 시작페이지 번호
	private int nextBlockPage; //이전 페이지 블럭의 시작페이지 번호
	
	public Pagination(int currentPage, int totalCount) {
		this(currentPage, totalCount, 10, 10);
	}
	
	public Pagination(int currentPage, int totalCount, int perPage) {
		this(currentPage, totalCount, perPage, 10);
	}
	
	public Pagination(int currentPage, int totalCount,int perPage, int perBlock ) {
		
		PER_PAGE=perPage;
		PER_BLOCK=perBlock;
		
		page = currentPage;
		this.totalCount = totalCount;
		
		//현재 페이지 시작번호
		start= (page-1)*PER_PAGE+1;
		//현재페이지 끝 번호
		end = start + PER_PAGE -1;
		//전체 페이지 수
		totalPage = (int)Math.ceil((float)totalCount/PER_PAGE);
		
		currentBlock = (int)Math.ceil((float)currentPage/PER_BLOCK);
		totalBlock = (int)Math.ceil((float)totalPage/PER_BLOCK);
		
		startPage = (currentBlock-1)*PER_BLOCK +1; //블록 시작 페이지
		endPage = startPage + PER_BLOCK -1; //블록 마지막 페이지
		
		if(endPage > totalPage) endPage = totalPage;
		
		
		prevBlockPage = page - PER_BLOCK;
		nextBlockPage = page + PER_BLOCK;
	}
	

}
