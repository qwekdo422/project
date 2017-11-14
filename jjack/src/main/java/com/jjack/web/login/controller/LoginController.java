package com.jjack.web.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jjack.web.common.vo.ProfileVO;
import com.jjack.web.login.service.LoginService;

@Controller
@RequestMapping("/Login")
public class LoginController {

	@Autowired
	private LoginService lService;
	/**
	 * 로그인 폼 실행함수
	 * 
	 * @author : 정준일
	 * @since : 2017. 11.09.
	 * @param :  없음
	 * @return : ModelandView
	 */
	@RequestMapping("/LoginForm")
	public ModelAndView LoginForm(ProfileVO pVO){
		
		ModelAndView mv= new ModelAndView(); 
		mv.setViewName("Login/LoginForm");
		
		return mv; 
	}
	
	
	
	/**
	 * 로그인 실행함수 
	 * @author : 정준일
	 * @since : 2017. 11.09.
	 * @param :  없음
	 * @return : ModelandView
	 */
	@RequestMapping("/LoginProc")
	public ModelAndView LoginProc(HttpServletRequest req, HttpSession session){
		System.out.println("실행되니?");
		ModelAndView mv= new ModelAndView(); 
		String id=req.getParameter("id"); 
		String pw=req.getParameter("pw"); 
		int result=lService.login(id, pw);  //그 아이디가 있으면 1을 반환한다. 
		
		if(result==1){
			
			
			int mNo=lService.mNo(id);//로그인에 성공하여 그 아이디의 회원 번호를 받았다. 
			
			
			session.setAttribute("UID", id);//세션을 부여하겠다는 의미이다.
			mv.addObject("OBJECT",result); 
			mv.addObject("UID", id); 
			mv.setViewName("Login/SubLoginForm");

		return mv; 
		}else{
			mv.addObject("OBJECT",result); 
			mv.addObject("ID",id); 
			mv.addObject("PW",pw); 
			mv.setViewName("Login/SubLoginForm");
			return mv; 
		}

	}
	
	
	/**
	 * 로그아웃 실행함수 
	 * @author : 정준일
	 * @since : 2017. 11.10.
	 * @param :  S
	 * @return : ModelandView
	 */
	@RequestMapping("/Logout")
	public ModelAndView LoOutProc(HttpSession session){
		session.removeAttribute("UID");
		RedirectView rv= new RedirectView();
		ModelAndView mv= new ModelAndView(); 
		rv.setUrl("../main/mainForm.do"); 
		mv.setView(rv);
		return mv; 
		
	}
	
	
	
	/**
	 * 회원정보 수정 폼 
	 * 
	 * @author : 정준일
	 * @since : 2017. 11.13.
	 * @param :  VO
	 * @return : ModelandView
	 */
	@RequestMapping("/modifyForm")
	public ModelAndView modifyForm( HttpSession session){
		
		//그 해당하는 아이디의 회원 번호를 받은 후 
		String id=(String)session.getAttribute("UID");
		int mNo=lService.mNo(id);

		
		//로직을 처리해 주자.
		ProfileVO pVO =lService.mModify(mNo); 

		ModelAndView mv= new ModelAndView(); 
		mv.addObject("PVO", pVO); 
		mv.setViewName("Login/MyPage");
		return mv; 
		
	}
	
	
	
	
	
	
}
