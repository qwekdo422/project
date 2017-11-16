package com.jjack.web.util;

import javax.servlet.http.HttpSession;
/**
 * 이 클래스는 세션에 관련된 내용을 처리하기 위한 유틸리티 클래스
 * @author : daeo
 * @since : 2017. 10. 31.	
 */
public class SessionUtil {

	/**
	 * 로그인 여부를 알려주는 함수
	 * @author : daeo
	 * @since : 2017. 10. 31.
	 * @param : 
	 * @return : boolean
	 */
	public static boolean isLogin(HttpSession session) {
		//	세션에 UID라는 키값의 데이터가 있는지 확인해서 그 결과를 알려준다.
		String id = (String) session.getAttribute("UID");
		boolean isNull = StringUtil.isNull(id);
		//	널이면 true, 널이 아니면 false 반환
		
		//	이 함수는 로그인을 했으면 true, 로그인을 안했으면 false로 반환한다.
		return !isNull;
	}
	
	/**
	 * 회원번호 반환해주는 함수
	 * @author : daeo
	 * @since : 2017. 11. 16.
	 * @param : session
	 * @return : int
	 */
	public static int getMno(HttpSession session) {
		return (Integer)session.getAttribute("MNO");
	}
}
