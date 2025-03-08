package com.demo_bank_v1.controller;

import com.demo_bank_v1.helpers.Token;
import com.demo_bank_v1.models.User;
import com.demo_bank_v1.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController
{
    @Autowired
    private UserRepository userRepository;
    @GetMapping("/login")
    public ModelAndView getLogin()
    {
        System.out.println("In Login Page Controller");
        ModelAndView getLoginPage = new ModelAndView("login");
        String token = Token.generateToken();
        getLoginPage.addObject("PageTitle", "Login");
        getLoginPage.addObject("token",token);
        return getLoginPage;
    }

    @PostMapping("/login")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        @RequestParam("_token") String token,
                        Model model,
                        HttpSession session)
    {
        if(email == null || email.isEmpty() || password == null || password.isEmpty())
        {
            model.addAttribute("error", "Email or Password cannot be empty");
            return "login";
        }

        //Check if email exists
        String getEmail = userRepository.getUserEmail(email);

        if(getEmail != null)
        {
            String getPassword = userRepository.getUserPassword(getEmail);
            if(!BCrypt.checkpw(password, getPassword))
            {
                model.addAttribute("error", "Incorrect email or password");
                return "login";
            }
        }
        else
        {
            model.addAttribute("error", "Something went wrong, please contact support");
            return "error";
        }


        int verified = userRepository.isVerified(getEmail);

        if(verified != 1)
        {
            String msg = "The account is not verified, please check your email and verify your account";
            model.addAttribute("error", msg);
            return "login";
        }

        User user = userRepository.getUserDetails(getEmail);

        session.setAttribute("user", user);
        session.setAttribute("token", token);
        session.setAttribute("authenticated", "true");

        return "redirect:/app/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes)
    {
        session.invalidate();
        redirectAttributes.addFlashAttribute("logged_out", "Logged Out Successfully");
        return "redirect:/login";
    }
}
