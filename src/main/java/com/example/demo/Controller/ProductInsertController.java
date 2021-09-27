package com.example.demo.Controller;

import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ProductDao;
import com.example.demo.vo.ProductCategoryVo;
import com.example.demo.vo.ProductImgVo;
import com.example.demo.vo.ProductsVo;
import com.example.demo.vo.SellerVo;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/seller/insertProduct.do")
public class ProductInsertController {

	@Autowired
	private ProductDao dao;

	public void setDao(ProductDao dao) {
		this.dao = dao;
	}

	@RequestMapping(method=RequestMethod.GET)
	public void form(Model model, HttpSession session) {
	}
	
	@RequestMapping(method=RequestMethod.POST)
	//@ResponseBody
	
	public ModelAndView submit(HttpServletRequest request, ProductsVo p, ProductImgVo i, HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/seller/listProduct.do");
		String path = request.getRealPath("/resources/images/productimage");
		int sellerNo = ((SellerVo)session.getAttribute("sellerInfo")).getSellerNo();
		System.out.println("sellerNo:"+sellerNo);
		int no1 = dao.getProductNo();
		System.out.println("새로운 상품번호:"+no1);
		int no2 = dao.getProductImgNo();
		p.setProductNo(no1);
		i.setProductNo(no1);
		p.setSellerNo(sellerNo);
		i.setImageNo(no2);
		String imageName = null;
		int imageSize = 0;
		
		MultipartFile uploadFile = i.getUploadFile();
		imageName = uploadFile.getOriginalFilename();
		if(imageName != null && !imageName.equals("")) {
			try {
				byte []data = uploadFile.getBytes();
				imageSize = data.length;
				i.setImageName(imageName);
				i.setImageSize(imageSize);
				FileOutputStream fos = new FileOutputStream(path + "/" + imageName);
				fos.write(data);
				fos.close();
			}catch (Exception e) {
				System.out.println("예외발생:"+e.getMessage());
			}
		}else {
			i.setImageName("");
			//i.setImageSize(0);
		}
		System.out.println("OK");
		System.out.println("업로드 파일명"+i.getImageName());
		System.out.println("업로드 파일크기"+i.getImageSize());
		
		
		int re = dao.insertProduct(p,i);
		
		if(re != 1) {
			mav.addObject("msg", "등록실패");
			mav.setViewName("error");
		}
		
		
		return mav;
		
	}
	

}
