// 패키지 선언
package mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

// 클래스 선언
public class MailBean {
	
	// 멤버변수 선언
	private String sender;
	private String recipient;
	private String title;
	private String contents;
	private String mtype;
	private String passwd;

	private String err_msg;
	
	// 생성자
	public MailBean() {
		// 인증에 사용할 기본값 설정
		sender = "ssjy41@naver.com";
		passwd = "tlswjddus1104!!";
		recipient = "수신 이메일 주소";
		title = "전송할 제목";
		contents = "전송할 내용";
		err_msg="오류";
	    mtype="text";
	    mtype="text/plain;charset=euc-kr";
	}

	
	public boolean sendMail() {
		// 프로퍼티 생성
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.port", "465");
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.debug", "true");
		prop.put("mail.smtp.user" , sender);

		prop.put("mail.smtp.socketFactory.port", "465");
		prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		prop.put("mail.smtp.socketFactory.fallback", "false");

		MyAuthenticator auth = new MyAuthenticator(sender, passwd);

		// 세션 인스턴스 생성
		Session session = Session.getInstance(prop,auth);

		// Message 객체 준비
		MimeMessage msg = new MimeMessage(session);

		try{
			msg.setFrom(new InternetAddress(sender));
			InternetAddress[] address = { new InternetAddress(recipient) };
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(title);
			msg.setSentDate(new Date());
			msg.setText(contents);

			// Address 객체 준비
			InternetAddress from = new InternetAddress(sender);
			InternetAddress to = new InternetAddress(recipient);

			// Message 객체에 정보추가
			msg.setFrom(from);
			msg.setRecipients(Message.RecipientType.TO, address);
			
			msg.setSubject(title);
			msg.setText(contents);

			// MimeMultiPart 준비
			MimeMultipart multipart = new MimeMultipart();

			// MimeBodyPart 준비
			MimeBodyPart body = new MimeBodyPart();
			// 지정된 Mime type 으로 바디설정
			body.setContent(contents,mtype);

			// 멀티파트에 바디 추가
			multipart.addBodyPart(body);

			// 메시지 객체에 멀티파트 설정
			msg.setContent(multipart);

			// 메일 전송
			Transport.send(msg);
		}
		catch (MessagingException me){
		    System.out.println(me.getMessage());
		    me.printStackTrace();
			return false;
		}
		return true;

	}

	/**
	  * SMTP Authenticator
	  */
	 public final class MyAuthenticator extends Authenticator {

	     private String id;
	     private String pw;

	     public MyAuthenticator(String id, String pw) {
	         this.id = id;
	         this.pw = pw;
	     }

	     protected PasswordAuthentication getPasswordAuthentication() {
	         return new PasswordAuthentication(id, pw);
	     }

	 }
		
	// setXxx  메서드들
	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	
	// getXxx 메서드들
	public String getRecipient() {
		return recipient;
	}
	
	public String getTitle() {
		return title;
	}
	public String getContents() {
		return contents;
	}
	public String getErr_msg(){
		return err_msg;
	}
}