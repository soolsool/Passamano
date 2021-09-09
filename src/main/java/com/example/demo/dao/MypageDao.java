package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.SelectBasketVo;
import com.example.demo.vo.SelectOrdersVo;
import com.example.demo.vo.SelectReviewVo;
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
	public int deleteBasket(int userNo, int basketNo) {
		return DBManager.deleteBasket(userNo,basketNo);
		
	}
	public int updateOrder(int userNo, int productNo, String orderManageReason) {
		return DBManager.updateOrder(userNo,productNo,orderManageReason);
	}
	public List<SelectZzimVo> selectZzim(int userNo) {
		return DBManager.selectZzim(userNo);
	}
	public int deleteZzim(int userNo, int zzimNo) {
		return DBManager.deleteZzim(userNo,zzimNo);
		
	}
	public int insertBasket(int userNo, int productNo) {
		return DBManager.insertBasket(userNo,productNo);
	}
	public int checkBasket(int userNo, int productNo) {
		return DBManager.checkBasket(userNo,productNo);
	}
	public int updateBasket(int userNo, int productNo) {
		return DBManager.updateBasket(userNo,productNo);
	}
	public SelectOrdersVo selectProductDetail(int userNo, int productNo, String orderDate) {
		return DBManager.selectProductDetail(userNo,productNo,orderDate);
	}
	public int insertReview(ReviewVo r) {
		return DBManager.insertReview(r);
	}
	public int insertReviewImgNull(ReviewVo r) {
		return DBManager.insertReviewImgNull(r);
	}
	public List<SelectReviewVo> selectReview(int userNo) {
		return DBManager.selectReview(userNo);
	}
	public int deleteReview(int reviewNo) {
		return DBManager.deleteReview(reviewNo);
	}
	public UserVo selectUser(int userNo) {
		return DBManager.selectUser(userNo);
	}
}
