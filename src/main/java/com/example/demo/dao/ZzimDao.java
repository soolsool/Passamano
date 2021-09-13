package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;

@Repository
public class ZzimDao {

	public int deleteZzim(int userNo, int zzimNo) {
		return DBManager.deleteZzim(userNo, zzimNo);

	}

	public int insertBasket(int userNo, int productNo) {
		return DBManager.insertBasket(userNo, productNo);
	}

	public int checkBasket(int userNo, int productNo) {
		return DBManager.checkBasket(userNo, productNo);
	}

	public int updateBasket(int userNo, int productNo) {
		return DBManager.updateBasket(userNo, productNo);
	}
}
