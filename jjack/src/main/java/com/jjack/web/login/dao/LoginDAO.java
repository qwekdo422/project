package com.jjack.web.login.dao;

import java.util.HashMap;

public interface LoginDAO {

	public int login(HashMap hMap); 
	
	public int logOut(String overlap_id);
}
