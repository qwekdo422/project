package com.jjack.web.nboard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jjack.web.common.vo.NboardVO;
import com.jjack.web.common.vo.ProfileVO;
import com.jjack.web.nboard.service.NboardService;

@Controller
@RequestMapping("/Nboard")
public class NboardController {

	
	@Autowired
	private NboardService nService; 
	
	
	
	//공지사항 목록보기 
	@RequestMapping("/NboardList")
	public ModelAndView nboardList(ProfileVO pVO, HttpSession session,NboardVO nVO){
		ModelAndView mv= new ModelAndView();

		
		//로그인 했는데 그 로그인 한사람이 관리자면 
		//관리자 권한을 부여하기 위한 로직 수행 
		String admin=(String)session.getAttribute("UID"); 
		if(admin.equals("admin")){
			mv.addObject("ADMIN", admin); 
		}
		

		//그 게시물의 isShow필드가	'Y'	라면 
		//그 게시물을 가지고 와서 뷰에 보내주는 로직 수행 
		String isShow="Y"; 
		ArrayList list =nService.nboardList(isShow); 
		mv.addObject("NLIST",list); 
		mv.setViewName("Nboard/NboardList");
		return mv; 

		
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
		
		nService.nBoardInsert(nVO);
		
		//글을 쓰고나서 목록보기로 돌아간다.
		ModelAndView mv= new ModelAndView();
		RedirectView rv= new RedirectView("../Nboard/NboardList.do"); 
		mv.setView(rv);
		return mv; 
	}
	
	
	
	
	
//공지사항 조회수 올리기 실행 함수 
@RequestMapping("/HitUpProc")
public ModelAndView hitUpProc(HttpSession session, NboardVO nVO){
	//조회수 처리 여부를 판단
	//(즉, 그 아이디로 각 게시물에 조회수를 1씩만 올리게)
	//(그 아이디로 이미 본 게시물을 보았다면  조회수 올리는 질의문을 실행 안시키게 막아야 한다.)
	//(조회수 판단을 하기 위해서는 누가 본 글인지 세션에서 알아야 한다.)
	String id=(String)session.getAttribute("UID"); 
	
	System.out.println( nVO.getNno()+"EHLSI>?");
	
	
	

	

	boolean isHit =nService.isHitNow(id, nVO.getNno());
	//true의 경우의수 		:	 한번도 게시글을 누르지 않은 계정
	//true의 경우의수2	    :     누르적은 있지만 다른글을 누르지 않은 경우 
	//false의 경우의수 		: 		누른적도 있고 그것을 눌렀을때 이미 눌렀던 게시글일 경우 
	if(isHit ==true){
		nService.updateHit( nVO.getNno());
	}
	
	
	
	
	
	
	//조회수를 증가시키는 로직을 먼저 작성 한 후에 
	//상세보기 뷰를 부르면 된다. 
	ModelAndView mv= new ModelAndView(); 
	RedirectView rv= new RedirectView("../main/mainForm.do");
	mv.setView(rv);
	return mv; 
	
}
	

//공지사항 상세보기 
@RequestMapping("/NboarView")
public ModelAndView nboardView(){
	
	
	
	return null; 
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
