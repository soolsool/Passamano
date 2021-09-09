package com.example.demo.vo;

public class SelectZzimVo {
	private String productName;
	private int productPrice;
	private String imageName;
	private int productNo;
	private int zzimNo;
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getZzimNo() {
		return zzimNo;
	}
	public void setZzimNo(int zzimNo) {
		this.zzimNo = zzimNo;
	}
	public SelectZzimVo(String productName, int productPrice, String imageName, int productNo, int zzimNo) {
		super();
		this.productName = productName;
		this.productPrice = productPrice;
		this.imageName = imageName;
		this.productNo = productNo;
		this.zzimNo = zzimNo;
	}
	public SelectZzimVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
