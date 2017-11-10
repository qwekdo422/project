package com.jjack.web.signup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjack.web.common.vo.ProfileVO;
import com.jjack.web.signup.dao.SignUpDAO;

@Service//이 어노테이션으로 인해 이 서비스 함수는 context에서 bean 처리 하지 않아도 @Autowired된다. 
public class SignUpService{

	@Autowired private SignUpDAO sDAO;

	public void SignUpProc(ProfileVO pVO){
		sDAO.singUp(pVO);
	}
	
	
}
