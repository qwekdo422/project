package com.jjack.web.mating.dao;
import java.util.*;
import com.jjack.web.common.vo.MatingVO;

public interface MatingDAO {
	/*
	 *  사랑의 작대기
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 *  짝 선택화면
	 */
	
	// 회원 정보 가져오기
	public MatingVO getInfo(int mno);
	// 선택할 짝들 가져오기
	public List<MatingVO> getLoves(MatingVO mvo);
	// 마음에 드는 이성 선택
	public void chooseOne(HashMap<String, Integer> map);
	// 선택한 짝 알아내기
	public MatingVO whoIsMyChoice(int MyGno);
	
	
	
	
	
	
	
	
}
