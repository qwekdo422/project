package com.jjack.web.scheduler.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	 * 일정 등록
	 * @author : daeo
	 * @since : 2017. 11. 15.
	 * @param : 
	 * @return : void
	 */
	@RequestMapping("/writeForm")
	public void schduleWriteForm() {}
	
	/**
	 * 일정목록
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
	
	
}
