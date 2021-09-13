package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.SelectBasketVo;
import com.example.demo.vo.SelectOrdersVo;
import com.example.demo.vo.SelectReviewVo;
import com.example.demo.vo.SelectUserDetailVo;
import com.example.demo.vo.SelectZzimVo;
import com.example.demo.vo.UserVo;

@Repository
public class MypageDao {
	public List<SelectOrdersVo> selectAllOrder(int userNo){
		return DBManager.selectAllOrder(userNo);
	}
	public List<SelectBasketVo> selectBasket(int userNo) {
		return DBManager.selectBasket(userNo);
	}
	public List<SelectZzimVo> selectZzim(int userNo) {
		return DBManager.selectZzim(userNo);
	}
	public List<SelectReviewVo> selectReview(int userNo) {
		return DBManager.selectReview(userNo);
	}
	public UserVo selectUser(int userNo) {
		return DBManager.selectUser(userNo);
	}
	public SelectUserDetailVo selectUserDetail(int userNo) {
		return DBManager.selectUserDetail(userNo);
	}
}
