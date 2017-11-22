package com.jjack.web.nboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjack.web.common.vo.NboardVO;
import com.jjack.web.nboard.dao.NboardDAO;
import com.jjack.web.util.PageUtil;

@Service
public class NboardService {
	
	@Autowired
	private NboardDAO nDAO; 
	
	//공지사항 글쓰기 처리 서비스 함수 
	public void nBoardInsert(NboardVO nVO){
		nDAO.nBoardInsert(nVO); 
		return ;
	}
	
	//공지사항 리스트 가져오기 처리 함수 
	public ArrayList nboardList(int nowPage, PageUtil pInfo){

		
		int start=(nowPage-1)*(pInfo.getListCount())+1; //시작페이지
		int end=start+(pInfo.getListCount()-1); //종료위치 
		
		
		HashMap map = new HashMap();
		map.put("start",start); 
		map.put("end",end); 
		ArrayList list= nDAO.nboardList(map); 
		
		return list; 
	}

	
	
	
	//조회수 증가 여부를 판단할 함수 
	public boolean isHitNow(String id, int nno){
	//true면 조회수 증가 ㅇㅇ
	//false면 조회수 증가 ㄴㄴ 
		//매개변수의 의미
		//조회수 증가 여부를 판단하기 위해서는 누가 몇번글을 
		//볼 예정임을 알아야 한다. 
		HashMap map=nDAO.getHitNo(id); 
		//▲이 로직 결과의 의미는 그 아이디를 넣으면 그 아이디로
		//본 게시물을 게시글이 존재하는지 안하는지 출력해주는 그런 로직이다. 
		
		if(map==null || map.size()==0){
		//이쪽은 즉, 한번도 글을 본적이 없는 id계정이다. 
		//하지만 지금 본 글 번호를 insert해서 다음에는 이 글을 
		//볼 때 조회수 증가를 못하도록 한다. 
			HashMap temp= new HashMap(); 
			temp.put("user",id); 
			temp.put("nno","#"+nno+"#"); 
			nDAO.insertHitNo(temp);
			return true;
			
		}else{
			//이쪽은 그 아이디로 어떠한 게시물을 봤다는 의미이다. 
			//그 아이디로 본 게시물의 번호를 알아보자. 
			String ano=(String)map.get("nno"); 
			int	test = ano.indexOf("#" + nno + "#");
			
			if(test ==-1){//-1이면 그 게시물에 해당하는 글을 본 적이 없다는 의미이다. 
										  //정확한 로직의 의미는 잘모르겠지만 결과가 그렇다. 
				
				//그 글을 본적이 없는데, 새로운 글을 눌렀으면 그 글을 봤다고 
				//DB에서 처리를 해줘야 하는 로직 
				HashMap	temp = new HashMap();
				temp.put("user", id);
				temp.put("no", ano + "#" + nno + "#");//조회수를 증가할 수 있도록 한다.
				nDAO.updateHitNO(temp);
				return true; 
			}else{
				//이 결과는 이번글도 본적이 있다는 말이다. 
				//조회수 증가를 하지 못하도록 한다.
				return false; 
			}
		}
	}
	
	//실제 조회수를 증가시킬 로직 
	public void updateHit(int nno){
		nDAO.updateHit(nno);
	}
	
	
	//게시물 상세보기 처리 로직 
	public NboardVO nBoardView(int nno){
		return (NboardVO)nDAO.nBoardView(nno);
	}
	
	//페이징 처리를 위한 총 데이터의 갯수 가져오기
	public int getTotalService(){
		
		int total=nDAO.getTotal(); 
		return total;  
	}
	
	
	//공지사항 게시물 삭제 처리 로직 
	public void nBoardDelete(int nno){
			
		nDAO.nBoardDelete(nno);
		return ; 
	}
	
	//공지사항 게시판 수정하기 폼 가져오기 위한 로직
	public NboardVO nBoardModify(int nno){
		return  (NboardVO)nDAO.nBoardModify(nno); 
	}
	
	//공지사항 게시판 수정하기 실행을 위한 로직 
	public void nBoardModifyProc(HashMap map){		
		nDAO.nBoardModifyProc(map);
		return;  
	}
	
	//이전글 다음글 꺼내오기 위한 실행 로직 
	public NboardVO preNext(int nno){
		
		return(NboardVO)nDAO.preNext(nno); 
	}
	
	
	
}
