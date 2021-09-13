package com.example.demo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.example.demo.vo.UserVo;

@Component
public class SellerInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("Seller Interceptor 동작");
		HttpSession session = request.getSession();
		UserVo user = (UserVo)session.getAttribute("loginUser");
		
		if(user==null) {
			response.sendRedirect("/login.do");
			return false;			
		}else {
			int grantNo = (int)session.getAttribute("grantNo");
			if(grantNo==20 || grantNo==30) {
				return super.preHandle(request, response, handler);	
			}else {
				return false;							
			}
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

	
}
