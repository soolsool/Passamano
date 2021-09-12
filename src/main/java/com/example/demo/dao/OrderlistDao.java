package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;

@Repository
public class OrderlistDao {

	public int updateOrder(int userNo, int productNo, String orderManageReason) {
		return DBManager.updateOrder(userNo, productNo, orderManageReason);
	}
}
