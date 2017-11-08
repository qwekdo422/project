package com.jjack.web.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jjack.web.common.vo.TestVO;
import com.jjack.web.test.service.TestService;

/**
 * 초기세팅 테스트용 컨트롤러
 * @author : daeo
 * @since : 2017. 11. 6.	
 */
@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired private TestService tService;

	@RequestMapping("/testMember")
	public String test (@RequestParam int no, Model model) {
		TestVO vo = tService.getMember(no);
		model.addAttribute("member", vo);
		return "test/testForm";
	}
}
