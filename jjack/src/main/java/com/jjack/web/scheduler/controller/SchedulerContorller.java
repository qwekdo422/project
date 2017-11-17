package com.jjack.web.scheduler.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjack.web.common.vo.SchedulerVO;
import com.jjack.web.scheduler.service.SchedulerService;

/**
 * 관리자가 스케쥴을 관리하는 컨트롤러
 * @author : daeo
 * @since : 2017. 11. 15.	
 */
@Controller
@RequestMapping("/scheduler")
public class SchedulerContorller {
	
	@Autowired private SchedulerService scService;
	
	/**
	 * 행사일정 목록
	 * @author : daeo
	 * @since : 2017. 11. 15.
	 * @param : 
	 * @return : JSONARRY	/	행사일정들을 json형태로 저장
	 */
	@RequestMapping("/list")
	public String scheduleList(Model model) {
		model.addAttribute("SCHEDULE", scService.getSchedule());
		return "scheduler/list";
	}
	
	/**
	 * 행사일정 등록
	 * @author : daeo
	 * @since : 2017. 11. 16.
	 * @param : SchedulerVO
	 * @param : gisoo, eventdate, eventend, loc, age, title, contents
	 * @return : String
	 */
	@RequestMapping("/writeProc")
	public String schduleWriteProc(SchedulerVO vo) {
		scService.writeSchedule(vo);
		return "redirect:./list.do";
	}
	
	/**
	 * 행사일정 수정
	 * @author : daeo
	 * @since : 2017. 11. 17.
	 * @param : SchedulerVO
	 * @param : gisoo, eventdate, eventend, loc, age, title, contents
	 * @return : String
	 */
	@RequestMapping("/modifyProc")
	public String schedulerModifyProc(SchedulerVO vo) {
		scService.modifySchedule(vo);
		return "redirect:./list.do";
	}
	
	/**
	 * 실시간으로 기수 중복체크하는 함수
	 * @author : daeo
	 * @since : 2017. 11. 17.
	 * @param :	gisoo 
	 * @return : int
	 */
	@RequestMapping("/gisooCheck")
	@ResponseBody
	public int gisooCheck(int gisoo) {
		return scService.gisooCheck(gisoo);
	}
}
