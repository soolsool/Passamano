package com.example.demo.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.example.demo.dao.MypageDao;

@Controller
public class MypageController {
	@Autowired
	private MypageDao dao;

	public void setDao(MypageDao dao) {
		this.dao = dao;
	}

	@RequestMapping("/mypage/home.do")
	public void home(Model model, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		model.addAttribute("orderlist", dao.selectAllOrder(userNo));
		model.addAttribute("userInfo", dao.selectUser(userNo));
	}
	
	@RequestMapping("/mypage/profile.do")
	public void profile(Model model, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		model.addAttribute("userInfo", dao.selectUser(userNo));
		model.addAttribute("userDetailInfo",dao.selectUserDetail(userNo));
		
	}
	
	@RequestMapping(value = "/mypage/selectreview.do")
	public void selectReview(Model model, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		model.addAttribute("selectReview", dao.selectReview(userNo));
		model.addAttribute("userInfo", dao.selectUser(userNo));

	}

	@RequestMapping("/mypage/cart.do")
	public void cart(Model model, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		model.addAttribute("basket", dao.selectBasket(userNo));
		model.addAttribute("userInfo", dao.selectUser(userNo));
	}

	@RequestMapping("/mypage/zzim.do")
	public void zzim(Model model, HttpSession session) {
		int userNo=(int) session.getAttribute("userNo");
		model.addAttribute("zzim", dao.selectZzim(userNo));
		model.addAttribute("userInfo", dao.selectUser(userNo));
	}


}
