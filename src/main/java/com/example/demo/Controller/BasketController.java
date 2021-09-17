package com.example.demo.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.BasketDao;

@Controller
public class BasketController {

	@Autowired
	private BasketDao dao;

	public void setDao(BasketDao dao) {
		this.dao = dao;
	}
	
//	basketProductNo : checkedValue,
//	deliveryFee : deliveryFee
	
	@RequestMapping("/mypage/basketProcess.do")
	@ResponseBody
	public void orderProcess(Model model, HttpServletRequest request, HttpSession session,
			@RequestParam(value = "basketProductNo[]", required = false) List<Integer> basketProductNo,
			@RequestParam(value = "deliveryFee[]", required = false) List<Integer> deliveryFee) {
		
	
		int userNo= (int)session.getAttribute("userNo");
		
		ArrayList<HashMap> list = new ArrayList<HashMap>();
		int num = basketProductNo.size();
		for (int i = 0; i < num; i++) {

			HashMap map = new HashMap();
			
			//List<Integer> basketNo=dao.getBasketNo(basketProductNo.get(i));
			int basketQty=(int)dao.getQty(basketProductNo.get(i),userNo);			
			int productPrice=(int)dao.getProductPrice(basketProductNo.get(i));
			int deliveryFeeItem=(int) (deliveryFee.get(i));
			String productName=(String)(dao.getProductName(basketProductNo.get(i)));
			String imageName=(String)(dao.getImageName(basketProductNo.get(i)));
			int productNo=(int)(basketProductNo.get(i));
			
			map.put("productNo", productNo);
			map.put("deliveryFee", deliveryFeeItem);
			map.put("basketQty", basketQty);
			map.put("totalPrice", productPrice*basketQty);
			map.put("lastprice", productPrice*basketQty+deliveryFeeItem);
			map.put("productName", productName);
			map.put("imageName", imageName);
			
			list.add(map);
			
		}

		session.setAttribute("product", list);

	}



	@RequestMapping("/mypage/deleteBasket.do")
	public void deleteBasket(HttpServletRequest request, HttpSession session, @RequestParam(value = "basket[]") List<Integer> basketItem) {

		int userNo= (int)session.getAttribute("userNo");
		for (int i = 0; i < basketItem.size(); i++) {
			List<Integer> basketNo=dao.getBasketNo(basketItem.get(i));
			for(int j=0; j<basketNo.size(); j++) {
				dao.deleteBasket(userNo, basketNo.get(j));
			}
		}
	}
	
	@RequestMapping("/mypage/insertBasket.do")
	@ResponseBody
	public int insertBasket(HttpServletResponse response, HttpSession session, int userNo, int productNo, int basketQty) throws IOException {
		if(session.getAttribute("loginUser")==null) {
			response.sendRedirect("login.do");
		}else{
			int basketNo = dao.getBasketNo()+1;
			int result = dao.insertIntoBasket(basketNo, basketQty, userNo, productNo);
			System.out.println(result);
			return result;
		}
		return -1;
	}
	
	@RequestMapping(value="/mypage/goToBasket.do", method = RequestMethod.POST)
	public ModelAndView goToBasket(HttpSession session, int productNo, int basketQty) {
		ModelAndView mav = new ModelAndView();
		int userNo = (int)session.getAttribute("userNo");
		int basketNo = dao.getBasketNo()+1;
		
		int result = dao.insertIntoBasket(basketNo, basketQty, userNo, productNo);
		if(result==1) {
			mav.setViewName("/mypage/cart");
		}else {
			System.out.println("error");
			mav.setViewName("error");
		}
		return mav;
	}

	
	
}
