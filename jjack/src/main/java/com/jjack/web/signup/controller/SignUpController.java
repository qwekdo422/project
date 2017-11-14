package com.jjack.web.signup.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

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
	@RequestMapping("/Overlap")
	@ResponseBody
	public HashMap overlapProc(@RequestParam("id") String id){
		//폼에 있는 데이터를 보내줘야 한다. 
		System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		int isId=sService.overLap(id);
		//결과값이 1이면 아이디가 있는 것이다. 
		
		HashMap map = new HashMap();
		if( isId == 1){
			map.put("result", 1); //아이디가 중복이다.
			return map;
		}else{
			
			map.put("result", 0); //아이디가 중복이 아니다. 
			return map; 
			
			}
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
		System.out.println("회원가입 실행함수");
		
		//모델 입력 
		//회원가입을 하면 로그인 창으로 가고싶다.
		//그러면 일단 로그인 창을 만들어야 하겠구나 : 만들었고 
		//회원가입 버튼을 누르면 alert창을 띄워서 가입이 완료되었습니다 라고 띄운 후 
		//로그인 폼을 띄우되 그 회원가입한 아이디가 미리 로그인폼으로 들어가서 수행하고 싶다. 
		
		
		sService.SignUpProc(pVO); //회원가입 폼 데이터 DB에 넣는 로직 수행 
		
		
		ModelAndView	mv = new ModelAndView();
		mv.addObject("id", pVO.getId()); 
		mv.setViewName("Login/SubLoginForm");

		return mv;
	
		 
	}
	
	
}
