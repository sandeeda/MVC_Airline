package airline.config;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendEmail(final String to, final String subject, final String text) {
        MimeMessagePreparator messagePreparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
                messageHelper.setFrom("sdsts28cloud1@gmail.com");
                messageHelper.setTo(to);
                messageHelper.setSubject(subject);
                messageHelper.setText(text);
            }
        };
        mailSender.send(messagePreparator);
    }
    
    public void sendHtmlEmail(final String to, final String subject, final String htmlContent) {
        MimeMessagePreparator messagePreparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                messageHelper.setFrom("your_email@gmail.com");
                messageHelper.setTo(to);
                messageHelper.setSubject(subject);
                messageHelper.setText(htmlContent, true);
            }
        };
        mailSender.send(messagePreparator);
    }

}
