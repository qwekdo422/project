package com.jjack.web.util;
import java.io.UnsupportedEncodingException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import com.jjack.web.common.vo.ApplicantListVO;

public class jMailUtil {
	public static void sendMail(ApplicantListVO apvo) {
		final String user = "jjakjjakchon@gmail.com"; //발신자의 이메일 아이디를 입력
		final String password = "clapclap"; //발신자 이메일의 패스워드를 입력
		InternetAddress from = new InternetAddress();
		
		// SMTP 서버 정보 설정
		Properties prop = new Properties();
		
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password); 
			}
		});
		try {
            MimeMessage message = new MimeMessage(session);
            String fromName = "LoveChon";
            // 발신자 이름 한글화
            try{
                from = new InternetAddress(new String(fromName.getBytes("UTF-8"), "8859_1") + "<jjakjjakchon@gmail.com>");
            }catch(UnsupportedEncodingException uee){
                uee.printStackTrace();
            }
            // 이메일 발신자
            message.setFrom(from);

            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(apvo.getEmail())); 

            // Subject
            message.setSubject("[짝 게스트하우스] 애정촌 입소를 신청해주셔서 감사합니다", "UTF-8"); //메일 제목을 입력

            // Text
            String mailHtml = MailForm.makeMail(apvo);
            
            message.setContent(mailHtml, "text/html; charset=UTF-8");    //메일 내용을 입력

            // send the message
            Transport.send(message); //전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }
	}
}
