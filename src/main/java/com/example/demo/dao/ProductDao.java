package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ProductCategoryVo;
import com.example.demo.vo.ProductImgVo;
import com.example.demo.vo.ProductSelectVo;
import com.example.demo.vo.ProductsVo;
import com.example.demo.vo.SellerVo;

@Repository
public class ProductDao {

	public static int pageSize = 5;
	public static int totalRecord;
	public static int totalPage;
	
	public int getTotalRecord(int sellerNo) {
		return DBManager.getTotalSellRecord(sellerNo);
	}
	
	public int insertProduct(ProductsVo p, ProductImgVo i) {
		return DBManager.insertProduct(p,i);
	}
	
	public int updateProduct(ProductSelectVo ps) {
		return DBManager.updateProduct(ps);
	}
	
	public ProductSelectVo getProduct(int productNo) {
		return DBManager.detailProduct(productNo);
	}
	
	public int getProductNo() {
		return DBManager.productNum();
	}
	
	public int getProductImgNo() {
		return DBManager.productImgNum();
	}

	public List<ProductSelectVo> listProduct(HashMap map){
		return DBManager.productlist(map);
	}
	
	public List<ProductCategoryVo> listcategory(){
		return DBManager.category();
	}
	
	public SellerVo getSellerNo(String id) {
		return DBManager.getSeller(id);
	}
	
}
