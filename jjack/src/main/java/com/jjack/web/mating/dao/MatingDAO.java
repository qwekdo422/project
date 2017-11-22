package com.jjack.web.mating.dao;
import java.util.*;
import com.jjack.web.common.vo.MatingVO;

public interface MatingDAO {
	/*
	 *  사랑의 작대기
	 */

	// 입소한 사람들이 있는 현재 날짜 구하기
	public String getEdate();
	// 이번기수의 사람수 구하기
	public MatingVO getNumbers(String edate);
	// 남자 정보 가져오기
	public List<MatingVO> MenForArrows(String edate);
	// 여자 정보 가져오기
	public List<MatingVO> WomenForArrows(String edate);
	// 커플맺고 코스 입력
	public void coupling(String edate);
	
	
	
	
	
	
	
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
