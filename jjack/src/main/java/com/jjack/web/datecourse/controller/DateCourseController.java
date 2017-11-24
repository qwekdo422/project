package com.jjack.web.datecourse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jjack.web.common.vo.DateCourseVO;
import com.jjack.web.datecourse.service.DateCourseService;
import java.util.*;
import javax.servlet.http.HttpSession;


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
	
	//기본코스
	@RequestMapping("/BasicCourse")
	public String basicCourse(){
		//System.out.println("BasicCourse");
		return "datecourse/BasicCourse";
	}
	
	//커플코스(수정전)
	@RequestMapping("/CoupleCourse")
	public String coupleCourse(){

		return "datecourse/BasicCourse";
	}
	
	/*
	//커플코스(수정후)
	@RequestMapping("/CoupleCourse")
	public ModelAndView coupleCourse(HttpSession session){
		
		int mno = (Integer)session.getAttribute("MNO");
		DateCourseVO dvo = ds.getGuestInfo(mno);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("dateguest",dvo);
		
		System.out.println("mv:" + mv.getView());
		return mv;
	}	
	*/
	
	//솔로코스
	@RequestMapping("/SoloCourse")
	public String soloCourse(){
		//System.out.println("SoloCourse");
		return "datecourse/SoloCourse";
	}
	
}
