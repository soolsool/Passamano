package com.example.demo.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.SellerDao;
import com.example.demo.vo.SellerVo;
import com.example.demo.vo.UserVo;

@Controller
public class LoginController {

	@Autowired
	private SellerDao dao;

	public void setDao(SellerDao dao) {
		this.dao = dao;
	}
	
	/*
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public void loginForm() {
		
	}
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public ModelAndView loginSubmit(
			HttpSession session, String id, String pwd) {
		ModelAndView mav = new ModelAndView();
		
		if(dao.isUser(id,pwd)) {
			UserVo u = dao.getUser(id);
			SellerVo s = dao.getSeller(id);
			session.setAttribute("loginM", u);
			session.setAttribute("sellerInfo", s);

			//mav.addObject("sellerNo", s.getSellerNo());
			//mav.addObject("id", u.getId());
			mav.setViewName("redirect:/seller/listProduct.do");
		}else {
			mav.setViewName("redirect:/login.do");
		}
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/");
		session.invalidate();
		return mav;
	}
	
	@RequestMapping("/")
	public String listProduct() {
		return "listProduct";
		
	}
	*/
	
}
