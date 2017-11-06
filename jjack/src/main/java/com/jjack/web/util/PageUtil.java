package com.jjack.web.util;
/**
 * 이 클래스는 페이지 이동 기능을 구현하기 위해서 필요한 7가지 정보를
 * 기억하고 만들어줄 클래스
 * @author : daeo
 * @since : 2017. 10. 31.	
 */
public class PageUtil {
	private int nowPage;		// 현재 페이지
	private int totalCount;	// 총 데이터 개수
	
	private int listCount;		// 한 화면에 보여줄 목록의 개수
	private int pageGroup;	// 한 화면에 보여줄 페이지 개수
	
	private int totalPage;	// 총 페이지수
	private int startPage;	// 시작 페이지
	private int endPage;		// 마지막 페이지
	
	public PageUtil() {}

	//	누군가가 이 클래스를 new 시키면서 필수 정보를 알려주기로
	public PageUtil(int nowPage, int totalCount) {
		this.nowPage = nowPage;
		this.totalCount = totalCount;
		
		//	한 화면에 보여질 리스트
		this.listCount = 10;
		//	하단바에 표시되는 페이지
		this.pageGroup = 5;
		
		calcTotalPage();
		calcStartPage();
		calcEndPage();
	}

	//	totalPage 계산하는 함수
	private void calcTotalPage() {
		totalPage = (totalCount % listCount == 0) ? 
							(totalCount / listCount) : (totalCount / listCount) + 1;
	}
	//	자기가 속한 그룹의 처음 페이지 계산하는 함수 
	private void calcStartPage() {
		//	현재 페이지가 몇번째 그룹인지를 알아낸다.
		int tempGroup = (nowPage - 1) / pageGroup + 1;
		//	그룹의 시작 페이지를 구한다.
		startPage = (tempGroup - 1) * pageGroup + 1;  
	}
	//	자기가 속한 그룹의 마지막 페이지 계산하는 함수
	private void calcEndPage() {
		endPage = startPage + pageGroup - 1;
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageGroup() {
		return pageGroup;
	}

	public void setPageGroup(int pageGroup) {
		this.pageGroup = pageGroup;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
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
}
