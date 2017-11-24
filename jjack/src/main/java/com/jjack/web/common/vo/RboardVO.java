package com.jjack.web.common.vo;

import java.sql.Date;

public class RboardVO {
	
//기본적인 게시판 데이터 
private String rtitle; //게시글 제목
private String rcontents;//게시글 내용
private Date rdate;//게시글 작성일
private int rhis; //게시글 조회수
private int rno; //게시글 번호
private String rid; 

private int resultno;  //입력한 순서대로 뽑기 위해준비한 변수 

private int nowPage; //페이징 처리를 위해 추가된 변수 
private int startPage;
private int endPage; 

//검색에 필요한 데이터 
private String kind; 
private String rsearch;

// 짝, 기수 는 ApplicantCountVO에서 받아오도록 하자.
public int getNowPage() {
	return nowPage;
}
public void setNowPage(int nowPage) {
	this.nowPage = nowPage;
}
public int getStartPage() {
	return startPage;
}
public void setStartPage(int startPage) {
	this.startPage = startPage;
}
public int getEndPage() {
	return endPage;
}
public void setEndPage(int endPage) {
	this.endPage = endPage;
}



public String getRid() {
	return rid;
}
public void setRid(String rid) {
	this.rid = rid;
}
public int getResultno() {
	return resultno;
}
public void setResultno(int resultno) {
	this.resultno = resultno;
}











public String getRtitle() {
	return rtitle;
}
public void setRtitle(String rtitle) {
	this.rtitle = rtitle;
}
public String getRcontents() {
	return rcontents;
}
public void setRcontents(String rcontents) {
	this.rcontents = rcontents;
}
public Date getRdate() {
	return rdate;
}
public void setRdate(Date rdate) {
	this.rdate = rdate;
}
public int getRhis() {
	return rhis;
}
public void setRhis(int rhis) {
	this.rhis = rhis;
}
public int getRno() {
	return rno;
}
public void setRno(int rno) {
	this.rno = rno;
}
public String getKind() {
	return kind;
}
public void setKind(String kind) {
	this.kind = kind;
}
public String getRsearch() {
	return rsearch;
}
public void setRsearch(String rsearch) {
	this.rsearch = rsearch;
} 


}
