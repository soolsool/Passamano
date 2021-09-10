package com.example.demo.vo;

import java.util.Date;

public class SellerVo {

	private int sellerNo;
	private int userNo;
	private String sellerId;
	private String sellerCompany;
	private String sellerCeo;
	private Date sellerDate;
	private String sellerAddress;
	private String sellerFile;
	private String id;
	private String pwd;
	private int grantNo;
	
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getGrantNo() {
		return grantNo;
	}
	public void setGrantNo(int grantNo) {
		this.grantNo = grantNo;
	}
	public SellerVo(int sellerNo, int userNo, String sellerId, String sellerCompany, String sellerCeo, Date sellerDate,
			String sellerAddress, String sellerFile, String id, String pwd, int grantNo) {
		super();
		this.sellerNo = sellerNo;
		this.userNo = userNo;
		this.sellerId = sellerId;
		this.sellerCompany = sellerCompany;
		this.sellerCeo = sellerCeo;
		this.sellerDate = sellerDate;
		this.sellerAddress = sellerAddress;
		this.sellerFile = sellerFile;
		this.id = id;
		this.pwd = pwd;
		this.grantNo = grantNo;
	}
	public SellerVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
