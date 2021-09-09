package com.example.demo.vo;

import java.util.Date;

public class SelectReviewVo {
	int ordersNo;
	int reviewNo;
	String reviewTitle;
	String reviewContent;
	int reviewEvaluation;
	Date reviewDate;
	String reviewImg;
	int productNo;
	String productName;
	String imageName;
	int detailQty;
	int payPrice;
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getReviewEvaluation() {
		return reviewEvaluation;
	}
	public void setReviewEvaluation(int reviewEvaluation) {
		this.reviewEvaluation = reviewEvaluation;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public int getDetailQty() {
		return detailQty;
	}
	public void setDetailQty(int detailQty) {
		this.detailQty = detailQty;
	}
	public int getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}
	public SelectReviewVo(int ordersNo, int reviewNo, String reviewTitle, String reviewContent, int reviewEvaluation,
			Date reviewDate, String reviewImg, int productNo, String productName, String imageName, int detailQty,
			int payPrice) {
		super();
		this.ordersNo = ordersNo;
		this.reviewNo = reviewNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewEvaluation = reviewEvaluation;
		this.reviewDate = reviewDate;
		this.reviewImg = reviewImg;
		this.productNo = productNo;
		this.productName = productName;
		this.imageName = imageName;
		this.detailQty = detailQty;
		this.payPrice = payPrice;
	}
	public SelectReviewVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
