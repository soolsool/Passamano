package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ProductSalesVo;

@Repository
public class SalesDao {
	
	public List<ProductSalesVo> listSales(int sellerNo){
		return DBManager.productSales(sellerNo);
	}
	
	public List<ProductSalesVo> listDateSales(HashMap map){
		return DBManager.productDateSales(map);
	}
	
	
}
