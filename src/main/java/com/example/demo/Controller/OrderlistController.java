package com.example.demo.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.demo.dao.OrderlistDao;

@Controller
public class OrderlistController {
	
	@Autowired
	private OrderlistDao dao;

	public void setDao(OrderlistDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/mypage/updateOrder.do")
	public void deleteOrder(Model model, HttpServletRequest request, HttpSession session, @RequestParam(value = "productNum") int productNo,
			String orderManageReason) {
		int userNo=(int) session.getAttribute("userNo");
		dao.updateOrder(userNo, productNo, orderManageReason);

	}
	
	
}
