package com.jjack.web.common.vo;

public class ApplicantListVO {
	private String edate;		// 입소일자
	private int gisoo;		// 기수
	private String etitle;		// 행사 제목
	private int code;		// 명령 코드 : 1 날짜 기수 변경, 2 회원상태변경
	
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
	private int thisProcess;	// 현재 진행상태
	private int nextProcess;	// 다음 진행명령
	// 1:신청(승인대기) / 2:승인 / 3:입금대기 / 4:입소대기 / 5:승인거부 / 6:거부연락완료 / 7:취소 / 8:입소 / 9:퇴소 / 10:후기완료
	private int totalCount;	// 전체 신청자 수
	private int waitCount;		// 승인대기자 수
	private int manCount;	// 승인된 남자 수
	
	
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
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
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
	public int getThisProcess() {
		return thisProcess;
	}
	public void setThisProcess(int thisProcess) {
		this.thisProcess = thisProcess;
	}
	public int getNextProcess() {
		return nextProcess;
	}
	public void setNextProcess(int nextProcess) {
		this.nextProcess = nextProcess;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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
	public int getNoCount() {
		return noCount;
	}
	public void setNoCount(int noCount) {
		this.noCount = noCount;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	private int womanCount;	// 승인된 여자 수
	private int noCount;		// 거부된 사람 수
	private String pic;		// 사진파일
	
	
	
	
	
}
