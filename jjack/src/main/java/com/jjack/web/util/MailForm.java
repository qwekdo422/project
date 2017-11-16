package com.jjack.web.util;

import com.jjack.web.common.vo.ApplicantListVO;

public class MailForm {
	public static String makeMail(ApplicantListVO apvo) {
        StringBuffer buff = new StringBuffer();
        buff.append("<!DOCTYPE html>");
        buff.append("<html lang='ko'>");
        buff.append("<head>");
        buff.append("<head></head>");
        buff.append("<body>");
        buff.append("		<div align='center' style='border:2px solid yellowgreen;padding:20px;max-width:600px;'>");
        buff.append("			<img src='http://img.wemep.co.kr/dealimg/201305/99324/0745ea86b8dac5559ee2a0903d1d9fc1b7f7ed7d.jpg' style='max-width:100%;height:auto;'><br /><br />");
        buff.append("			<h2 align='center'>짝 게스트하우스입니다</h2>");
        buff.append("			<p>저희 애정촌에 신청해주신걸 감사드립니다.<br />");
        if(apvo.getNextStep()==3) {
        	buff.append(apvo.getName() + "님은 " + apvo.getEdate() + ", 저희 애정촌에 " +apvo.getGisoo() + "기로 참가하게 되셨습니다.<br />");
        	buff.append("			입금이 확인되는대로 애정촌 입소가 확정되며, 확정상태는 입소신청 페이지에서 확인하실 수 있습니다.<br />");
        	buff.append("			그럼 저희 애정촌에서의 아름다운 추억을 기대해주세요.<br /><br />");
        	buff.append("			계좌번호 : 우리은행 531-123456-02-101,  X만원<br /></p>");
        	buff.append("		</div>");
        } else {
            buff.append("			이번 신청자가 많아 부득이하게 " + apvo.getName() + " 님은 참가하지 못하게 되셨습니다.<br />");
            buff.append("			죄송하다는 사과말씀드리며, 다음 기회에 다시 신청 부탁드립니다.<br />");
        }
        buff.append("</body>");
        buff.append("</html>");
        return buff.toString();
	}
}
