package com.example.demo.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.DisplayProductDao;
import com.example.demo.vo.ProductZzimVo;

@Controller
public class DisplayProductsController {
	@Autowired
	private DisplayProductDao dao;	

	public void setDao(DisplayProductDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/")
	public ModelAndView main(String orderField, String sortOrder, @RequestParam @Nullable String categoryNo) {
		ModelAndView mav = new ModelAndView();
		//mapper에서 검색할 때 사용할 컬럼명
		String whereField = null;
		if(orderField!=null && !orderField.equals("product_price")) {
			sortOrder = "desc";
		}
		
		if(categoryNo!=null) {
			whereField = "c.category_no";
			if(categoryNo.endsWith("0")) {
				whereField = "c.category_ref";
			}
		}
		
		mav.addObject("list", dao.getList(orderField, sortOrder, whereField, categoryNo));
		mav.addObject("category", dao.getAllCategory());
		mav.setViewName("main");
		return mav;
	}
	
	@RequestMapping("/product.do")
	public void detail(int productNo, Model model) {
		model.addAttribute("p", dao.getDetail(productNo));
		model.addAttribute("list", dao.getProductImage(productNo));
		model.addAttribute("review", dao.getReviews(productNo));
		dao.updateHit(productNo);
	}
	
	@RequestMapping("/zzim.do")
	@ResponseBody
	public int addZzim(HttpSession session, int productNo) {
		int userNo = (int)session.getAttribute("userNo");
		
		if(dao.getSameZzim(userNo, productNo)==0) {
			ProductZzimVo zzim = new ProductZzimVo();
			zzim.setZzimNo(dao.getZzimCount()+1);
			zzim.setProductNo(productNo);
			zzim.setUserNo(userNo);
			int result = dao.addZzim(zzim);
			return result;
		}else {
			int result = 2;
			return result;
		}
		
	}
	
	@RequestMapping("/search.do")
	public void searchList(String search, Model model) {
		System.out.println(search);
		model.addAttribute("keyword", search);
		model.addAttribute("count", dao.getSearchCount(search));
		model.addAttribute("list", dao.getSearchList(search));
	}
}
