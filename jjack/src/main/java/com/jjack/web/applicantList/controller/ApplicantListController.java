package com.jjack.web.applicantList.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.jjack.web.common.vo.ApplicantListVO;
import com.jjack.web.util.jMailUtil;

@Controller
@RequestMapping("/applicantList")
public class ApplicantListController {
	
	@RequestMapping("/ManageList")
	public String ListManage(ApplicantListVO apvo, @RequestParam(value="mail", required=false) Boolean mail){
		//mail : 메일발송여부
		
		
		
		
		
		return "applicantList/applicantList";
	}
	
	@RequestMapping("/okMailing")
	public void okMailing(ApplicantListVO apvo) {
		
	}
	
}
