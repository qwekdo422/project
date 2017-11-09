package com.jjack.web.datecourse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 데이트코스 컨트롤러
 * @author : jinsu
 * @since : 2017. 11. 8.	
 */
@Controller
@RequestMapping("/datecourse")
public class DateCourseController {
	@RequestMapping("/datecourse1")
	public String datecourseone(){
		System.out.println("DateCouseController");
		return "datecourse/datecourse1";
	}
}
