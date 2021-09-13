package com.example.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class LoginConfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
			registry.addInterceptor(new UserInterceptor())
			.addPathPatterns("/mypage/*");

			registry.addInterceptor(new SellerInterceptor())
			.addPathPatterns("/seller/*");

			registry.addInterceptor(new AdminInterceptor())
			.addPathPatterns("/admin/*");
			
	}
}
