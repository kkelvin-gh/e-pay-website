package com.demo_bank_v1.controller;

import com.demo_bank_v1.helpers.HTML;
import com.demo_bank_v1.helpers.Token;
import com.demo_bank_v1.mail_messenger.MailMessenger;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repository.UserRepository;
import jakarta.mail.MessagingException;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Random;

@Controller
public class RegisterController
{
    @Autowired
    private UserRepository userRepository;
    @GetMapping("/user/register")
    public ModelAndView getRegister()
    {
        ModelAndView getRegisterPage = new ModelAndView("register");
        System.out.println("In Register Page Controller");
        getRegisterPage.addObject("PageTitle", "Register");
        return getRegisterPage;
    }

    @PostMapping("/register")
    public ModelAndView register(@Valid @ModelAttribute("registerUser") User user,
                                 BindingResult result,
                                 @RequestParam("first_name") String first_name,
                                 @RequestParam("last_name") String last_name,
                                 @RequestParam("email") String email,
                                 @RequestParam("password") String password,
                                 @RequestParam("confirm_password") String confirm_password) throws MessagingException {
        ModelAndView registrationPage = new ModelAndView("register");

        //Check for errors
        if(result.hasErrors() && confirm_password.isEmpty())
        {
            registrationPage.addObject("confirm_pass","The confirm field is required");
            return registrationPage;
        }

        //TODO: Check for password match
        if(!password.equals(confirm_password))
        {
            registrationPage.addObject("passwordMismatch","Password do not match");
            return registrationPage;
        }

        //TODO: Get Token String
        String token = Token.generateToken();

        //TODO: Generate Random code
        Random rand = new Random();
        int bound = 123;
        int code = bound * rand.nextInt(bound);

        //TODO: Get email html body
        String emailBody = HTML.htmlEmailTemplate(token, Integer.toString(code));

        //TODO: Hash Password
        String hashedPassword = BCrypt.hashpw(password,BCrypt.gensalt());


        //TODO: Register User
        userRepository.registerUser(first_name, last_name, email, hashedPassword, token, Integer.toString(code));

        //TODO: Send email notification
        MailMessenger.htmlEmailMessenger("no-reply@epay.com", email, "Verify Account", emailBody);

        //TODO: Return to register page
        String successMessage = "Account registered successfully, Please check your email and verify your account";
        registrationPage.addObject("success", successMessage);

        return registrationPage;

    }
}
