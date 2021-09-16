package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.OrderCommand;
import com.example.demo.vo.OrderDeliveryVo;
import com.example.demo.vo.OrderPayVo;
import com.example.demo.vo.OrdersVo;
import com.example.demo.vo.ProductsVo;

@Repository
public class OrderDao {

	public int inserOrder(OrderCommand oc) {
		return DBManager.insertOrder(oc);
	}
	
	public int getOrderNo() {
		return DBManager.getOrderNo();
	}
	
	public int getDeliveryNo() {
		return DBManager.getDeliveryNo();
	}
	
	public int getPayNo() {
		return DBManager.getPayNo();
	}
	
	
}
