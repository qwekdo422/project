package com.jjack.web.mail;

public class MailVO {
	Boolean yesno;
	String name;
	String date;
	String nick;
	
	public Boolean getYesno() {
		return yesno;
	}
	public void setYesno(Boolean yesno) {
		this.yesno = yesno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date.substring(0, 4) + "년 " + date.substring(4, 6) + "월 " + date.substring(6) + "일";
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
}
