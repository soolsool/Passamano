package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;

@Repository
public class BasketDao {

	public int deleteBasket(int userNo, int basketNo) {
		return DBManager.deleteBasket(userNo, basketNo);

	}

	public int getQty(int basketNo) {
		return DBManager.getQty(basketNo);
	}

	public int getProductPrice(int basketNo) {
		return DBManager.getProductPrice(basketNo);
	}
}
