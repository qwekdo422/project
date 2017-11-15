package com.jjack.web.scheduler.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 관리자가 스케쥴을 관리하는 컨트롤러
 * @author : daeo
 * @since : 2017. 11. 15.	
 */
@Controller
@RequestMapping("/scheduler")
public class SchedulerContorller {

	/**
	 * 스케줄 등록
	 * @author : daeo
	 * @since : 2017. 11. 15.
	 * @param : 
	 * @return : void
	 */
	@RequestMapping("/writeForm")
	public void schduleWriteForm() {}
	
	/**
	 * 일정관리 목록
	 * @author : daeo
	 * @since : 2017. 11. 15.
	 * @param : 
	 * @return : void
	 */
	@RequestMapping("/list")
	public void schedulList() {}
	
	
}
