// ��Ű�� ����
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

// Ŭ���� ����
public class MailBean {
	
	// ������� ����
	private String sender;
	private String recipient;
	private String title;
	private String contents;
	private String mtype;
	private String passwd;

	private String err_msg;
	
	// ������
	public MailBean() {
		// ������ ����� �⺻�� ����
		sender = "ssjy41@naver.com";
		passwd = "tlswjddus1104!!";
		recipient = "���� �̸��� �ּ�";
		title = "������ ����";
		contents = "������ ����";
		err_msg="����";
	    mtype="text";
	    mtype="text/plain;charset=euc-kr";
	}

	
	public boolean sendMail() {
		// ������Ƽ ����
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

		// ���� �ν��Ͻ� ����
		Session session = Session.getInstance(prop,auth);

		// Message ��ü �غ�
		MimeMessage msg = new MimeMessage(session);

		try{
			msg.setFrom(new InternetAddress(sender));
			InternetAddress[] address = { new InternetAddress(recipient) };
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(title);
			msg.setSentDate(new Date());
			msg.setText(contents);

			// Address ��ü �غ�
			InternetAddress from = new InternetAddress(sender);
			InternetAddress to = new InternetAddress(recipient);

			// Message ��ü�� �����߰�
			msg.setFrom(from);
			msg.setRecipients(Message.RecipientType.TO, address);
			
			msg.setSubject(title);
			msg.setText(contents);

			// MimeMultiPart �غ�
			MimeMultipart multipart = new MimeMultipart();

			// MimeBodyPart �غ�
			MimeBodyPart body = new MimeBodyPart();
			// ������ Mime type ���� �ٵ���
			body.setContent(contents,mtype);

			// ��Ƽ��Ʈ�� �ٵ� �߰�
			multipart.addBodyPart(body);

			// �޽��� ��ü�� ��Ƽ��Ʈ ����
			msg.setContent(multipart);

			// ���� ����
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
		
	// setXxx  �޼����
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
	
	// getXxx �޼����
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