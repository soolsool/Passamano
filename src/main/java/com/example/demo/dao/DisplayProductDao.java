package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.GetReviewVo;
import com.example.demo.vo.ProductCategoryVo;
import com.example.demo.vo.ProductListVo;
import com.example.demo.vo.ProductZzimVo;

@Repository
public class DisplayProductDao {
	////메인 페이지에 보여줄 제품 목록 검색
	public List<ProductListVo> getList(HashMap<Object, Object> paraMap){
		System.out.println(paraMap.get("categoryNo"));
		return DBManager.getList(paraMap);
	}
	
	//제품 클릭시 제품 상세페이지에 보여줄 productVo 검색
	public ProductListVo getDetail(int productNo) {
		return DBManager.getDetail(productNo);
	}
	
	//제품 클릭시 제품 상세페이지에 보여줄 제품 이미지 리스트 검색
	public List<String> getProductImage(int productNo){
		return DBManager.getproductImage(productNo);
	}
	
	//제품 클릭시 조회수 추가
	public int updateHit(int productNo) {
		return DBManager.updateHit(productNo);
	}
	
	//제품 클릭 후 상세페이지로 이동할 때 해당 제품 리뷰 검색
	public List<GetReviewVo> getReviews(int productNo){
		return DBManager.getReview(productNo);
	}
	
	//찜하기 버튼 클릭했을 때 Product_zzim 테이블에 데이터 추가
	public int addZzim(ProductZzimVo zzim) {
		return DBManager.addZzim(zzim);
	}
	
	//Product_zzim 테이블에 추가할 때 가장 큰 zzim번호 검색
	public int getZzimCount() {
		return DBManager.getZzimCount();
	}
	
	//메인페이지에 보여줄 카테고리 목록 검색
	public List<ProductCategoryVo> getAllCategory(){
		return DBManager.getAllCategory();
	}
	
	//키워드로 검색할 때 보여줄 제품 리스트
	public List<ProductListVo> getSearchList(String keyword){
		return DBManager.getSeacrhList(keyword);
	}
	
	//검색했을 때 총 건수
	public int getSearchCount(String keyword) {
		return DBManager.getSearchCount(keyword);
	}

	public int getSameZzim(int userNo, int productNo) {
		return DBManager.getSameZzim(userNo, productNo);
	}

	public int cancelZzim(int userNo, int productNo) {
		return DBManager.cancelZzim(userNo, productNo);
	}

	public int getZzim(int productNo) {
		return DBManager.getZzim(productNo);
	}
	
	public int getMaxproduct() {
		return DBManager.getMaxproduct();
	}
	
}
