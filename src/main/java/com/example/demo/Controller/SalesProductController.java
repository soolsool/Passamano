package com.example.demo.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.SalesDao;
import com.example.demo.vo.ProductSalesVo;
import com.example.demo.vo.SellerVo;

@Controller
public class SalesProductController {
	
	@Autowired
	private SalesDao dao;

	public void setDao(SalesDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/seller/listSales.do")
	public void list(Model model, HttpSession session) {
		int sellerNo = ((SellerVo)session.getAttribute("sellerInfo")).getSellerNo();
		model.addAttribute("salesList", dao.listSales(sellerNo));	
	}
	
	@RequestMapping("/seller/getlistDateSales.do")
	@ResponseBody
	public List<ProductSalesVo> datelist(String fromDate, String toDate, HttpSession session){
		//System.out.println("시작일"+fromDate);
		//System.out.println("종료일"+toDate);
		int sellerNo = ((SellerVo)session.getAttribute("sellerInfo")).getSellerNo();
		
		HashMap map = new HashMap();
		map.put("fromDate", fromDate);
		map.put("toDate", toDate);
		map.put("sellerNo", sellerNo);
		
		return dao.listDateSales(map);
	}
	
	
	
	@RequestMapping("/seller/listDateSales.do")
	public void datelistform() {
		
		/*
		int sellerNo = ((SellerVo)session.getAttribute("sellerInfo")).getSellerNo();
		
		startDate = request.getParameter("fromDate");
		endDate = request.getParameter("toDate");
		
		SimpleDateFormat transFormat = new SimpleDateFormat("YYYY-mm-DD");
		Date fromDate = transFormat.parse(startDate);
		Date toDate = transFormat.parse(endDate);
		
		HashMap map = new HashMap();
		map.put("fromDate", fromDate);
		map.put("toDate", toDate);
		map.put("sellerNo", sellerNo);
		
		model.addAttribute("saleDateList", dao.listDateSales(map));
		*/
	}
	
}
