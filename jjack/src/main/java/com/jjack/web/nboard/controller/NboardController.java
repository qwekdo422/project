package com.jjack.web.nboard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jjack.web.common.vo.NboardVO;
import com.jjack.web.nboard.service.NboardService;

@Controller
@RequestMapping("/Nboard")
public class NboardController {

	
	@Autowired
	private NboardService nService; 
	
	//공지사항 목록보기 
	@RequestMapping("/NboardList")
	public ModelAndView nboardList(){
		ModelAndView mv= new ModelAndView();
		mv.setViewName("Nboard/NboardList");
		return null; 
	}
	
	//공지사항 상세보기 
	@RequestMapping()
	public ModelAndView nboardView(){
		
		return null; 
	}
	
	//공지사항 글쓰기 폼 
	@RequestMapping("/NboardForm")
	public ModelAndView nboardWriteForm(){
		ModelAndView mv= new ModelAndView();
		mv.setViewName("Nboard/NWriteForm");
		return mv; 
	}
	
	
	//공지사항 글쓰기 실행 함수 
	@RequestMapping("/NboardProc")
	public ModelAndView nboardWriteProc(NboardVO nVO){
		System.out.println("공지사항 글쓰기 실행 함수");
		
		nService.nBoardInsert(nVO);
		
		//게시물 목록보기로 돌아간다. 
		ModelAndView mv= new ModelAndView();
		RedirectView rv= new RedirectView("../main/mainForm.do"); 
		mv.setView(rv);//실험으로 메인으로 가보자. 
		return mv; 
	}
	
	
}
