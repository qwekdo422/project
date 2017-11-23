package com.jjack.web.mating.service;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jjack.web.common.vo.MatingVO;
import com.jjack.web.mating.dao.MatingDAO;

@Service
public class MatingService {
	@Autowired
	public MatingDAO md;
	
	/*
	 *  점심 사다리 타기
	 */
	
	// 사다리용 여자 정보 가져오기
	public List<MatingVO> WomenForLunch(String edate){
		return md.WomenForLunch(edate);
	}
	// 사다리용 남자 정보 가져오기
	public List<MatingVO> MenForLunch(String edate){
		return md.MenForLunch(edate);
	}
	// 남자수, 여자수에 맞춰 사다리 가져오기
	public int makeLadder(String edate){
		return md.makeLadder(edate);
	}
	// 점심 파트너 입력
	public void lunching(HashMap<String, Integer> map){
		md.lunching(map);
	}
	
	
	
	/*
	 *  사랑의 작대기
	 */
	
	// 현재 날짜, 기수 구하기
	public String getEdate() {
		return md.getEdate();
	}
	
	// 이번기수의 사람수 구하기
	public MatingVO getNumbers(String edate){
		return md.getNumbers(edate);
	}
	
	// 남자 정보 가져오기
	public List<MatingVO> MenForArrows(String edate){
		return md.MenForArrows(edate);
	}
	
	// 여자 정보 가져오기
	public List<MatingVO> WomenForArrows(String edate){
		return md.WomenForArrows(edate);
	}
	
	// 커플 맺고 코스 등록하기
	public void coupling(String edate) {
		md.coupling(edate);
	}
	
	
	
	
	/*
	 *  짝 선택하기
	 */
	
	// 입소한 회원 정보 가져오기
	public MatingVO getInfo(int mno) {
		return md.getInfo(mno);
	}
	
	// 짝선택시 필요한 이성 리스트 가져오기
	public List<MatingVO> getLoves(MatingVO mvo) {
		return md.getLoves(mvo);
	}
	
	// 마음에 드는 이성 선택 등록
	public void chooseOne(int myGno, int myLove) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("myGno", myGno);
		map.put("myLove", myLove);
		md.chooseOne(map);
	}
	
	// 선택한 짝 알아내기
	public MatingVO whoIsMyChoice(int MyGno) {
		return md.whoIsMyChoice(MyGno);
	}
	
	
}
