package com.jjack.web.houseApply.vo;

import com.google.api.client.util.DateTime;

/**
 * 구글 캘린더에서 가져온 정보를 저장할 VO
 * @author : daeo
 * @since : 2017. 11. 9.
 */
public class CalendarVO {
	
	private DateTime startDay;
	private DateTime endDay;
	private String cTitle;
	private String cContent;

	public CalendarVO() {}

	public DateTime getStartDay() {
		return startDay;
	}

	public void setStartDay(DateTime startDay) {
		this.startDay = startDay;
	}

	public DateTime getEndDay() {
		return endDay;
	}

	public void setEndDay(DateTime endDay) {
		this.endDay = endDay;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
}	