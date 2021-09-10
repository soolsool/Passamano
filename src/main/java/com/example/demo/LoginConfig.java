package com.example.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class LoginConfig implements WebMvcConfigurer{

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
			registry.addInterceptor(new UserInterceptor())
			.addPathPatterns("/mypage/*")
			.excludePathPatterns("/seller/*, /admin/*, /member/findId.do, /member.findPwd.do")
			.order(1);

			registry.addInterceptor(new SellerInterceptor())
			.addPathPatterns("/seller/*")
			.excludePathPatterns("/admin/*, /member/findId.do, /member.findPwd.do")
			.order(2);

			registry.addInterceptor(new AdminInterceptor())
			.addPathPatterns("/mypage/*, /seller/*, /admin/*")
			.order(3);
			
	}
}
