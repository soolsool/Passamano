package com.example.demo.vo;

public class OrderDetailVo {
	private int productNo;
	private int ordersNo;
	private int detailQty;
	private int detailPrice;
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public int getDetailQty() {
		return detailQty;
	}
	public void setDetailQty(int detailQty) {
		this.detailQty = detailQty;
	}
	public int getDetailPrice() {
		return detailPrice;
	}
	public void setDetailPrice(int detailPrice) {
		this.detailPrice = detailPrice;
	}
	public OrderDetailVo(int productNo, int ordersNo, int detailQty, int detailPrice) {
		super();
		this.productNo = productNo;
		this.ordersNo = ordersNo;
		this.detailQty = detailQty;
		this.detailPrice = detailPrice;
	}
	public OrderDetailVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}