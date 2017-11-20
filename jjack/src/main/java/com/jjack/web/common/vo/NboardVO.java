package com.jjack.web.common.vo;

import java.sql.Date;

public class NboardVO {

	
	private Date nday; 
	private String ntitle; 
	private String ncontents; 
	private int nhits;
	
	private String isshow; //myBatis에 의해 추가된 변수 
	
	private int nno;  //myBatis에 의해 추가된 변수 
	
	private int rno; //myBatis에 의해 추가된 변수 
										//DB에 입력한 순서대로 뽑아주게 해주는 변수 rownum

	private int nowPage; //추가된 변수 
	
	
	
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
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
	public int getNhits() {
		return nhits;
	}
	public void setNhits(int nhis) {
		this.nhits = nhis;
	} 
	
	
	
}
