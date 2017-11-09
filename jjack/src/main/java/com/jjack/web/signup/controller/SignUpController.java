package com.jjack.web.signup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jjack.web.common.vo.ProfileVO;
import com.jjack.web.signup.service.SignUpService;

@Controller
@RequestMapping("/SignUp")
public class SignUpController {

	
	@Autowired private SignUpService sService; 
	
	
	/**
	 * 회원가입 폼 함수 
	 * @author : 정준일
	 * @since : 2017. 11.08.
	 * @param :  없음
	 * @return : ModelandView
	 */
	@RequestMapping("/SignUpForm")
	public ModelAndView SignUpForm(){
		ModelAndView mv= new ModelAndView(); 
		mv.setViewName("SignUp/SignUpForm");
		
		return mv; 
	}
	
	/**
	 * 아이디 중복검사 실행 함수 
	 * @author : 정준일
	 * @since : 2017. 11.08.
	 * @param : id
	 * @return : ModelandView
	 */
	@RequestMapping("/Login/Overlap")
	public ModelAndView OverlapProc(){
		
		return null; 
	}
	
	/**
	 * 회원가입 실행함수 
	 * @author : 정준일
	 * @since : 2017. 11.08.
	 * @param :  ProfileVO
	 * @return : ModelandView
	 */
	@RequestMapping("/SignUpProc")
	public ModelAndView SignUpProc(ProfileVO pVO){
		System.out.println("아이디 = "+pVO.getBirth());
		sService.SignUpProc(pVO);
		//뷰를 뷰른다. 

		
		//모델 입력 
		ModelAndView	mv = new ModelAndView();

		return mv;
		
		 
	}
	
	
}
