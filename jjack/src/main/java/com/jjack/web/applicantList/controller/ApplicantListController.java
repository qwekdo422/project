package com.jjack.web.applicantList.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jjack.web.common.vo.ApplicantListVO;
import com.jjack.web.util.jMailUtil;

@Controller
public class ApplicantListController {
	@RequestMapping("/applicantList/applicantList")
	public void ApplicantList(ApplicantListVO apvo){
		
	}
}
