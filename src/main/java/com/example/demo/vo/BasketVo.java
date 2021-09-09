package com.example.demo.vo;

public class BasketVo {
	private int basketNo;
	private int basketQty;
	private int userNo;
	private int productNo;
	public int getBasketNo() {
		return basketNo;
	}
	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}
	public int getBasketQty() {
		return basketQty;
	}
	public void setBasketQty(int basketQty) {
		this.basketQty = basketQty;
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
	public BasketVo(int basketNo, int basketQty, int userNo, int productNo) {
		super();
		this.basketNo = basketNo;
		this.basketQty = basketQty;
		this.userNo = userNo;
		this.productNo = productNo;
	}
	public BasketVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
