package com.jjack.web.scheduler.controller;


import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjack.web.common.vo.GuestApplyVO;
import com.jjack.web.common.vo.ProfileVO;
import com.jjack.web.common.vo.SchedulerVO;
import com.jjack.web.login.service.LoginService;
import com.jjack.web.scheduler.service.SchedulerService;

/**
 * 관리자가 스케쥴을 관리하는 컨트롤러
 * @author : daeo
 * @since : 2017. 11. 15.	
 */
@Controller
@RequestMapping("/scheduler")
public class SchedulerContorller {
	//	스케줄관리 서비스
	@Autowired private SchedulerService scService;
	//	회원정보 서비스
	@Autowired private LoginService lService;
	
	/**
	 * 행사일정 목록 (관리자, 사용자)
	 * @author : daeo
	 * @since : 2017. 11. 15.
	 * @param : status / 관리자:ADMIN, 사용자:USER
	 * @return : JSONARRY	/	행사일정들을 json형태로 저장
	 */
	@RequestMapping("/list")
	public String scheduleList(String status, Model model, HttpSession session) {
		//	행사 일정정보 조회
		model.addAttribute("SCHEDULE", scService.getSchedule());
		//	관리자일 경우 일정관리
		if(status.equals("A")) {
			model.addAttribute("status", "ADMIN");
			return "scheduler/list";
		} else {
			//	사용자일 경우
			//	회원번호를 가져온다.
			Object oMNO = session.getAttribute("MNO");
			//	잘못된 접근처리 (로그인 안하고 url로 접근시)
			if(oMNO == null) {
				return "common/error";
			}
			int mNo = (Integer) oMNO;
			
			//	회원의 정보를 뷰에 전달
			ProfileVO member = lService.mModify(mNo);
			//	현재년도
			int year = Calendar.getInstance().get(Calendar.YEAR);
			//	생년
			int birth = (Integer.parseInt(member.getBirth().toString().split("-")[0]));
			//	나이
			member.setAge(year - birth);
			model.addAttribute("member", member);
			model.addAttribute("status", "USER");
			return "scheduler/applyForm";
		}
	}
	
	/**
	 * 행사일정 등록 (관리자)
	 * @author : daeo
	 * @since : 2017. 11. 16.
	 * @param : SchedulerVO
	 * @param : gisoo, eventdate, eventend, loc, age, title, contents
	 * @return : String	/ redirect : list.do
	 */
	@RequestMapping("/writeProc")
	public String schduleWriteProc(SchedulerVO vo) {
		scService.writeSchedule(vo);
		return "redirect:./list.do?status=A";
	}
	
	/**
	 * 행사일정 수정 (관리자)
	 * @author : daeo
	 * @since : 2017. 11. 17.
	 * @param : SchedulerVO
	 * @param : gisoo, eventdate, eventend, loc, age, title, contents
	 * @return : String	/ redirect : list.do
	 */
	@RequestMapping("/modifyProc")
	public String scheduleModifyProc(SchedulerVO vo) {
		scService.modifySchedule(vo);
		return "redirect:./list.do?status=A";
	}
	
	/**
	 * 행사일정 삭제 (관리자)
	 * @author : daeo
	 * @since : 2017. 11. 20.
	 * @param : eventdate	/	행사 시작일
	 * @return : String	/ redirect : list.do
	 */
	@RequestMapping("/delete")
	public String scheduleDelete(String eventdate) {
		scService.deleteSchedule(eventdate);
		return "redirect:./list.do?status=A";
	}
	
	/**
	 * 실시간으로 기수 중복체크하는 함수 (관리자)
	 * @author : daeo
	 * @since : 2017. 11. 17.
	 * @param :	gisoo 
	 * @return : int	/	1:중복된 기수존재, 0:중복되지않는 기수
	 */
	@RequestMapping("/gisooCheck")
	@ResponseBody
	public int gisooCheck(int gisoo) {
		return scService.gisooCheck(gisoo);
	}
	
	/**
	 * 입소신청처리 함수
	 * @author : daeo
	 * @since : 2017. 11. 20.
	 * @param : SchedulerVO vo
	 * @param : name, tel, loc, file, eventdate, session(파일저장 경로를 위한 session)
	 * @return : String	/ redirect: list.do?status=U / 사용자
	 */
	@RequestMapping("/applyProc")
	public String ghApplyProc(GuestApplyVO vo, HttpSession session) {
		System.out.println("입소신청 컨트롤러 진입");
		scService.ghApply(vo, session);
		return "redirect:./list.do?status=U";
	}
	
	/**
	 * 입소 신청서 정보 조회 함수
	 * @author : daeo
	 * @since : 2017. 11. 21.
	 * @param : eventdate(이벤트 시작일), sesseion (회원번호를 사용하기위한 session)
	 * @return : GuestApplyVO /	입소신청서 정보
	 */
	@RequestMapping("/applyInfo")
	@ResponseBody
	public GuestApplyVO GeustApplyInfo(String eventdate, HttpSession session) {
		//	게스트하우스 신청데이터
		return scService.getApplyInfo(eventdate, session);
	}
	
	/**
	 * 입소 신천서 수정
	 * @author : daeo
	 * @since : 2017. 11. 22.
	 * @param : GuestApplyVO(입소신청 수정정보), session
	 * @return : String	/ redirect: list.do?status=U / 사용자
	 */
	@RequestMapping("/applyModify")
	public String appModifyProc(GuestApplyVO vo, HttpSession session) {
		scService.applyModify(vo, session);
		return "redirect:./list.do?status=U";
	}
	/**
	 * 입소취소
	 * @author : daeo
	 * @since : 2017. 11. 22.
	 * @param : aNo	/ 입소 신청 인덱스
	 * @return : String	/ redirect: list.do?status=U / 사용자
	 */
	@RequestMapping("/applyCondStatus")
	public String condModify(int aNo) {
		scService.condModify(aNo);
		return "redirect:./list.do?status=U";
	}
	
	
}
