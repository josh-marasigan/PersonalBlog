package objectify;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class GAEJCronServlet extends HttpServlet {
private static final Logger _logger = Logger.getLogger(GAEJCronServlet.class.getName());
public void doGet(HttpServletRequest req, HttpServletResponse resp)
throws IOException {
	
try {

	
//Put your logic here
//BEGIN
System.out.println("hello ?wtf");
_logger.info("Cron Job has been executed");
Properties props = new Properties();
Session session = Session.getDefaultInstance(props, null);

String msgBody = "...";
//xxx@APP-ID.appspotmail.com
try {
	 _logger.info("does it stop here? 1");
    MimeMessage msg = new MimeMessage(session);
    _logger.info("does it stop here? 2");
    
    msg.setFrom(new InternetAddress("admin@trial123-1226.appspotmail.com", "Example.com Admin"));
    _logger.info("does it stop here? 3");
    msg.addRecipient(Message.RecipientType.TO,
                     new InternetAddress("testingeehw1@gmail.com", "Mr. User"));
    _logger.info("does it stop here? 4");
    msg.setSubject("Your Example.com account has been activated");
    _logger.info("does it stop here? 5");
    msg.setText(msgBody);
    _logger.info("does it stop here? 6");
    Transport.send(msg);
    _logger.info("email has been executed");
} catch (AddressException e) {
    // ...
	e.printStackTrace();	
	
	_logger.info("does it stop here? address exception");
	    
} catch (MessagingException e) {
    // ...
    e.printStackTrace();	
	e.getMessage();
    _logger.info("does it stop here? messaging exception");

}
 
//END
}
catch (Exception ex) {
//Log any exceptions in your Cron Job
	ex.printStackTrace();	
	 _logger.info("does it stop here? any exception");
}
}
/*static Properties mailServerProperties;
static Session getMailSession;
static MimeMessage generateMailMessage;








	public static void generateAndSendEmail() throws AddressException, MessagingException {
		_logger.info("it got in to the function");
		// Step1
		System.out.println("\n 1st ===> setup Mail Server Properties..");
		mailServerProperties = System.getProperties();
		mailServerProperties.put("mail.smtp.port", "587");
		mailServerProperties.put("mail.smtp.auth", "true");
		mailServerProperties.put("mail.smtp.starttls.enable", "true");
		System.out.println("Mail Server Properties have been setup successfully..");
		_logger.info("finished step one");
		// Step2
		System.out.println("\n\n 2nd ===> get Mail Session..");
		getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		generateMailMessage = new MimeMessage(getMailSession);
		generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress("testingeehw1@gmail.com"));
		//generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("testingeehw1@gmail..com"));
		generateMailMessage.setSubject("Greetings from Crunchify..");
		String emailBody = "lalalala " + "<br><br> Regards, <br>BLOG Admin";
		generateMailMessage.setContent(emailBody, "text/html");
		System.out.println("Mail Session has been created successfully..");
		_logger.info("finished step 2");
		// Step3
		System.out.println("\n\n 3rd ===> Get Session and Send mail");
		Transport transport = getMailSession.getTransport("smtp");
	
		_logger.info("mail should start sending");
		// Enter your correct gmail UserID and Password
		// if you have 2FA enabled then provide App Specific Password
		transport.connect("smtp.gmail.com", "testingeehw1", "78547854");
		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
		transport.close();
		_logger.info("thoes this even happen");
		
		Properties props = new Properties();
		props.setProperty("mail.store.protocol", "imaps"); 
		Session session = Session.getInstance(props, null); 
		Store store = session.getStore();
		store.connect("imap.gmail.com", 993, "*******@gmail.com", "password");
	}


*/






@Override
public void doPost(HttpServletRequest req, HttpServletResponse resp)
throws ServletException, IOException {
doGet(req, resp);
}
}