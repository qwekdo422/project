package com.jjack.web.scheduler.controller;


import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
			int mNo = (Integer)session.getAttribute("MNO");
			//	회원의 정보를 뷰에 포워딩.
			ProfileVO member = lService.mModify(mNo);
			//	현재년도
			int year = Calendar.getInstance().get(Calendar.YEAR);
			//	생년
			int birth = (Integer.parseInt(member.getBirth().toString().split("-")[0]));
			//	나이
			member.setAge(year - birth);
			System.out.println();
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
	 * 입소신청관리 함수
	 * @author : daeo
	 * @since : 2017. 11. 20.
	 * @param : SchedulerVO vo
	 * @param : name, tel, loc, file, eventdate, session(파일저장 경로를 위한 session)
	 * @return : String	/ redirect: list.do?status=U / 사용자
	 */
	@RequestMapping("/applyProc")
	public String ghApplyProc(SchedulerVO vo, HttpSession session) {
		scService.ghApply(vo, session);
		return "redirect:./list.do?status=U";
	}
}
