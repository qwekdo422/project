package com.jjack.web.login.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjack.web.common.vo.ProfileVO;
import com.jjack.web.login.dao.LoginDAO;

@Service
public class LoginService {

	
	@Autowired
	private LoginDAO lDAO; 
	
	//로그인 처리 함수 
	public int login(String id, String pw){
		
		HashMap map=new HashMap();
		map.put("hashid", id);
		map.put("hashpw",pw); 
		return lDAO.login(map);
	}
	
	//회원번호 출력 처리 함수 
	public int mNo(String id){
		
		return lDAO.mNo(id); 
	}
	
	//회원정보 수정 처리 함수 
	public ProfileVO  mModify(int mNo){
		return lDAO.mModify(mNo); 
	}
	
	
	
}
