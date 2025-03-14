package com.demo_bank_v1.mail_messenger;

import com.demo_bank_v1.config.MailConfig;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailMessenger
{
    public static void htmlEmailMessenger(String from, String toMail, String subject, String body) throws MessagingException
    {
        JavaMailSender sender = MailConfig.getMailConfig();
        MimeMessage message = sender.createMimeMessage();
        MimeMessageHelper htmlMessage = new MimeMessageHelper(message,true);
        htmlMessage.setTo(toMail);
        htmlMessage.setFrom(from);
        htmlMessage.setSubject(subject);
        htmlMessage.setText(body,true);

        sender.send(message);
    }
}
