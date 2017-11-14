package com.jjack.web.signup.dao;

import com.jjack.web.common.vo.ProfileVO;

public interface SignUpDAO {

	public void singUp(ProfileVO pVO);
	
	public int overLap(String id); 
	
}
