package com.maxstudy.management.service;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
/**
 * 직원교육관리 VO
 * @author	: 김대오
 * @date	: 2017. 12. 27.
 */
public class ManagementVO {
	private int rno;				//	전체컬럼 개수
	private int m_no;				//	메인테이블 인덱스
	private int s_no;				//	서브테이블 인덱스
	private String m_name;			//	이름
	private Date m_startdate;		//	교육시작일
	private Date m_enddate;			//	교육종료일
	private String m_title;			//	교육과정명
	private String m_content;		//	교육내용
	private String m_evaluation;	//	평가
	private String m_status;		//	합격여부
	private String m_comment;		//	비고
	private int[] ch_box;			//	삭제할 번호들을 담을 변수
	private MultipartFile excelFile;//	엑셀임포트 파일
	// 검색
	private String searchName;		//	검색이름
	private String searchStartDate;	//	검색시작일
	private String searchEndDate;		//	검색종료일
	private String searchTitle;		//	검색교육과장
	private String searchEvaluation;//	검색평가
	private List<String> searchStatus;	//	검색합격여부
	private int nowPage;			// 	현재페이지
	private int start;				//	페이지 시작로우
	private int end;				//	페이지 종료로우
	private String searchIN;		// 	검색으로 컨트롤러 진입할 경우 ("Y")
	private String requestKey;		// 	요청 (updateForm : 수정폼)
	
	public ManagementVO() {}
	
	public String getRequestKey() {
		return requestKey;
	}

	public void setRequestKey(String requestKey) {
		this.requestKey = requestKey;
	}

	public String getSearchIN() {
		return searchIN;
	}

	public void setSearchIN(String searchIN) {
		this.searchIN = searchIN;
	}



	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getSearchName() {
		return searchName;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearchStartDate() {
		return searchStartDate;
	}

	public void setSearchStartDate(String searchStartDate) {
		this.searchStartDate = searchStartDate;
	}

	public String getSearchEndDate() {
		return searchEndDate;
	}

	public void setSearchEndDate(String searchEndDate) {
		this.searchEndDate = searchEndDate;
	}

	public String getSearchTitle() {
		return searchTitle;
	}

	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}

	public String getSearchEvaluation() {
		return searchEvaluation;
	}

	public void setSearchEvaluation(String searchEvaluation) {
		this.searchEvaluation = searchEvaluation;
	}

	public List<String> getSearchStatus() {
		return searchStatus;
	}

	public void setSearchStatus(List<String> searchStatus) {
		this.searchStatus = searchStatus;
	}

	public MultipartFile getExcelFile() {
		return excelFile;
	}

	public void setExcelFile(MultipartFile excelFile) {
		this.excelFile = excelFile;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public int[] getCh_box() {
		return ch_box;
	}

	public void setCh_box(int[] ch_box) {
		this.ch_box = ch_box;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public Date getM_startdate() {
		return m_startdate;
	}

	public void setM_startdate(Date m_startdate) {
		this.m_startdate = m_startdate;
	}

	public Date getM_enddate() {
		return m_enddate;
	}

	public void setM_enddate(Date m_enddate) {
		this.m_enddate = m_enddate;
	}

	public String getM_title() {
		return m_title;
	}

	public void setM_title(String m_title) {
		this.m_title = m_title;
	}

	public String getM_content() {
		return m_content;
	}

	public void setM_content(String m_content) {
		this.m_content = m_content;
	}

	public String getM_evaluation() {
		return m_evaluation;
	}

	public void setM_evaluation(String m_evaluation) {
		this.m_evaluation = m_evaluation;
	}

	public String getM_status() {
		return m_status;
	}

	public void setM_status(String m_status) {
		this.m_status = m_status;
	}

	public String getM_comment() {
		return m_comment;
	}

	public void setM_comment(String m_comment) {
		this.m_comment = m_comment;
	}
}