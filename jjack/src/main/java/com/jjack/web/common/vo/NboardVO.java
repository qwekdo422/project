package com.jjack.web.common.vo;

import java.sql.Date;

public class NboardVO {

	private Date nday; 
	private String ntitle; 
	private String ncontents; 
	private int nhis;
	
	private String isshow; //myBatis에 의해 추가된 변수 
	
	
	//getter, setter 함수 
	public String getIsshow() {
		return isshow;
	}
	public void setIsshow(String isshow) {
		this.isshow = isshow;
	}

	public Date getNday() {
		return nday;
	}
	public void setNday(Date nday) {
		this.nday = nday;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontents() {
		return ncontents;
	}
	public void setNcontents(String ncontents) {
		this.ncontents = ncontents;
	}
	public int getNhis() {
		return nhis;
	}
	public void setNhis(int nhis) {
		this.nhis = nhis;
	} 
	
	
	
}
