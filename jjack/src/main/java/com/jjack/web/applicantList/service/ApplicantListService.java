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
	
	// 처음에 보여줄 날짜 구하기
	public String getEdate() {
		return aDAO.getEdate();
	}
	
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
	
	// 모든 이벤트날짜, 기수 목록 구하기
	public List<ApplicantCountVO> getEventList(){
		return aDAO.getEventList();
	}
	
	// 신청자 입소승인하기
	public void comeProc(int ano) {
		aDAO.comeProc(ano);
	}
	
	// 신청자 입소거부하기
	public void denyProc(int ano) {
		aDAO.denyProc(ano);
	}
		
		
}
