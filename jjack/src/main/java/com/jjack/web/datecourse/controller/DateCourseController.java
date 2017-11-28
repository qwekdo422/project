package com.jjack.web.datecourse.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jjack.web.common.vo.DateCourseVO;
import com.jjack.web.datecourse.service.DateCourseService;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
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
	
	//권한에 따라 다르게 리다이렉트해주는 컨트롤러
	@RequestMapping("/DateCourse")
	public ModelAndView datecourseConnector(HttpSession hs, ModelAndView mv, RedirectView rv){
		int auth = (Integer)hs.getAttribute("Auth");
		String uid = (String)hs.getAttribute("UID");
		
		if(auth == 1 || auth == 2){
			//입소 확정자 및 입소자는 커플 코스 페이지로 연결
			rv.setUrl("./CoupleCourse.do");
		}else if(auth == 3){
			//솔로 확정자는 솔로 코스 페이지로 연결
			rv.setUrl("./SoloCourse.do");
		}else {
			//일반 회원 및 후기 미완료 퇴소자 및 기타 등등은 짝 기본 코스로 연결
			rv.setUrl("./BasicCourse.do");
		}
		
		mv.setView(rv);
		return mv;
	}
	
	//기본코스
	@RequestMapping("/BasicCourse")
	public String basicCourse(){
		//System.out.println("BasicCourse");
		return "datecourse/BasicCourse";
	}
	
	/*
	//커플코스(수정전)
	@RequestMapping("/CoupleCourse")
	public String coupleCourse(){

		return "datecourse/BasicCourse";
	}
	*/
	
	
	//커플코스(수정후)
	@RequestMapping("/CoupleCourse")
	public ModelAndView coupleCourse(HttpSession session){
		int mno = (Integer)session.getAttribute("MNO");
		String sCourse = ds.getGuestInfo(mno);
		ModelAndView mv = new ModelAndView();
		mv.addObject("course", sCourse);
		return mv;
	}	
	
	
	//솔로코스
	@RequestMapping("/SoloCourse")
	public String soloCourse(){
		//System.out.println("SoloCourse");
		return "datecourse/SoloCourse";
	}
	
}
