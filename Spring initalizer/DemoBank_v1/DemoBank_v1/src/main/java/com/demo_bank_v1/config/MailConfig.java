package com.demo_bank_v1.config;

import org.springframework.mail.javamail.JavaMailSenderImpl;

import java.util.Properties;

public class MailConfig
{
    public static JavaMailSenderImpl getMailConfig()
    {
        JavaMailSenderImpl emailConfig = new JavaMailSenderImpl();

        //Setting Properties
        Properties props = emailConfig.getJavaMailProperties();
        props.put("mail.transport.protocol","smtp");
        props.put("mail.smtp","true");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.debug","true");

        //Set mail Credentials
        emailConfig.setHost("localhost");
        emailConfig.setPort(25);
        emailConfig.setUsername("nigga@epay.com");
        emailConfig.setPassword("nigga@123");

        return emailConfig;
    }
}
