package com.example.demo.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.demo.dao.BasketDao;

@Controller
public class BasketController {

	@Autowired
	private BasketDao dao;

	public void setDao(BasketDao dao) {
		this.dao = dao;
	}
	@RequestMapping("/mypage/basketProcess.do")
	public void orderProcess(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(value = "basketProductNo[]", required = false) List<Integer> productNo,
			@RequestParam(value = "deliveryFee[]", required = false) List<Integer> deliveryFeeItem) {

		int userNo= (int)session.getAttribute("userNo");
		ArrayList<HashMap> list = new ArrayList<HashMap>();
		int num = productNo.size();
		for (int i = 0; i < num; i++) {

			HashMap map = new HashMap();
			map.put("productNo", (int) (productNo.get(i)));
			map.put("deliveryFee", (int) (deliveryFeeItem.get(i)));
			list.add(map);
			dao.deleteBasket(userNo, (int) (productNo.get(i)));
		}

		session.setAttribute("product", list);

	}



	@RequestMapping("/mypage/deleteBasket.do")
	public void deleteBasket(HttpServletRequest request, HttpSession session, @RequestParam(value = "basket[]") List<Integer> basketItem) {

		int userNo= (int)session.getAttribute("userNo");
		for (int i = 0; i < basketItem.size(); i++) {
			dao.deleteBasket(userNo, (int) (basketItem.get(i)));
		}
	}
}
