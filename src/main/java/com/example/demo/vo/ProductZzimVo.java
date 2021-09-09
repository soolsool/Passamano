package com.example.demo.vo;

public class ProductZzimVo {
	
	private int zzimNo;
	private int userNo;
	private int productNo;
	
	public int getZzimNo() {
		return zzimNo;
	}
	public void setZzimNo(int zzimNo) {
		this.zzimNo = zzimNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	
	public ProductZzimVo(int zzimNo, int userNo, int productNo) {
		super();
		this.zzimNo = zzimNo;
		this.userNo = userNo;
		this.productNo = productNo;
	}
	
	public ProductZzimVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
