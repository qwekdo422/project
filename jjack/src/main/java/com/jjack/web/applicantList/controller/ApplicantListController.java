package com.jjack.web.applicantList.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.jjack.web.mail.MailVO;
import com.jjack.web.mail.jMail;

@Controller
public class ApplicantListController {
	@RequestMapping("/applicantList/applicantList")
	public void ApplicantList(MailVO mvo){
		// jMail.sendMail(mvo);
	}
}
