package com.demo_bank_v1.config;

import com.demo_bank_v1.interceptors.AppInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@ComponentScan(basePackages = {"com.demo_bank_v1"})
public class AppConfig extends WebMvcConfigurationSupport
{

    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry)
    {
        registry.addResourceHandler("CSS/**","Images/**","JS/**","Components/** ")
                .addResourceLocations("classpath:/static/CSS/", "classpath:/static/Images/", "classpath:/static/JS/","classpath:/static/Components/");
    }

    @Bean
    public InternalResourceViewResolver viewResolver()
    {
        InternalResourceViewResolver jspViewResolver = new InternalResourceViewResolver();
        jspViewResolver.setPrefix("/WEB-INF/jsp/");
        jspViewResolver.setSuffix(".jsp");
        jspViewResolver.setViewClass(JstlView.class);

        return jspViewResolver;
    }

    @Override
    protected void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AppInterceptor()).addPathPatterns("/app/*");
    }
}
