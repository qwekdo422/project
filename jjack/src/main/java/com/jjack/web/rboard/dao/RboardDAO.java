package com.jjack.web.rboard.dao;

import java.util.HashMap;

import com.jjack.web.common.vo.RboardVO;

public interface RboardDAO {

	//리뷰 게시판 작성 질의문
	public void rboardWrite(HashMap map); 
	
	
	//이미 본 글 번호 확인 하기 
	public HashMap getHitNo(String user); 
	
	
	//처음 방문한 사람을 위한 이미 본 글번호 등록 질의명령
	public void insertHitNo(HashMap map); 
	
	//실제 조회수 증가 질의명령
	public void updateHit(int rno);
	
	//조회수 업데이터 
	public void updateHitNO(HashMap map); 
	
	
	//리뷰 상세보기 질의명령 
	public RboardVO rboardView(int rno); 
	
}
