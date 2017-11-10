package com.jjack.web.login.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjack.web.login.dao.LoginDAO;

@Service
public class LoginService {

	
	@Autowired
	private LoginDAO lDAO; 
	
	public int login(String id, String pw){
		
		HashMap map=new HashMap();
		map.put("hashid", id);
		map.put("hashpw",pw); 
		return lDAO.login(map);
	}
	
	
	
}
