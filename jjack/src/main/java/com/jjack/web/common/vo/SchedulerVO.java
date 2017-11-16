package com.jjack.web.common.vo;


/**
 * 행사 일정관리VO
 * @author : daeo
 * @since : 2017. 11. 16.	
 */
public class SchedulerVO {
	private String eventdate;	//	행사시작일
	private String eventend;	//	행사종료일
	private int gisoo;			//	기수
	private String loc;			//	대상 거주지역
	private String age;			//	대상 연령대
	private String title;		//	행사제목
	private String contents;	//	행사내용

	public SchedulerVO() {}

	public String getEventdate() {
		return eventdate;
	}

	public void setEventdate(String eventdate) {
		this.eventdate = eventdate;
	}

	public String getEventend() {
		return eventend;
	}

	public void setEventend(String eventend) {
		this.eventend = eventend;
	}

	public int getGisoo() {
		return gisoo;
	}

	public void setGisoo(int gisoo) {
		this.gisoo = gisoo;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	
}
