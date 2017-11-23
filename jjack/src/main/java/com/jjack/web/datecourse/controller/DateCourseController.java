package com.jjack.web.datecourse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jjack.web.datecourse.service.DateCourseService;


/**
 * 데이트코스 컨트롤러
 * @author : jinsu
 * @since : 2017. 11. 8.	
 */
@Controller
@RequestMapping("/datecourse")
public class DateCourseController {
	
	@Autowired
	public DateCourseService ds;
	
	@RequestMapping("/BasicCourse")
	public String basicCourse(){
		//System.out.println("BasicCourse");
		return "datecourse/BasicCourse";
	}
	@RequestMapping("/CoupleCourse")
	public ModelAndView coupleCourse(ModelAndView mv){
		
		//입소자들 정보 가져오기
		  //서비스를 호출해서 리스트 및 맵 정보를 가져온다
		
		//뷰 호출
		  // 서비스에서 가져온 리스트 및 맵정보를 Model에 받아서 뷰에 돌려준다.
	
		return mv;
	}
	@RequestMapping("/SoloCourse")
	public String soloCourse(){
		//System.out.println("SoloCourse");
		return "datecourse/SoloCourse";
	}
	
}
