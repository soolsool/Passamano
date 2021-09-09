package com.example.demo;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class LoginConfig implements WebMvcConfigurer{
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		//WebMvcConfigurer.super.addInterceptors(registry);
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns("");
	}
	
	//판매자
	/*
	 	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("동작");
		HttpSession session = request.getSession();
		if(session.getAttribute("loginM") != null && ((UserVo)session.getAttribute("loginM")).getGrantNo()==20){
			return super.preHandle(request, response, handler);
			
		}else {
			response.sendRedirect("/login.do");
			return false;
		}
		
		
	}
	 */
}
