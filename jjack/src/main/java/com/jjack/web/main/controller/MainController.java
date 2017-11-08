package com.jjack.web.main.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 메인페이지 컨트롤러
 * @author : daeo
 * @since : 2017. 10. 31.	
 */
@Controller
public class MainController {
	
	/**
	 * 메인페이지 관련 함수
	 * @author : daeo
	 * @since : 2017. 10. 31.
	 * @param :  
	 * @return : 
	 */
	@RequestMapping("/main/mainForm")
	public String mainForm () {
		System.out.println("mainForm 함수");
		return "main/mainForm";
	}
	
}
