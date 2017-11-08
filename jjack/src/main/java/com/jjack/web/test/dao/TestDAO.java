package com.jjack.web.test.dao;

import com.jjack.web.common.vo.TestVO;

/**
 * 초기세팅 테스트용 DAO 인터페이스(재정의 하지 않는다)
 * @author : daeo
 * @since : 2017. 11. 6.	
 */
public interface TestDAO {
	public TestVO testMember(int no);
}
