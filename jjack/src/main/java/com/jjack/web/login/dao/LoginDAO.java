package com.jjack.web.login.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.jjack.web.common.vo.ProfileVO;

public interface LoginDAO {

	public int login(HashMap hMap); //로그인 처리
	
	public int logOut(String overlap_id); //로그아웃 처리
	
	public int mNo(String id); //회원번호 추출
	
	public  ProfileVO mModify(int mNo); //회원정보 수정 처리 
}
