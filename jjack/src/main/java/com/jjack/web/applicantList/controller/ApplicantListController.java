package com.jjack.web.applicantList.controller;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import com.jjack.web.applicantList.service.ApplicantListService;
import com.jjack.web.common.vo.*;
import com.jjack.web.util.*;

@Controller
@RequestMapping("/applicantList")
public class ApplicantListController {
	@Autowired
	ApplicantListService as;
	
	@RequestMapping("/ManageList")
	public ModelAndView ListManage(@RequestParam(value="edate", defaultValue="first") String edate,
			@RequestParam(value="mail", defaultValue="false") Boolean mail){
		//파라미터 mail : 메일발송여부
		// 처음 들어온 경우라면 edate를 설정해준다
		if(edate.equals("first")) {
			edate = as.getEdate();
		}
		// 이벤트 날짜, 기수 목록을 구한다
		List<ApplicantCountVO> elist = as.getEventList();
		// 날짜, 기수, 신청자 목록 등을 구한다
		ApplicantCountVO acvo = as.getApCount(edate);
		List<ApplicantListVO> wait = as.getWaitList(edate);
		List<ApplicantListVO> okMan = as.getOkManList(edate);
		List<ApplicantListVO> okWoman = as.getOkWomanList(edate);
		List<ApplicantListVO> denied =  as.getDeniedList(edate);

	
		// 파라미터에 넣고 뷰 호출
		ModelAndView mv = new ModelAndView();
		mv.addObject("edate", edate);
		mv.addObject("elist", elist);
		mv.addObject("numbers", acvo);
		mv.addObject("wait", wait);
		mv.addObject("okMan", okMan);
		mv.addObject("okWoman", okWoman);
		mv.addObject("denied", denied);
		mv.addObject("mail", mail);
		mv.setViewName("applicantList/applicantList");
		return mv;
	}
	
	// 상태 변경
	@RequestMapping("/changeCond")
	public ModelAndView comeProc(String edate, int ano, int nextStep){
		as.changeCond(ano, nextStep);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("ManageList.do");
		rv.addStaticAttribute("edate", edate);
		mv.setView(rv);
		return mv;
	}
	
	// 메일 보내기
	@RequestMapping("/mailing")
	public ModelAndView mailing(ApplicantListVO apvo, String edate) {
		System.out.println(apvo.getId() + "에게 메일 발송");
		jMailUtil.sendMail(apvo);
		Boolean mail = true;
		as.changeCond(apvo.getAno(), 3);
		ModelAndView mv = new ModelAndView();
		RedirectView rv = new RedirectView("ManageList.do");
		rv.addStaticAttribute("edate", edate);
		rv.addStaticAttribute("mail", mail);
		mv.setView(rv);
		return mv;
	}
	
}
