package com.jjack.web.common.vo;

import java.sql.Date;

public class RboardVO {
	
//기본적인 게시판 데이터 
private String rtitle; //게시글 제목
private String rcontents;//게시글 내용
private String rdate;//게시글 작성일
private int rhis; //게시글 조회수
private int rno; //게시글 번호
private int writerno; //글 작성자의 회원번호


private int resultno;  //입력한 순서대로 뽑기 위해준비한 변수 

private int nowPage; //페이징 처리를 위해 추가된 변수 
private int startPage;
private int endPage; 

private int searchnowpage; 
private int searchstartpage; 
private int searchendpage;

public int getSearchnowpage() {
	return searchnowpage;
}
public void setSearchnowpage(int searchnowpage) {
	this.searchnowpage = searchnowpage;
}
public int getSearchstartpage() {
	return searchstartpage;
}
public void setSearchstartpage(int searchstartpage) {
	this.searchstartpage = searchstartpage;
}
public int getSearchendpage() {
	return searchendpage;
}
public void setSearchendpage(int searchendpage) {
	this.searchendpage = searchendpage;
}
private String nickname; 
private int gisoo; 
private String jjackname; 
private int recnt;
private String recontents;


//댓글 리스트 가져오기 위한 변수 
private int mno;//회원번호
private int cno; 
private Date cwdate; 
private  String cctentents;
private String rid;

//리뷰 게시판 이전글 다음글을 위한 변수 
private String pre;		//이전글 다음글 처리를 위해 myBatis에 의해 추가된 변수  
private String next; 
private Date preday; 
private Date nextday; 
private int preNo;
private int nextNo; 


//수정된 댓글 내용
private String rmcontents; 


//검색에 필요한 데이터 
private String kind; 
private String rsearch;






public String getRmcontents() {
	return rmcontents;
}
public void setRmcontents(String rmcontents) {
	this.rmcontents = rmcontents;
}


public int getWriterno() {
	return writerno;
}
public void setWriterno(int writerno) {
	this.writerno = writerno;
}
public String getPre() {
	return pre;
}
public void setPre(String pre) {
	this.pre = pre;
}
public String getNext() {
	return next;
}
public void setNext(String next) {
	this.next = next;
}
public Date getPreday() {
	return preday;
}
public void setPreday(Date preday) {
	this.preday = preday;
}
public Date getNextday() {
	return nextday;
}
public void setNextday(Date nextday) {
	this.nextday = nextday;
}
public int getPreNo() {
	return preNo;
}
public void setPreNo(int preNo) {
	this.preNo = preNo;
}
public int getNextNo() {
	return nextNo;
}
public void setNextNo(int nextNo) {
	this.nextNo = nextNo;
}
public int getCno() {
	return cno;
}
public void setCno(int cno) {
	this.cno = cno;
}
public Date getCwdate() {
	return cwdate;
}
public void setCwdate(Date cwdate) {
	this.cwdate = cwdate;
}
public String getCctentents() {
	return cctentents;
}
public void setCctentents(String cctentents) {
	this.cctentents = cctentents;
}
public int getMno() {
	return mno;
}
public void setMno(int mno) {
	this.mno = mno;
}
public int getRecnt() {
	return recnt;
}
public void setRecnt(int recnt) {
	this.recnt = recnt;
}
public String getRecontents() {
	return recontents;
}
public void setRecontents(String recontents) {
	this.recontents = recontents;
}
public String getJjackname() {
	return jjackname;
}
public void setJjackname(String jjackname) {
	this.jjackname = jjackname;
}
public String getNickname() {
	return nickname;
}
public void setNickname(String nickname) {
	this.nickname = nickname;
}
public int getGisoo() {
	return gisoo;
}
public void setGisoo(int gisoo) {
	this.gisoo = gisoo;
}


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
public String getRdate() {
	return rdate;
}
public void setRdate(String rdate) {
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
