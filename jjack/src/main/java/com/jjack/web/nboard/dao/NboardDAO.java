package com.jjack.web.nboard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjack.web.common.vo.NboardVO;

public interface NboardDAO {
	
	public void nBoardInsert(NboardVO nVO); //게시물 작성 

	public ArrayList nboardList(String isShow); //게시물 리스트 가져오기 

	public HashMap getHitNo(String id); //이미 본 글 번호를 조회할 질의 명령 
	
	public void updateHitNO(HashMap map);  //조회수 업데이트 
	
	public void insertHitNo(HashMap map); //조회수 인설트 

	public void updateHit(int nno); //실제 조회수를 증가시킬 로직
	
	//-------------------------------------------------------------------------------------------------------------------
}



