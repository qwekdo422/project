package com.jjack.web.nboard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jjack.web.common.vo.NboardVO;
import com.jjack.web.common.vo.ProfileVO;
import com.jjack.web.nboard.service.NboardService;
import com.jjack.web.util.PageUtil;

@Controller
@RequestMapping("/Nboard")
public class NboardController {

	
	@Autowired
	private NboardService nService; 
	
	
	
	//공지사항 목록보기 
	@RequestMapping("/NboardList")
	public ModelAndView nboardList(@RequestParam(value="nowPage", defaultValue="1")int nowPage, HttpSession session){
		ModelAndView mv= new ModelAndView();

		
		//세션을 받는다. 
		String admin=(String)session.getAttribute("UID"); 


		//그 게시물의 모든 데이터를 가지고 와서 
		int total= nService.getTotalService(); 
		System.out.println("총 데이터의 갯수"+ total);

		//페이징 처리 해주고 
		PageUtil pInfo= new PageUtil(nowPage, total); 
		//페이지에 해당하는 목록만 뽑는다. 
		ArrayList list=nService.nboardList(nowPage, pInfo); 
		
		mv.addObject("startPage",pInfo.getStartPage());
		mv.addObject("endPage",pInfo.getEndPage());
		mv.addObject("nowPage",pInfo.getNowPage()); 
		mv.addObject("totalPage",pInfo.getTotalPage());
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

if(id !=null){//즉, 로그인 한 상태인 경우는 조회수 올리기 로직 처리후 목록보기 
	
	boolean isHit =nService.isHitNow(id, nVO.getNno());
	//true의 경우의수 		:	 한번도 게시글을 누르지 않은 계정
	//true의 경우의수2	    :     누르적은 있지만 다른글을 누르지 않은 경우 
	//false의 경우의수 		: 		누른적도 있고 그것을 눌렀을때 이미 눌렀던 게시글일 경우 
	if(isHit ==true){
		nService.updateHit( nVO.getNno());//게시물의 조회수를 증가시켜라 
	
		//조회수를 증가시키는 로직을 먼저 작성 한 후에 
		//상세보기 뷰를 부르면 된다. 
		ModelAndView mv= new ModelAndView(); 
		RedirectView rv= new RedirectView("../Nboard/NboardView.do");
		rv.addStaticAttribute("nno",nVO.getNno());
		mv.setView(rv);
		return mv; 
	}
}// end of if 

	//로그인 하지 않은 상태에서는 조회수를 올리지 않고 그냥 상세보기 
	ModelAndView mv= new ModelAndView(); 
	RedirectView rv= new RedirectView("../Nboard/NboardView.do");
	rv.addStaticAttribute("nno",nVO.getNno());

	mv.setView(rv);
	return mv; 
}
	


//공지사항 상세보기 
@RequestMapping("/NboardView")
public ModelAndView nboardView(NboardVO nVO , @RequestParam(value="nno") int nno){


	//세션을 이용하지 않고 게시물 번호를 받아오기 위해서는 어떻게 해야 할까? 
	//requestparameter로 받자. 
	NboardVO preNext=nService.preNext(nno); 
	NboardVO VO=nService.nBoardView(nno); 
	ModelAndView mv= new ModelAndView(); 
	
	mv.addObject("PRENEXT",preNext); 
	mv.addObject("VO",VO); 
	mv.setViewName("Nboard/NboardView");
	return mv; 
}
	


//공지사항 삭제하기
@RequestMapping("/NboardDelete")
public ModelAndView nboardDelete(@RequestParam(value="nno") int nno){
	ModelAndView mv= new ModelAndView(); 

	
	nService.nBoardDelete(nno);
	RedirectView rv= new RedirectView("../Nboard/NboardList.do");
	mv.setView(rv);
	return mv; 
}


//공지사항 수정하기 폼 
@RequestMapping("/NboardModify")
public ModelAndView nboardModify(@RequestParam(value="nno") int nno){
	
	NboardVO nVO=nService.nBoardModify(nno); 
	ModelAndView mv= new ModelAndView(); 
	mv.addObject("VO",nVO); 
	System.out.println("공지사항 수정하기 폼"+nVO.getNcontents());
	mv.setViewName("Nboard/NboardModifyForm");
	
	
	return mv; 
}

//공지사항 수정하기 실행함수 
//수정하기 폼에서 그 폼에 있는 데이터를 바다야 한다. 
@RequestMapping("/NboardModifyProc")
public ModelAndView nboardModifyProc(NboardVO nVO){
	
HashMap map=new HashMap();
map.put("title", nVO.getNtitle()); 
map.put("contents", nVO.getNcontents()); 
map.put("nno",nVO.getNno()); 



nService.nBoardModifyProc(map);

ModelAndView mv= new ModelAndView(); 
RedirectView rv= new RedirectView("../Nboard/NboardList.do"); 
//rv.addStaticAttribute("VO",nVO);
mv.setView(rv);
//mv.setViewName("Nboard/NboardList");
	
	return mv; 
}



//공지사항 검색하기 연습해보자. 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
