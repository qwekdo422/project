package com.jjack.web.common.vo;

import org.springframework.web.multipart.MultipartFile;

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
	private String name;		//	이름
	private String tel;			//	연락처
	private String interest;	//	관심사
	private MultipartFile file;	//	사진파일
	private String pic;				//	사진 저장이름
	
	public SchedulerVO() {}
	
	public String getPic() {
		return pic;
	}
	
	public void setPic(String pic) {
		this.pic = pic;
	}
	
	public MultipartFile getFile() {
		return file;
	}
	
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getInterest() {
		return interest;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

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
