package com.maxstudy.management.service;

import java.util.ArrayList;

public class ManageDetailVO {
	private int 	no;
	private int 	s_no;
	private int 	m_no;
	private String	s_name;
	private String 	s_date;
	private String 	s_day;
	private String 	s_content;
	private String 	s_evaluation;
	private String 	s_comment;
	private ArrayList<ManageDetailVO> detailList;
	
	public ManageDetailVO() {}

	public ArrayList<ManageDetailVO> getDetailList() {
		return detailList;
	}

	public void setDetailList(ArrayList<ManageDetailVO> detailList) {
		this.detailList = detailList;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getS_day() {
		return s_day;
	}

	public void setS_day(String s_day) {
		this.s_day = s_day;
	}

	public String getS_content() {
		return s_content;
	}

	public void setS_content(String s_content) {
		this.s_content = s_content;
	}

	public String getS_evaluation() {
		return s_evaluation;
	}

	public void setS_evaluation(String s_evaluation) {
		this.s_evaluation = s_evaluation;
	}

	public String getS_comment() {
		return s_comment;
	}

	public void setS_comment(String s_comment) {
		this.s_comment = s_comment;
	}
}
