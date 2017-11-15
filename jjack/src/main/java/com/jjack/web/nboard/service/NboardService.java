package com.jjack.web.nboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjack.web.common.vo.NboardVO;
import com.jjack.web.nboard.dao.NboardDAO;

@Service
public class NboardService {
	
	@Autowired
	private NboardDAO nDAO; 
	
	//공지사항 글쓰기 처리 서비스 함수 
	public void nBoardInsert(NboardVO nVO){
		nDAO.nBoardInsert(nVO); 
		return ;
	}

}
