package com.jjack.web.rboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.NDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjack.web.common.vo.RboardVO;
import com.jjack.web.rboard.dao.RboardDAO;
import com.jjack.web.util.PageUtil;

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

	//리뷰 리스트 가져오기 처리 함수 
	public List rboardList(int nowPage, PageUtil pInfo){
		//int nowPage, PageUtil pInfo
		int start=(nowPage-1)*(pInfo.getListCount())+1; //시작페이지
		int end=start+(pInfo.getListCount()-1); //종료위치 
		
		System.out.println("start = "+start);
		System.out.println("end= "+end);
		
		HashMap map = new HashMap();
		map.put("start",start); 
		map.put("end",end); 

		List list= rDAO.rboardList(map); 
		
		return list; 
	}
	
	//리뷰 검색 결과 리스트 
//	public ArrayList rboardSearchList(RboardVO rVO){
//		
//		ArrayList list= rDAO.rboardSearchList(rVO); 
//		return list; 
//	}
	public ArrayList getSearch(RboardVO rVO, PageUtil pInfo){
		
		int start=(pInfo.getNowPage()-1)*(pInfo.getListCount())+1; //시작페이지
//		int end=start+(pInfo.getListCount()-1); //종료위치 
		int end=pInfo.getNowPage() * pInfo.getListCount(); 
		System.out.println("start  = "+start);
		System.out.println("end= "+end);
		
		rVO.setStartPage(start);
		rVO.setEndPage(end);
		ArrayList list=rDAO.rboardSearchList(rVO); 
		return list; 
	}
	

	
	//각검색 결과에대한 데이터 총 갯수를 구하는 로직 
//	public int subjectTotalList(RboardVO rVO){
//		
//		HashMap map= new HashMap();
//		map.put("kind",rVO.getKind()); 
//		map.put("rsearch", rVO.getRsearch());
//		int subjectTotal = rDAO.searchTotalList(map); 
//		return subjectTotal; 
//	}
public PageUtil getSearchTotal(RboardVO rVO){
	HashMap map= new HashMap();
	map.put("kind",rVO.getKind()); 
	map.put("rsearch", rVO.getRsearch());
	int subjectTotal = rDAO.searchTotalList(map); 
	System.out.println("검색 갯수 = "+subjectTotal);
	System.out.println("nowPage = "+rVO.getNowPage());
	PageUtil pInfo= new PageUtil(rVO.getNowPage() , subjectTotal) ;
	return pInfo; 
	
	
}
	
	
	
	//회원 기수랑 닉네임 가져오기 질의명령 	
	public RboardVO gisooNick(int gno){
	
		RboardVO vo  = rDAO.gisooNick(gno); 

		return vo; 
	}

	//댓글 입력 로직 
	public void reContentsProc(RboardVO rVO) {
		rDAO.reContentsProc(rVO);
		
		return ; 
	}
	//댓글 리스트 가져오기 위한 질의명령 실행 
	public ArrayList reList(int rno){ 
		System.out.println("서비스 = "+rno);
		ArrayList list=(ArrayList)rDAO.reList(rno); 
		return list; 

	}
	
	//리뷰 이전글 다음글 뽑기 위한 로직 
	public RboardVO preNext(int rno){
		
		return (RboardVO) rDAO.preNext(rno); 
	}
	
	//리뷰 삭제
	public void rbaordDelete(int rno){
		
		rDAO.rbaordDelete(rno);
		return ; 
	}
	
	//리뷰 수정 폼
	public RboardVO rboardModify(int rno) {

	return rDAO.rboardModify(rno); 
	}

	//리뷰 수정 실행함수
	public void rboardModifyProc(RboardVO rVO) {

		rDAO.rboardModifyProc(rVO);
		return; 
	}

	
	//댓글 수정 실행함수 
	public void reModifycontents(RboardVO rVO) {
		
		rDAO.reModifycontents(rVO); 
	}

	//댓글 삭제 실행함수 
	public void replyDelete(RboardVO rVO) {

		rDAO.replyDelete(rVO); 
		return ;
	}
	
	//후기 남기기 버튼 안보이게 하기 로직 
	public void changAcond(int mno){
		System.out.println("changAcondSERVICE");
		rDAO.changAcond(mno);
		return; 
	}

	


	
	
	
	
	
	
}
