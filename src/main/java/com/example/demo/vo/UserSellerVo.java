package com.example.demo.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class UserSellerVo {
	private int sellerNo;
	private int userNo;
	private String sellerId;
	private String sellerCompany;
	private String sellerCeo;
	private Date sellerDate;
	private String sellerAddress;
	private String sellerFile;
	private MultipartFile uploadFile;
	public int getSellerNo() {
		return sellerNo;
	}
	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getSellerCompany() {
		return sellerCompany;
	}
	public void setSellerCompany(String sellerCompany) {
		this.sellerCompany = sellerCompany;
	}
	public String getSellerCeo() {
		return sellerCeo;
	}
	public void setSellerCeo(String sellerCeo) {
		this.sellerCeo = sellerCeo;
	}
	public Date getSellerDate() {
		return sellerDate;
	}
	public void setSellerDate(Date sellerDate) {
		this.sellerDate = sellerDate;
	}
	public String getSellerAddress() {
		return sellerAddress;
	}
	public void setSellerAddress(String sellerAddress) {
		this.sellerAddress = sellerAddress;
	}
	public String getSellerFile() {
		return sellerFile;
	}
	public void setSellerFile(String sellerFile) {
		this.sellerFile = sellerFile;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public UserSellerVo(int sellerNo, int userNo, String sellerId, String sellerCompany, String sellerCeo,
			Date sellerDate, String sellerAddress, String sellerFile) {
		super();
		this.sellerNo = sellerNo;
		this.userNo = userNo;
		this.sellerId = sellerId;
		this.sellerCompany = sellerCompany;
		this.sellerCeo = sellerCeo;
		this.sellerDate = sellerDate;
		this.sellerAddress = sellerAddress;
		this.sellerFile = sellerFile;
	}
	public UserSellerVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}