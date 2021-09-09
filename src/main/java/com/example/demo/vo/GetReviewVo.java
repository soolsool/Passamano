package com.example.demo.vo;

public class GetReviewVo {
	private int productNo;
	private String reviewTitle;
	private String reviewContent;
	private int reviewEvaluation;
	private String reviewImg;
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
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
	public String getReviewImg() {
		return reviewImg;
	}
	public void setReviewImg(String reviewImg) {
		this.reviewImg = reviewImg;
	}
	public GetReviewVo(int productNo, String reviewTitle, String reviewContent, int reviewEvaluation,
			String reviewImg) {
		super();
		this.productNo = productNo;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewEvaluation = reviewEvaluation;
		this.reviewImg = reviewImg;
	}
	public GetReviewVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}