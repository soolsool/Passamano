package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.SellerVo;
import com.example.demo.vo.UserVo;

@Repository
public class SellerDao {

	public boolean isUser(String id, String pwd) {
		return DBManager.isUser(id, pwd);
	}
	
	public SellerVo getSeller(String id) {
		return DBManager.getSeller(id);
	}
	
	public UserVo getUser(String id) {
		return DBManager.getUser(id);
	}
}
