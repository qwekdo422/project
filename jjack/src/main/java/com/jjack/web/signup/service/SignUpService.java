package com.jjack.web.signup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjack.web.common.vo.ProfileVO;
import com.jjack.web.login.dao.SignUpDAO;

@Service
public class SignUpService{

	@Autowired private SignUpDAO sDAO;

	public void SignUpProc(ProfileVO pVO){
	
		sDAO.singUp(pVO);
		
	}
	
	
}
