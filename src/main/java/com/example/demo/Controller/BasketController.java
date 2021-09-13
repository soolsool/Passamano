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
			@RequestParam(value = "basketNo[]", required = false) List<Integer> basketNo,
			@RequestParam(value = "deliveryFee[]", required = false) List<Integer> deliveryFeeItem) {

		int userNo= (int)session.getAttribute("userNo");
		ArrayList<HashMap> list = new ArrayList<HashMap>();
		int num = basketNo.size();
		for (int i = 0; i < num; i++) {

			HashMap map = new HashMap();
			int basketQty=(int)dao.getQty(basketNo.get(i));
			int productPrice=(int)dao.getProductPrice(basketNo.get(i));
			int deliveryFee=(int) (deliveryFeeItem.get(i));
			map.put("basketNo", (int) (basketNo.get(i)));
			map.put("deliveryFee", deliveryFee);
			map.put("basketQty", basketQty);
			map.put("lastprice", productPrice*basketQty+deliveryFee);
			list.add(map);
			dao.deleteBasket(userNo, (int) (basketNo.get(i)));
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
