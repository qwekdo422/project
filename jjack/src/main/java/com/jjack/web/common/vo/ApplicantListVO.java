package com.jjack.web.common.vo;

public class ApplicantListVO {
	private int mno;		// 회원번호
	private int ano;		// 신청인덱스
	private String id;
	private String name;
	private String nick;		// 호칭
	private String sex;
	private int age;
	private String loc;		// 사는 지역
	private String interest;		// 관심사
	private String adate;		// 신청일자
	private String acount;		// 신청한 횟수
	private String gcount;		// 입소 횟수
	private String tel;
	private String email;
	private int thisStep;	// 현재 진행상태
	private int nextStep;	// 다음 진행명령
	// 1:신청(승인대기) / 2:승인 / 3:입금대기 / 4:입소대기 / 5:승인거부 / 6:거부연락완료 / 7:취소 / 8:입소 / 9:퇴소 / 10:후기완료
	private String pic;		// 사진파일
	
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	public String getAcount() {
		return acount;
	}
	public void setAcount(String acount) {
		this.acount = acount;
	}
	public String getGcount() {
		return gcount;
	}
	public void setGcount(String gcount) {
		this.gcount = gcount;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getThisStep() {
		return thisStep;
	}
	public void setThisStep(int thisStep) {
		this.thisStep = thisStep;
	}
	public int getNextStep() {
		return nextStep;
	}
	public void setNextStep(int nextStep) {
		this.nextStep = nextStep;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
}
