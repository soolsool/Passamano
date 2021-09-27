package com.example.demo.Controller;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.ProductDao;
import com.example.demo.vo.ProductImgVo;
import com.example.demo.vo.ProductSelectVo;
import com.example.demo.vo.ProductsVo;

@Controller
@RequestMapping("/seller/updateProduct.do")
public class ProductUpdateController {

	@Autowired
	private ProductDao dao;

	public void setDao(ProductDao dao) {
		this.dao = dao;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public void form(Model model, int productNo) {
		model.addAttribute("d", dao.getProduct(productNo));
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView submit(HttpServletRequest request, ProductSelectVo ps) {
		ModelAndView mav = new ModelAndView("redirect:/seller/listProduct.do");
		String path = request.getRealPath("/resources/images/productimage");
		
		String oldFname = ps.getImageName();
		int oldFsize = ps.getImageSize();
		
		String fname = null;
		int fsize = 0;
		MultipartFile uploadFile = ps.getUploadFile();
		fname = uploadFile.getOriginalFilename();
		if(fname != null && !fname.equals("")) {
			try {
				byte []data = uploadFile.getBytes();
				FileOutputStream fos = new FileOutputStream(path+"/"+fname);
				fos.write(data);
				fos.close();
				fsize = data.length;
				ps.setImageSize(fsize);
				ps.setImageName(fname);
			}catch (Exception e) {
				System.out.println("예외발생:"+e.getMessage());
			}
		}
		int re = dao.updateProduct(ps);
		if(re != 1) {
			mav.addObject("msg", "수정실패");
			mav.setViewName("error");
		}else {
			if(fsize != 0) {
				File file = new File(path+"/"+oldFname);
				file.delete();
			}
		}
		return mav;
	}
}
