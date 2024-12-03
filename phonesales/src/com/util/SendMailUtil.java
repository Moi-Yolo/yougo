package com.util;
import javax.mail.BodyPart;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import javax.mail.PasswordAuthentication;
import javax.servlet.http.HttpServletRequest;

/**
 * 分页工具类
 */
public class SendMailUtil {
	/**
	 * 获取分页代码
	 * from_email：发送邮箱
	 * pwd 密码
	 *recevices：接收邮箱
	 * code：验证码
	 */
	  public static void sendMail(String recipient, String subject, String content) throws MessagingException {
	
			String username="2182285297@qq.com";
			String password="nwveaazyomapeaab";
	        Properties props = new Properties();
	        props.put("mail.smtp.host", "smtp.qq.com"); // QQ邮箱SMTP服务器地址
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.put("mail.smtp.port", "465"); // SMTP服务器默认端口
	        props.put("mail.smtp.auth", "true"); // 使用SMTP认证
	        props.put("mail.smtp.starttls.enable", "true"); // 启用TLS加密
	        props.put("mail.smtp.starttls.required", "true");

	        // 创建认证器
	        Authenticator authenticator = new Authenticator()
	        {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() 
	            {
	                return new PasswordAuthentication(username, password);
	            }
	        };
	 
	        // 创建会话
	        Session session = Session.getInstance(props, authenticator);
	 
	        // 创建邮件
	        Message message = new MimeMessage(session);
	        message.setFrom(new InternetAddress(username));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
	        message.setSubject(subject);
	        message.setText(content);
	 
	        // 发送邮件
	        Transport.send(message);
	    }
	
}
