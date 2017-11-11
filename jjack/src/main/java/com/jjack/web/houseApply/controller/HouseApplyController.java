package com.jjack.web.houseApply.controller;

import java.io.IOException;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jjack.web.houseApply.service.CalendarService;

/**
 * 입소신청 컨트롤러
 * @author : daeo
 * @since : 2017. 11. 7.	
 */
@Controller
@RequestMapping("/houseApply")
public class HouseApplyController {
	
	@Autowired private CalendarService cService;
	
	@RequestMapping("/applyForm")
	public String applyForm(Model model) {
		JSONArray  cList = null;	
		try {
			cList = cService.getCalendar();
		} catch (IOException e) {e.printStackTrace();}
		model.addAttribute("CALENDAR", cList);
		return "./houseApply/applyForm";
	}

	@RequestMapping("/applicantList")
	public void applicantList(ApplicantList al) {
		al.applist();
	}
	
	@RequestMapping("/test")
	public String calendarTest(Model model) {
		JSONArray  cList = null;	
		try {
			cList = cService.getCalendar();
		} catch (IOException e) {e.printStackTrace();}
		model.addAttribute("CALENDAR", cList);
		return "houseApply/test";
	}
	
}
