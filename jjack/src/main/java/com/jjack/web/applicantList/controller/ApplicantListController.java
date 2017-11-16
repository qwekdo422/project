package com.jjack.web.applicantList.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.jjack.web.applicantList.service.ApplicantListService;
import com.jjack.web.common.vo.*;
import com.jjack.web.util.jMailUtil;

@Controller
@RequestMapping("/applicantList")
public class ApplicantListController {
	@Autowired
	ApplicantListService as;
	
	@RequestMapping("/ManageList")
	public String ListManage(ApplicantListVO alvo, @RequestParam(value="edate", defaultValue="null") String edate,
			@RequestParam(value="mail", required=false) Boolean mail){
		//mail : 메일발송여부
		as.getApCount(edate);
		
		
		
		
		return "applicantList/applicantList";
	}
	
	@RequestMapping("/mailing")
	public void okMailing(ApplicantListVO apvo) {
		
	}
	
}
