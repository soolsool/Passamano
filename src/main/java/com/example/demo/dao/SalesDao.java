package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ProductOrderVo;
import com.example.demo.vo.ProductSalesVo;
import com.example.demo.vo.SellerVo;

@Repository
public class SalesDao {
	
	public List<ProductSalesVo> listSales(int sellerNo){
		return DBManager.productSales(sellerNo);
	}
	
	public List<ProductSalesVo> listDateSales(HashMap map){
		return DBManager.productDateSales(map);
	}
	
	public List<ProductOrderVo> listOrder(int sellerNo){
		return DBManager.getOrder(sellerNo);
	}
	
	public SellerVo getSellerNo(String id) {
		return DBManager.getSeller(id);
	}
	
	
	
}
