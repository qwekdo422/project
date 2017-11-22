package com.jjack.web.rboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Rboard")
public class RboardController {

	
	
	//후기 게시판 목록보기
	@RequestMapping("/RboardList")
	public ModelAndView rboardList(){
		
		ModelAndView mv= new ModelAndView(); 
		mv.setViewName("Rboard/RboardList");
		return mv; 
	}
	
	
	//후기 게시판 글쓰기 폼 
	@RequestMapping("/RboardForm")
	public ModelAndView rboardWriteForm(){
	ModelAndView mv= new ModelAndView(); 
	mv.setViewName("Rboard/RWriteForm");
	return mv; 
		
	}
	
	
	
}
