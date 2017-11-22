package com.jjack.web.nboard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjack.web.common.vo.NboardVO;

public interface NboardDAO {
	
	public void nBoardInsert(NboardVO nVO); //게시물 작성 

	public ArrayList nboardList(HashMap map); //게시물 리스트 가져오기 

	public HashMap getHitNo(String id); //이미 본 글 번호를 조회할 질의 명령 
	
	public void updateHitNO(HashMap map);  //조회수 업데이트 
	
	public void insertHitNo(HashMap map); //조회수 인설트 

	public void updateHit(int nno); //실제 조회수를 증가시킬 로직
	
	public NboardVO nBoardView(int nno); // 게시물 상세보기 시킬 로직
	
	public int getTotal(); //페이징 처리를 위해 총 데이터의 갯수를 가지고 오자.
	
	public void nBoardDelete(int nno); //게시물 삭제 처리 시킬 로직 
		
	public NboardVO nBoardModify(int nno); //수정하기 폼 가져오기 위한 로직 
	
	public void nBoardModifyProc(HashMap map); //게시글 수정 실행함수 
	
	public NboardVO preNext(int nno); //이전글 다음글 꺼내오기 위한 로직 
	
	//-------------------------------------------------------------------------------------------------------------------
}



