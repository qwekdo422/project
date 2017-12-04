package com.jjack.web.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView LoginForm(ProfileVO pVO, String url , @RequestParam(value="pwfail" ,defaultValue = "1")int pwfail){
		if(pVO.getRno() != 0) {
			url ="../ Rboard/RboardView.do?rno="+pVO.getRno();
		}
		ModelAndView mv= new ModelAndView();
		mv.addObject("url", url);
		
		mv.addObject("pwfail", pwfail); 
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
	public ModelAndView LoginProc(HttpServletRequest req, HttpSession session, ProfileVO pVO , 	RedirectView rv){
		ModelAndView mv= new ModelAndView(); 
		String id=req.getParameter("id"); 
		String pw=req.getParameter("pw"); 
		int result=lService.login(id, pw);  //그 아이디가 있으면 1을 반환한다. 
		
	
		if(result==1){
			int Auth = lService.getAuth(id);
			
			int mNo=lService.mNo(id);//로그인에 성공하여 그 아이디의 회원 번호를 받았다. 
			session.setAttribute("MNO", mNo);//세션을 저장하였다. 
																							//즉 로그인 했을 때, 즉 세션이 필요한 곳에서
																							//getAttribute("키값"); 하면 
																							//그 세션이 있는 곳에서는 저 키값에 저장된 변수를 
																							//사용할 수 있다.
			
			session.setAttribute("UID", id);//세션을 부여하겠다는 의미이다.
			session.setAttribute("Auth", Auth);	// 세션에 권한 등록
//			mv.addObject("OBJECT",result); 
//			mv.addObject("UID", id);
		
			
			//	파라메터에 url값이 존재한다면 인터셉터를 거치고 온 상태이다.
			//	로그인 처리 완료 후 로그인 전 요청한 url로 리다이렉트한다.
			if(pVO.getUrl() != null) {
				rv.setUrl(pVO.getUrl());
				mv.setView(rv);
			} else {
				rv.setUrl("../main/mainForm.do");
				rv.addStaticAttribute("come", "welcome");
				rv.addStaticAttribute("UID",id);
				mv.setView(rv); 
				
			}

		return mv; 
		}else{
			
			
			rv.setUrl("../Login/LoginForm.do");
			rv.addStaticAttribute("pwfail", result);
			mv.setView(rv);
//			mv.addObject("OBJECT",result); 
//			mv.addObject("ID",id); 
//			mv.addObject("PW",pw); 
//			mv.setViewName("Login/SubLoginForm");
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
		session.removeAttribute("MNO");
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
		System.out.println(pVO.getBirth());
		mv.setViewName("Login/MyPage");
		return mv; 
		
	}
	
	/**
	 * 회원정보  ajax비밀번호 중복확인 여부 함수 
	 * 
	 * @author : 정준일
	 * @since : 2017. 11.15.
	 * @param :  VO
	 * @return : ModelandView
	 */
	@RequestMapping("/pwOverlap")
	@ResponseBody
	public HashMap pwOverlap(@RequestParam("id") String id, @RequestParam("pw") String pw){
			
		int isPw = lService.isPw(pw, id); //결과값이 1이면 아이디와 비밀번호가 일치하는 것이다. 

		System.out.println(isPw);
		HashMap map = new HashMap();
		if(isPw==1){
			map.put("result",1);  //아이디와 비밀번호가 일치한다. 
			return map; 
		}else{
			map.put("result", 0); //아이디랑 비밀번호가 일치하지 않는다. 
			return map;
		}
	}
	
	/**
	 * 회원정보  수정함수 
	 * 
	 * @author : 정준일
	 * @since : 2017. 11.16.
	 * @param :  VO
	 * @return : ModelandView
	 */
	@RequestMapping("/modifyProc")
	public ModelAndView modifyProc(ProfileVO pVO,HttpSession session ){
		
		
		pVO.setNo((Integer)session.getAttribute("MNO"));//그 회원의 회원번호를 저장해주었다. 
		
		
		lService.memberModifyProc(pVO); 		
		System.out.println(pVO.getName()+"변경된 이름");
		System.out.println(pVO.getNewpw02()+"변경된 비번");
		System.out.println(pVO.getNo()+"번호");

		
		
		ModelAndView mv= new ModelAndView(); 
		mv.addObject("PVO", pVO); 

		mv.setViewName("Login/MyPage");
		return mv ;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
