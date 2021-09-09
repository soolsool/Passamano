package com.example.demo.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.ProductDao;
import com.example.demo.vo.SellerVo;
import com.example.demo.vo.UserVo;

@Controller
public class ProductController {

	@Autowired
	private ProductDao dao;
	
	public void setDao(ProductDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping("/seller/listProduct.do")
	public void list(@RequestParam(value="pageNUM", defaultValue="1") int pageNUM, Model model, HttpSession session) {
		String id = ((UserVo)session.getAttribute("loginM")).getId();
		int sellerNo = ((SellerVo)session.getAttribute("sellerInfo")).getSellerNo();
		
		ProductDao.totalRecord = dao.getTotalRecord(sellerNo);
		ProductDao.totalPage = (int)Math.ceil(
				(double)ProductDao.totalRecord / ProductDao.pageSize);
	
		int start = (pageNUM-1)*ProductDao.pageSize+1;
		int end = start+ProductDao.pageSize-1;
		if(end > ProductDao.totalRecord) {
			end = ProductDao.totalRecord;
		}
		//SellerVo seller = dao2.getSeller(id);
		//int sellerNo = seller.getSellerNo();
		
		System.out.println("start"+start);
		System.out.println("end" + end);
		
		HashMap map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("id", id);
		model.addAttribute("list", dao.listProduct(map));
		model.addAttribute("totalPage", ProductDao.totalPage);
		
	}
}
