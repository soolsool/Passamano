package com.example.demo.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.ProductDao;
import com.example.demo.vo.ProductCategoryVo;

@RestController
public class CategoryController {

	@Autowired
	private ProductDao dao;


	
	public void setDao(ProductDao dao) {
		this.dao = dao;
	}


	@RequestMapping("/listCategory.do")
	public List<ProductCategoryVo> listCategory(){
		List<ProductCategoryVo> list = dao.listcategory();
		System.out.println("controller에서"+list);
		return list;
	}
	
}
