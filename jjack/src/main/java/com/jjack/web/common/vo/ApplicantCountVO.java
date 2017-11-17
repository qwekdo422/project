package com.jjack.web.common.vo;

public class ApplicantCountVO {
	private String evdate;		// 입소일자
	private int gisoo;		// 기수
	private String etitle;		// 행사 제목
	private int waitCount;		// 승인대기자 수
	private int manCount;	// 승인된 남자 수
	private int womanCount;	// 승인된 여자 수
	private int deniedCount;		// 거부된 사람 수	
	
	
	public String getEvdate() {
		return evdate;
	}
	public void setEvdate(String evdate) {
		this.evdate = evdate;
	}
	public int getGisoo() {
		return gisoo;
	}
	public void setGisoo(int gisoo) {
		this.gisoo = gisoo;
	}
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	public int getWaitCount() {
		return waitCount;
	}
	public void setWaitCount(int waitCount) {
		this.waitCount = waitCount;
	}
	public int getManCount() {
		return manCount;
	}
	public void setManCount(int manCount) {
		this.manCount = manCount;
	}
	public int getWomanCount() {
		return womanCount;
	}
	public void setWomanCount(int womanCount) {
		this.womanCount = womanCount;
	}
	public int getDeniedCount() {
		return deniedCount;
	}
	public void setDeniedCount(int noCount) {
		this.deniedCount = noCount;
	}
}
