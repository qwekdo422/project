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
	@RequestMapping("/BasicCourse")
	public String basicCourse(){
		System.out.println("BasicCourse");
		return "datecourse/BasicCourse";
	}
	@RequestMapping("/CoupleCourse")
	public String coupleCourse(){
		System.out.println("BasicCourse");
		return "datecourse/CoupleCourse";
	}
	@RequestMapping("/SoloCourse")
	public String soloCourse(){
		System.out.println("BasicCourse");
		return "datecourse/BasicCourse";
	}
	
}
