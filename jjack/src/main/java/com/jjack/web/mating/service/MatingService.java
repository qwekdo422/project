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
