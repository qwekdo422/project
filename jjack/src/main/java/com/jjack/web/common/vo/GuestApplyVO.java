package com.jjack.web.common.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class GuestApplyVO {
	private int aNo;					// 	신청번호
	private Date apDay;					//	신청한 날짜
	private int mNo;					//	회원번호
	private String name;				//	이름
	private String tel;					//	전화번호
	private int age;					//	나이
	private String loc;					//	거주지역
	private String interest;			//	관심사
	private String eventdate;			//	이벤트 시작일
	private MultipartFile imageUpload;	//	사진파일
	private String pic;					//	사진저장이름
	private int cond;					//	상태
	/*
	 * 	0 신청안했을 때 : 신청폼과 신청버튼
		1,2,5 승인대기 : "승인중입니다" 신청폼과 수정버튼
		
		--이 아래부터 폼 보여주지 않기--
		3 : "입금하세요." 입금 계좌번호
		4 : "입소 예정입니다"
		6 : "마감되었습니다"
		7 : "신청을 취소하셨습니다"
		8, 9, 10 : "신청할 수 없는 이벤트입니다"
	 */
	
	public GuestApplyVO() {}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public Date getApDay() {
		return apDay;
	}

	public void setApDay(Date apDay) {
		this.apDay = apDay;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
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

	public String getEventdate() {
		return eventdate;
	}

	public void setEventdate(String eventdate) {
		this.eventdate = eventdate;
	}

	public int getCond() {
		return cond;
	}

	public void setCond(int cond) {
		this.cond = cond;
	}

	public MultipartFile getImageUpload() {
		return imageUpload;
	}

	public void setImageUpload(MultipartFile imageUpload) {
		this.imageUpload = imageUpload;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
}
