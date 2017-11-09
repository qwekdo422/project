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
	 * @return : String
	 */
	@RequestMapping("/SignUpForm")
	public String SignUpForm(){
		return "SignUp/SignUpForm"; 
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

		//모델 입력 
		//회원가입을 하면 로그인 창으로 가고싶다.
		//그러면 일단 로그인 창을 만들어야 하겠구나 : 만들었고 
		//회원가입 버튼을 누르면 alert창을 띄워서 가입이 완료되었습니다 라고 띄운 후 
		//로그인 폼이 뜨게끔 만들고 싶다. 
		
		ModelAndView	mv = new ModelAndView();
		mv.addObject("id", pVO.getId()); 

		return mv;
	
		 
	}
	
	
}
