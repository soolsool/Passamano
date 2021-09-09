package com.example.demo.vo;

import java.util.Date;

public class SelectOrdersVo {
	private int ordersNo;
	private Date orderDate;
	private String productName;
	private int productNo;
	private int detailPrice;
	private int detailQty;
	private int orderTot;
	private int payPrice;
	private String payMethod;
	private int payState;
	private String imageName;
	private int orderState;
	
	
	public int getordersNo() {
		return ordersNo;
	}
	public void setordersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getDetailPrice() {
		return detailPrice;
	}
	public void setDetailPrice(int detailPrice) {
		this.detailPrice = detailPrice;
	}
	public int getDetailQty() {
		return detailQty;
	}
	public void setDetailQty(int detailQty) {
		this.detailQty = detailQty;
	}
	public int getOrderTot() {
		return orderTot;
	}
	public void setOrderTot(int orderTot) {
		this.orderTot = orderTot;
	}
	public int getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getPayState() {
		return payState;
	}
	public void setPayState(int payState) {
		this.payState = payState;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	
	public SelectOrdersVo(Date orderDate, String productName, int productNo, int detailPrice, int detailQty, int orderTot,
			int payPrice, String payMethod, int payState, String imageName, int orderState, int ordersNo) {
		super();
		this.orderDate = orderDate;
		this.productName = productName;
		this.productNo = productNo;
		this.detailPrice = detailPrice;
		this.detailQty = detailQty;
		this.orderTot = orderTot;
		this.payPrice = payPrice;
		this.payMethod = payMethod;
		this.payState = payState;
		this.imageName = imageName;
		this.orderState = orderState;
		this.ordersNo = ordersNo;
	}
	public SelectOrdersVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
