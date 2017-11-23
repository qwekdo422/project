package com.jjack.web.rboard.service;

import java.util.HashMap;

import org.apache.log4j.NDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjack.web.common.vo.RboardVO;
import com.jjack.web.rboard.dao.RboardDAO;

@Service
public class RboardService {

	@Autowired
	private RboardDAO rDAO;

	// 리뷰 글쓰기 서비스
	public void rboardWrite(HashMap map) {
		rDAO.rboardWrite(map);
		return;
	}

	// 조회수 증가 여부 판단 함수
	public boolean isHitNow(String id, int rno) {

		HashMap map = rDAO.getHitNo(id);

		if (map == null || map.size() == 0) {
			// 그 글을 한번도 본적이 없는 계정이라면

			HashMap temp = new HashMap();
			temp.put("user", id);
			temp.put("rno", "#" + rno + "#");
			rDAO.insertHitNo(temp);
			return true;
		} else {

			String ano = (String) map.get("rno");
			int test = ano.indexOf("#" + rno + "#");
			if (test == -1) {
				HashMap temp = new HashMap();
				temp.put("user", id);
				temp.put("no", ano + "#" + rno + "#");
				rDAO.updateHitNO(temp);
				return true;
			} else {

				return false;
			}

		}
	}

	// 실제 조회수를 증가시킬 로직
	public void updateHit(int rno) {
		rDAO.updateHit(rno);
		return;
	}

	
	//리뷰 상세보기 로직 
	public RboardVO rboardView(int rno){
		
		return (RboardVO)rDAO.rboardView(rno); 
	}
	
	//총 데이터 갯수 가져오기 위한 로직 
	public int getTotalList(){
		
		int total=rDAO.getTotalList(); 
		return total; 
	}

	
	
	
	
	
	
	
	
	
	
	
}
