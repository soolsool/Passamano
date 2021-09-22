package com.example.demo.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		return mav;
	}
	
	@RequestMapping("/main.do")
	public void main(Model model) {
		model.addAttribute("category", dao.getAllCategory());
	}
	
	@RequestMapping("/getProductList.do") 
	@ResponseBody
	public Map<Object, Object> getProduct(String orderField, String sortOrder, @RequestParam @Nullable String categoryNo, @RequestParam(value = "page", defaultValue = "1") int page){
		int endPage = 0;
		
		String whereField = null;
		if(categoryNo!=null) {
			whereField = "c.category_no";
			if(categoryNo.endsWith("0")) {
				whereField = "c.category_ref";
			}
		}
		int lastOne = dao.getMaxproduct(whereField, categoryNo);
		
		int productPerList = 9;
		if(lastOne%productPerList==0) {
			endPage = lastOne/productPerList;
		}else {
			endPage = lastOne/productPerList + 1;
		}
		
		int end = page * productPerList;
		int start = end - 8;
		
		if(end>lastOne) {
			end = lastOne;
		}
		
		
		HashMap<Object, Object> paraMap = new HashMap<Object, Object>();
		paraMap.put("start", start);
		paraMap.put("end", end);
		paraMap.put("orderField", orderField);
		paraMap.put("sortOrder", sortOrder);
		paraMap.put("whereField", whereField);
		paraMap.put("categoryNo", categoryNo);

		HashMap<Object, Object> resultMap = new HashMap<Object, Object>(); 
		resultMap.put("start", start);
		resultMap.put("end", end);
		resultMap.put("endPage", endPage);
		resultMap.put("list", dao.getList(paraMap));
		resultMap.put("category", dao.getAllCategory());
		return resultMap;
	}
		
	@RequestMapping("/product.do")
	public void detail(Model model, HttpSession session, int productNo) {
		if(session.getAttribute("userNo")!=null) {
			int userNo = (int)session.getAttribute("userNo");			
			model.addAttribute("myzzim",dao.getSameZzim(userNo, productNo));
		}		
		model.addAttribute("p", dao.getDetail(productNo));
		model.addAttribute("list", dao.getProductImage(productNo));
		model.addAttribute("review", dao.getReviews(productNo));
		dao.updateHit(productNo);
	}
	
	@RequestMapping("/zzim.do")
	@ResponseBody
	public HashMap addZzim(HttpSession session, int productNo) {
		int userNo = (int)session.getAttribute("userNo");
		
		if(dao.getSameZzim(userNo, productNo)==0) {
			ProductZzimVo zzim = new ProductZzimVo();
			zzim.setZzimNo(dao.getZzimCount()+1);
			zzim.setProductNo(productNo);
			zzim.setUserNo(userNo);
			
			int result = dao.addZzim(zzim);
			int zzimCount = dao.getZzim(productNo);
			
			HashMap map = new HashMap();
			map.put("result", result);
			map.put("zzim", zzimCount);
			return map;
		}else {
			int result = 2;
			int zzimCount = dao.getZzim(productNo); 
			HashMap map = new HashMap();
			map.put("result", result);
			map.put("zzim", zzimCount);
			return map;
		}
		
	}
	
	@RequestMapping("/getsamezzim.do")
	@ResponseBody
	public int getSameZzim(HttpSession session, int productNo) {
		if(session.getAttribute("userNo")!=null) {
			int userNo = (int)session.getAttribute("userNo");			
			return dao.getSameZzim(userNo, productNo);
		}
		return 0;
	}
	
	@RequestMapping("/cancelzzim.do")
	@ResponseBody
	public HashMap cancelZzim(HttpSession session, int productNo) {		
		int userNo = (int)session.getAttribute("userNo");
		int result = dao.cancelZzim(userNo, productNo);
		int zzim = dao.getZzim(productNo);
		
		HashMap map = new HashMap();
		map.put("result", result);
		map.put("zzim", zzim);
		return map;
	}
	
	@RequestMapping("/search.do")
	public void searchList(String search, Model model) {
		model.addAttribute("keyword", search);
		model.addAttribute("count", dao.getSearchCount(search));
		model.addAttribute("list", dao.getSearchList(search));
	}
}
