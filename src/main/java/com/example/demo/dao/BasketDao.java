package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;

@Repository
public class BasketDao {

	public int deleteBasket(int userNo, int basketNo) {
		return DBManager.deleteBasket(userNo, basketNo);
	}
	
	public int getQty(int productNo, int userNo) {
		return DBManager.getQty(productNo, userNo);
	}

	public int getProductPrice(int productNo) {
		return DBManager.getProductPrice(productNo);
	}
	
	public int getBasketNo() {
		return DBManager.getBasketNo();
	}
	
	public int insertIntoBasket(int basketNo, int basketQty, int userNo, int productNo) {
		return DBManager.insertIntoBasket(basketNo, basketQty, userNo, productNo);
	}

	public List<Integer> getBasketNo(int productNo) {
		return DBManager.getBasketNo(productNo);
	}

	public String getProductName(int productNo) {
		return DBManager.getProductName(productNo);
	}

	public String getImageName(int productNo) {
		return DBManager.getImageName(productNo);
	}

}
