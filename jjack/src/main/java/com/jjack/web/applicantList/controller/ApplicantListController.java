package com.jjack.web.applicantList.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jjack.web.common.vo.ApplicantListVO;
import com.jjack.web.util.jMailUtil;

@Controller
@RequestMapping("/applicantList")
public class ApplicantListController {
	
	@RequestMapping("/ListManage")
	public void ListManage(ApplicantListVO apvo, Boolean mail){
		//mail : 메일발송완료
		
	}
	
	@RequestMapping("/okMailing")
	public void okMailing(ApplicantListVO apvo) {
		
	}
	
}
