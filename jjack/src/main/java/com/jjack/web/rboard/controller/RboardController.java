package com.jjack.web.rboard.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jjack.web.common.vo.NboardVO;
import com.jjack.web.common.vo.RboardVO;
import com.jjack.web.rboard.service.RboardService;
import com.jjack.web.util.FileUtil;
@Controller
@RequestMapping("/Rboard")
public class RboardController {

	@Autowired
	private RboardService rService; 
	
	//후기 게시판 목록보기
	@RequestMapping("/RboardList")
	public ModelAndView rboardList(HttpSession session){
		
		ModelAndView mv= new ModelAndView(); 
		
		
		mv.setViewName("Rboard/RboardList");
		return null; 
	}
	
	
	//후기 게시판 글쓰기 폼 
	@RequestMapping("/RboardForm")
	public ModelAndView rboardWriteForm(){
	ModelAndView mv= new ModelAndView(); 
	mv.setViewName("Rboard/RWriteForm");
	return mv; 
		
	}
	
	//후기 게시판 글쓰기 실행함수 
	@RequestMapping("/RboardProc")
	public ModelAndView rboardWriteProc(RboardVO rVO){
		
		HashMap map= new HashMap(); 
		map.put("rtitle",rVO.getRtitle()); 
		map.put("rcontents",rVO.getRcontents()); 
		
		rService.rboardWrite(map);
		
		ModelAndView mv= new ModelAndView(); 
		mv.setViewName("Rboard/RboardList");
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
	public ModelAndView rboardView(RboardVO rVO,  @RequestParam(value="rno") int rno){
		
		
		RboardVO VO=rService.rboardView(rno); 
		
		ModelAndView mv= new ModelAndView(); 
		mv.addObject("VO",VO); 
		mv.setViewName("Nboard/NboardView");
		return mv; 
		
	}
	
	
	
	
}
