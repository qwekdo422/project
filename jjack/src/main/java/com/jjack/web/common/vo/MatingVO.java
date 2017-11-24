package com.jjack.web.common.vo;

public class MatingVO {
	private int gno;
	private int ano;
	private int mno;
	private String id;
	private int lunchP;
	private int myLove;
	private String nick;
	private String edate;		// 관리자 등이 보기 위해 선택하는 날짜
	private int gisoo;
	private String evdate;	// 입소자가 입소한 날짜
	private String sex;
	private String osex;
	private String pic;
	private String course;
	private String interest;
	private int loveNo;	// 선택한 상대가 몇 호인지
	private int loveNick;	// 선택한 사람의 호칭
	
	private int cCount;		// 선택을 완료한 사람 수
	private int tCount;		// 전체 사람 수
	
	
	public int getLoveNick() {
		return loveNick;
	}
	public void setLoveNick(int loveNick) {
		this.loveNick = loveNick;
	}
	public int getLoveNo() {
		return loveNo;
	}
	public void setLoveNo(int loveNo) {
		this.loveNo = loveNo;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public int getcCount() {
		return cCount;
	}
	public void setcCount(int cCount) {
		this.cCount = cCount;
	}
	public int gettCount() {
		return tCount;
	}
	public void settCount(int tCount) {
		this.tCount = tCount;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		osex = (sex.equals("M")) ? "F":"M";
		this.sex = sex;
	}
	public String getOsex() {
		return osex;
	}
	public void setOsex(String osex) {
		this.osex = osex;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getLunchP() {
		return lunchP;
	}
	public void setLunchP(int lunchP) {
		this.lunchP = lunchP;
	}
	public int getMyLove() {
		return myLove;
	}
	public void setMyLove(int myLove) {
		this.myLove = myLove;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public int getGisoo() {
		return gisoo;
	}
	public void setGisoo(int gisoo) {
		this.gisoo = gisoo;
	}
	public String getEvdate() {
		return evdate;
	}
	public void setEvdate(String evdate) {
		this.evdate = evdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
