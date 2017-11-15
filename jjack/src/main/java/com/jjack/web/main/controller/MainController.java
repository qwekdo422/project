package com.jjack.web.main.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jjack.web.common.vo.ProfileVO;
import com.jjack.web.test.service.TestService;
import com.jjack.web.test.service.impl.TestServiceImpl;

/**
 * 메인페이지 컨트롤러
 * @author : jinsu
 * @since : 2017. 10. 31.	
 */

@Controller
public class MainController {

	

	@Autowired private TestService tService; 

	/**
	 * 메인페이지 관련 함수
	 * @author : jinsu
	 * @since : 2017. 10. 31.
	 * @param :  
	 * @return : 
	 */
	@RequestMapping("/main/mainForm")
	public String mainForm () {

		return "main/mainForm";
	}
	

	
}
