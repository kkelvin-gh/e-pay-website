package com.demo_bank_v1.interceptors;

import com.demo_bank_v1.models.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Component
public class AppInterceptor implements HandlerInterceptor
{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception
    {
        System.out.println("In PreHandler Interceptor method");
        if(request.getRequestURI().startsWith("/app"))
        {
            HttpSession session = request.getSession();

            String token = (String)session.getAttribute("token");
            System.out.println(token);

            User user = (User)session.getAttribute("user");
//            boolean isAuthenticated = (boolean) session.getAttribute("authenticated");

            if(token == null || user == null)
            {
                response.sendRedirect("/login");
                return false;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        System.out.println("In PostHandler Interceptor method");

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        System.out.println("In after completion Interceptor method");
    }
}
