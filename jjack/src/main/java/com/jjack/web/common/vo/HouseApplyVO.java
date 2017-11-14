package com.jjack.web.common.vo;

import org.springframework.web.multipart.MultipartFile;

public class HouseApplyVO {
	private String name;		//	이름
	private String age;			//	나이
	private String loc;			//	거주지	
//	private String interest;	//	관심사
	private String inDay;		//	입소날짜
	private String pic;			//	사진
	private MultipartFile[] files;
	private String tel;			//	연락처
	
	public HouseApplyVO() {}

	
	
	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}



	public String getPic() {
		return pic;
	}
	
	public void setPic(String pic) {
		this.pic = pic;
	}
	
	public MultipartFile[] getFiles() {
		return files;
	}
	
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getInDay() {
		return inDay;
	}

	public void setInDay(String inDay) {
		this.inDay = inDay;
	}
}
