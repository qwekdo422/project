package com.jjack.web.houseApply.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 입소신청 컨트롤러
 * @author : daeo
 * @since : 2017. 11. 7.	
 */
@Controller
@RequestMapping("/houseApply")
public class HouseApplyController {
	
	@RequestMapping("/applyForm")
	public String applyForm() {
		return "./houseApply/applyForm";
	}

	@RequestMapping("/test")
	public void calendarTest() {
	}
	
}
