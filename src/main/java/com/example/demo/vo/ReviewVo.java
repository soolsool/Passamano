package com.example.demo.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVo {
	private int reviewNo;
	private int ordersNo;
	private String reviewTitle;
	private String reviewContent;
	private int evaluation;
	private Date reviewDate;
	private String reviewImg;
	private MultipartFile uploadFile;
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
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
	public int getEvaluation() {
		return evaluation;
	}
	public void setEvaluation(int evaluation) {
		this.evaluation = evaluation;
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
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public ReviewVo(int reviewNo, int ordersNo, String reviewTitle, String reviewContent, int evaluation,
			Date reviewDate, String reviewImg) {
		super();
		this.reviewNo = reviewNo;
		this.ordersNo = ordersNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.evaluation = evaluation;
		this.reviewDate = reviewDate;
		this.reviewImg = reviewImg;
	}
	public ReviewVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}