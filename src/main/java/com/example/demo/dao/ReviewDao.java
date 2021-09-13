package com.example.demo.dao;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.ReviewVo;
import com.example.demo.vo.SelectOrdersVo;

@Repository
public class ReviewDao {

	public int deleteReview(int reviewNo) {
		return DBManager.deleteReview(reviewNo);
	}

	public int insertReview(ReviewVo r) {
		return DBManager.insertReview(r);
	}

	public int insertReviewImgNull(ReviewVo r) {
		return DBManager.insertReviewImgNull(r);
	}

	public SelectOrdersVo selectProductDetail(int userNo, int productNo, String orderDate) {
		return DBManager.selectProductDetail(userNo, productNo, orderDate);
	}
}
