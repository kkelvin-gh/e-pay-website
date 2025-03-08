package com.demo_bank_v1.controller;

import com.demo_bank_v1.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController
{
    @Autowired
    private UserRepository userRepository;
    @GetMapping("/")
    public ModelAndView getIndex()
    {
        ModelAndView getIndexPage = new ModelAndView("index");
        getIndexPage.addObject("PageTitle", "Home");
        System.out.println("In Index Controller");
        return getIndexPage;
    }

    @GetMapping("/register")
    public ModelAndView getRegister()
    {
        ModelAndView getRegisterPage = new ModelAndView("register");
        getRegisterPage.addObject("PageTitle", "Register");
        System.out.println("In Register Page Controller");
        return getRegisterPage;
    }

    @GetMapping("/error")
    public ModelAndView getError()
    {
        ModelAndView getErrorPage = new ModelAndView("error");
        getErrorPage.addObject("PageTitle", "Errors");
        System.out.println("In Error Page Controller");
        return getErrorPage;
    }

    @GetMapping("/verify")
    public ModelAndView getVerify(@RequestParam("token") String token, @RequestParam("code") String code)
    {
        ModelAndView getVerifyPage = new ModelAndView("login");

        String dbToken = userRepository.checkToken(token);
        if(dbToken == null)
        {
            getVerifyPage = new ModelAndView("error");
            getVerifyPage.addObject("error", "This session has expired");
            return getVerifyPage;
        }
        userRepository.verifyAccount(token, code);
        getVerifyPage = new ModelAndView("login");
        getVerifyPage.addObject("success", "Account verified Successfully, please login with your account");
        System.out.println("In Verify Page Controller");
        return getVerifyPage;
    }
}
