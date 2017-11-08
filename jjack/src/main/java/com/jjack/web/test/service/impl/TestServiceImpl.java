package com.jjack.web.test.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjack.web.common.vo.TestVO;
import com.jjack.web.test.dao.TestDAO;
import com.jjack.web.test.service.TestService;

/**
 * 초기세팅 테스트용 testService 인터페이스 재정의 클래스
 * @author : daeo
 * @since : 2017. 11. 6.	
 */
@Service
public class TestServiceImpl implements TestService{
	
	@Autowired private TestDAO tDAO;
	
	@Override
	public TestVO getMember(int no) {
		return tDAO.testMember(no);
	}
}
