package com.jjack.web.common.vo;

import java.sql.Date;

public class ProfileVO {

	
	//html의 name값과 같아야 받아진단다. 
	private String id; 
	private String pw;
	private String cpw;
	private String name; 
	private String sex; 
	private Date birth; 
	private String email; 
	private String loc;
	
	private int no; //myBatis에 의해 추가된 변수임 
	
	private String newpw02; //새로운 비밀번호를 update 하기 위해 추가된 변수 
	
	

	public String getNewpw02() {
		return newpw02;
	}
	public void setNewpw02(String newpw02) {
		this.newpw02 = newpw02;
	}

	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	//getter , setter 함수 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getCpw() {
		return cpw;
	}
	public void setCpw(String cpw) {
		this.cpw = cpw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	
}
