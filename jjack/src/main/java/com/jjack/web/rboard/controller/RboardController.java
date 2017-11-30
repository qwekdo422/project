package com.jjack.web.rboard.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jjack.web.common.vo.NboardVO;
import com.jjack.web.common.vo.RboardVO;
import com.jjack.web.rboard.service.RboardService;
import com.jjack.web.util.FileUtil;
import com.jjack.web.util.PageUtil;
import com.jjack.web.util.StringUtil;
@Controller
@RequestMapping("/Rboard")
public class RboardController {

	@Autowired
	private RboardService rService; 
	
	//후기 게시판 목록보기
	@RequestMapping("/RboardList")
	public ModelAndView rboardList(@RequestParam(value="nowPage" ,defaultValue="1" ) int nowPage){
		
		System.out.println("현재페이지 = "+nowPage);
		
		ModelAndView mv= new ModelAndView(); 
//		String id= (String)session.getAttribute("UID"); 
//		System.out.println("후기 게시판 목록보기" + id);
//		int mno= (Integer)session.getAttribute("MNO"); 
//		System.out.println("후기 게시판 목록보기"+mno);



//		if(id==null){ //세션이 없으면 로그인 폼으로 가라 
//			RedirectView rv= new RedirectView("../Login/LoginForm.do");
//			mv.setView(rv);
//			return mv; 
//		}

		int total=rService.getTotalList(); //총 데이터의 갯수를 받아오고
		PageUtil pInfo= new PageUtil(nowPage, total);	//페이징 처리 
		List list= rService.rboardList(nowPage, pInfo); 
		
		//기수랑 닉네임 가져오기 위한 질의문 실행


		mv.addObject("startPage",pInfo.getStartPage());
		mv.addObject("endPage",pInfo.getEndPage());
		mv.addObject("nowPage",pInfo.getNowPage()); 
		mv.addObject("totalPage",pInfo.getTotalPage());
		mv.addObject("RLIST",list); 
		mv.setViewName("Rboard/RboardListback");
		return mv; 
	}
	
	//후기 게시판 검색 결과 리스트 가져오기 
	
	/*
	public ModelAndView rboardSearch(@RequestParam(value="searchnowPage" , defaultValue="1") int searchnowPage , RboardVO rVO){

		//검색결과에 대한 총 데이터의 갯수를 가져오고
		int subjectTotal = rService.subjectTotalList(rVO); 
		
		System.out.println("검색결과에 대한 총 데이터 개수 = " + subjectTotal) ;
		
		//검색결과에대한 데이터의 리스트결과 
		ModelAndView mv= new ModelAndView(); 
		PageUtil pInfo= new PageUtil(searchnowPage, subjectTotal);  //페이징 처리
		ArrayList list= rService.getRboardSearch(rVO, pInfo); 
		mv.addObject("startPage",pInfo.getStartPage());
		mv.addObject("endPage",pInfo.getEndPage());
		mv.addObject("nowPage",pInfo.getNowPage()); 
		mv.addObject("totalPage",pInfo.getTotalPage());
		mv.addObject("SLIST",list); 
		mv.addObject("TOTAL",subjectTotal);
		mv.setViewName("Rboard/RboardSearchList");
		return mv; 
	}
	*/
	@RequestMapping("/RboardSearch")
	public ModelAndView rboardSearch(HttpSession session,RboardVO rVO){
		if(rVO.getNowPage() == 0) {
			rVO.setNowPage(1);
		}
		boolean	isTarget = StringUtil.isNull(rVO.getKind());
		if(isTarget == true) {
			//	비어있으면....
			rVO.setKind((String) session.getAttribute("kind"));
			rVO.setRsearch((String) session.getAttribute("rsearch"));
		}
		//	★
		//	다음을 위해서 세션에 필요한 데이터를 입력해 놓아야 한다.
		session.setAttribute("kind" , rVO.getKind());
		session.setAttribute("rsearch" , rVO.getRsearch());
		
		//	데이터베이스에서 검색하자.
		PageUtil	pInfo = rService.getSearchTotal(rVO);
		ArrayList	list = rService.getSearch(rVO, pInfo);
		
		System.out.println("사이즈 = "+list.size());
		
		//	뷰를 주세요
		ModelAndView	mv = new ModelAndView();
		mv.addObject("PINFO", pInfo);
		mv.addObject("SLIST", list);
		mv.setViewName("Rboard/RboardSearchList");
	
		return mv;
	
	}

	
	
	
	
	
	//후기 게시판 글쓰기 폼 
	@RequestMapping("/RboardForm")
	public ModelAndView rboardWriteForm(HttpSession session){
	String id=(String)session.getAttribute("UID"); 
		
		ModelAndView mv= new ModelAndView(); 
	
	mv.addObject("writer", id); 
	mv.setViewName("Rboard/RWriteForm");
	return mv; 
		
	}
	
	//후기 게시판 글쓰기 실행함수 
	@RequestMapping("/RboardProc")
	public ModelAndView rboardWriteProc(RboardVO rVO , HttpSession session){
		
		String writer=rVO.getRid(); 
		int mno=(Integer)session.getAttribute("MNO"); 

		HashMap map= new HashMap(); 
		map.put("rtitle",rVO.getRtitle()); 
		map.put("rcontents",rVO.getRcontents()); 
		map.put("mno",mno); 
		map.put("rcontents", rVO.getRcontents()); 
		rService.rboardWrite(map);
		System.out.println(mno+ "목록보기 리스트");
		rService.changAcond(mno);
		System.out.println("왜 안돼?");

		session.setAttribute("Auth",0);
		ModelAndView mv= new ModelAndView(); 
	 
		RedirectView rv= new RedirectView("../Rboard/RboardList.do");

		mv.setView(rv);

//		mv.setViewName("Rboard/ImsiWriteForm");
		
		return mv; 

	}

	
	//사진 업로드 폼 요청 처리 함수 
	@RequestMapping("/ImageUploadForm")
	public ModelAndView imageUploadForm() {
		ModelAndView mv= new ModelAndView(); 
		mv.setViewName("Rboard/ImageUploadForm");
		return mv; 
	}
	
	//사진 업로드 실행 함수 
	@RequestMapping("/ImageUploadProc")
	public ModelAndView imageUploadProc(@RequestParam("files") MultipartFile files, HttpSession session) {
																									//어떤 요소를 파라메터로 받는거냐??
																									//type이냐? id냐? name이냐?
		//첨부된 파일을 받아서 우리 서버에 저장한다. 
		String path=session.getServletContext().getRealPath("seupload"); 
		System.out.println("파일이 저장된 경로 = " + path);
		String name= files.getOriginalFilename();
		
		String saveName= FileUtil.upload(files, name, path); 
		System.out.println("복사된 파일의 이름? = "+ saveName);
		
		ModelAndView mv= new ModelAndView();
		mv.addObject("PATH",path); 
		mv.addObject("NAME",saveName); 
		mv.setViewName("Rboard/ImageUploadProc");
		return mv; 
	}
	
	
	//리뷰 게시판 조회수 올리기 실행함수 
	@RequestMapping("/rHitUpProc")
	public ModelAndView rhitUpProc(HttpSession session, RboardVO rVO){
		
		String id=(String)session.getAttribute("UID"); 

		if(id !=null){//로그인 한 상태에서~ 
			
		boolean isHit = rService.isHitNow(id, rVO.getRno());
	
			if(isHit==true){
					rService.updateHit(rVO.getRno());//조회수를 증가시켜라 
						
				//조회수를 증가시키는 로직을 먼저 작성 한 후에
				//상세보기 뷰를 부르면 된다. 
				ModelAndView mv= new ModelAndView(); 
				RedirectView rv= new RedirectView("../Rboard/RboardView.do"); 				
				rv.addStaticAttribute("rno",rVO.getRno());
				mv.setView(rv);
				return mv; 		
			}
	}
		//로그인 하지 않은 상태에서는 조회수를 올리지 않고 그냥 상세보기 
		ModelAndView mv= new ModelAndView(); 
		RedirectView rv= new RedirectView("../Rboard/RboardView.do"); 				
		rv.addStaticAttribute("rno",rVO.getRno());
		mv.setView(rv);
		return mv; 		

}
	
	
	//리뷰 상세보기 
	@RequestMapping("/RboardView")
	public ModelAndView rboardView(RboardVO rVO,  @RequestParam(value="rno") int rno,HttpSession session){
	
		ModelAndView mv= new ModelAndView(); 
	String uid=(String)session.getAttribute("UID"); 


		ArrayList list=rService.reList(rno); //리플 리스트 가져오기 위한 로직 
		RboardVO VO=rService.rboardView(rno);  //게시물 상세보기 로직 
		System.out.println(session.getAttribute("MNO") + "회원번호");
		System.out.println(VO.getWriterno() + "작성자 회원번호");
		RboardVO PRENEXT=rService.preNext(rno); 

	
		mv.addObject("VO",VO); 
		mv.addObject("RE",list); 
		mv.addObject("PRENEXT", PRENEXT);
		mv.setViewName("Rboard/RboardView");
		return mv; 
		
	}
	
	
	//댓글 작성 함수 
	@RequestMapping("/reContentsProc")
	public ModelAndView reContentsProc(RboardVO rVO, HttpSession session){
		int mno=(Integer)session.getAttribute("MNO"); 
		rVO.setMno(mno);
		
		rService.reContentsProc(rVO);
		
		ModelAndView mv= new ModelAndView(); 
		RedirectView rv= new RedirectView("../Rboard/RboardView.do");
		rv.addStaticAttribute("rno",rVO.getRno());
		mv.setView(rv);
		return mv; 
	}
	
	//댓글 수정하기 
	@RequestMapping("/reModify")
	public ModelAndView reModify(RboardVO rBoard){
		
		rService.reModifycontents(rBoard);
		ModelAndView mv= new ModelAndView(); 
		RedirectView rv= new RedirectView("../Rboard/RboardView.do");
		rv.addStaticAttribute("rno",rBoard.getRno());
		mv.setView(rv);

		return mv; 
	}
	
	//댓글 삭제하기 
	@RequestMapping("/reDelete")
	public ModelAndView reDelete(RboardVO rVO){
		rService.replyDelete(rVO);
		ModelAndView mv=new ModelAndView(); 
		RedirectView rv= new RedirectView("../Rboard/RboardView.do");
		rv.addStaticAttribute("rno",rVO.getRno());
		mv.setView(rv);
		return mv;
	}
	
	
	//리뷰 게시판 삭제하기 
	@RequestMapping("/RboardDelete")
	public ModelAndView rbaordDelete(@RequestParam(value="rno") int rno){
		
		rService.rbaordDelete(rno);//게시글 삭제하기 
		ModelAndView mv= new ModelAndView(); 
		RedirectView rv= new RedirectView("../Rboard/RboardList.do");
		mv.setView(rv);
		return mv; 
	}

	
	//리뷰 게시판 수정폼
	@RequestMapping("/RboardModify")
	public ModelAndView rbaordModify(@RequestParam(value="rno") int rno){
		ModelAndView mv= new ModelAndView(); 
		RboardVO rVO = rService.rboardModify(rno);
		rVO.setRno(rno);
		System.out.println(rVO.getRno() + "게시물 번호냐?");

		mv.addObject("rVO", rVO);
		mv.setViewName("Rboard/RWriteFormModify");
		return mv; 
	}
	
	
	//리뷰 게시판 수정하기 실행함수 
	@RequestMapping("/RbaordProc")
	public ModelAndView rboardModifyProc(RboardVO rVO){
		System.out.println(rVO.getRcontents()+"내용");
		System.out.println(rVO.getRno()+"게시물 번호");
		rService.rboardModifyProc(rVO); 

		
		
		ModelAndView mv= new ModelAndView(); 	 
		RedirectView rv= new RedirectView("../Rboard/RboardList.do");
		mv.setView(rv);

//		mv.setViewName("Rboard/ImsiWriteForm");
		
		return mv; 
		
		
	}
	
	
	
}
