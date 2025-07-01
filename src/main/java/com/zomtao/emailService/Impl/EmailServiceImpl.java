package com.zomtao.emailService.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.zomtao.emailService.emailService;

@Service
public class EmailServiceImpl implements emailService {

	@Autowired
    private JavaMailSender javaMailSender;
	
	
	@Override
	public void sendEmail(String toEmai, String userName, String password) {
		SimpleMailMessage smm = new SimpleMailMessage();
		
		smm.setTo(toEmai);
		smm.setSubject("Mail Regarding Registration");
        smm.setText("Your login credentials:\nUsername: " + userName + "\nPassword: " + password);
		smm.getSentDate();
		javaMailSender.send(smm);
	}

}
