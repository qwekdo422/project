package com.jjack.web.applicantList.dao;
import com.jjack.web.common.vo.*;
import java.util.*;

public interface ApplicantListDAO {
	// 입소날짜, 기수, 신청자 수
	public ApplicantCountVO getApCount(String edate);
	// 승인대기자 목록
	public List<ApplicantListVO> getWaitList(String edate);
	// 승인된 남자 목록
	public List<ApplicantListVO> getOkManList(String edate);
	// 승인된 여자 목록
	public List<ApplicantListVO> getOkWomanList(String edate);
	// 거부된 신청자 목록
	public List<ApplicantListVO> getDeniedList(String edate);
}
