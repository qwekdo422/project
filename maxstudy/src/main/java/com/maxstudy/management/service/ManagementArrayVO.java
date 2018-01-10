package com.maxstudy.management.service;

import java.sql.Date;

public class ManagementArrayVO {
	private int[] m_no;				//	인덱스 번호
	private String[] m_name;		//	이름
	private Date m_startdate;		//	교육시작일
	private Date m_enddate;			//	교육종료일
	private String[] m_sumdate;		//	교육과정명
	private String[] m_title;		//	교육과정명
	private String[] m_content;		//	교육내용
	private String[] m_evaluation;	//	평가
	private String[] m_status;		//	합격여부
	private String[] m_comment;		//	비고
	private int[] ch_box;			//	삭제할 번호들을 담을 변수
	
	public int[] getM_no() {
		return m_no;
	}
	public void setM_no(int[] m_no) {
		this.m_no = m_no;
	}
	public String[] getM_name() {
		return m_name;
	}
	public void setM_name(String[] m_name) {
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
	
	public String[] getM_sumdate() {
		return m_sumdate;
	}
	public void setM_sumdate(String[] m_sumdate) {
		this.m_sumdate = m_sumdate;
	}
	public String[] getM_title() {
		return m_title;
	}
	public void setM_title(String[] m_title) {
		this.m_title = m_title;
	}
	public String[] getM_content() {
		return m_content;
	}
	public void setM_content(String[] m_content) {
		this.m_content = m_content;
	}
	public String[] getM_evaluation() {
		return m_evaluation;
	}
	public void setM_evaluation(String[] m_evaluation) {
		this.m_evaluation = m_evaluation;
	}
	public String[] getM_status() {
		return m_status;
	}
	public void setM_status(String[] m_status) {
		this.m_status = m_status;
	}
	public String[] getM_comment() {
		return m_comment;
	}
	public void setM_comment(String[] m_comment) {
		this.m_comment = m_comment;
	}
	public int[] getCh_box() {
		return ch_box;
	}
	public void setCh_box(int[] ch_box) {
		this.ch_box = ch_box;
	}
}
