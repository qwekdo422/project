package com.jjack.web.applicantList.service;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jjack.web.applicantList.dao.ApplicantListDAO;
import com.jjack.web.common.vo.*;

@Service
public class ApplicantListService {
	@Autowired
	ApplicantListDAO aDAO;
	
	// 입소날짜, 기수, 신청자 수 구하기
	public ApplicantCountVO getApCount(String edate) {
		return aDAO.getApCount(edate);
	}

	// 승인대기중인 신청자 목록 구하기
	public List<ApplicantListVO> getWaitList(String edate) {
		return aDAO.getWaitList(edate);
	}
	
	// 승인된 남자 목록 구하기
	public List<ApplicantListVO> getOkManList(String edate) {
		return aDAO.getOkManList(edate);
	}
	
	// 승인된 여자 목록 구하기
	public List<ApplicantListVO> getOkWomanList(String edate) {
		return aDAO.getOkWomanList(edate);
	}
	
	// 거부된 신청자 목록 구하기
	public List<ApplicantListVO> getDeniedList(String edate) {
		return aDAO.getDeniedList(edate);
	}
	
}