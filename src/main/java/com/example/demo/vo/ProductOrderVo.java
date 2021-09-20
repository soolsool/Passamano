package com.example.demo.vo;

import java.util.Date;

public class ProductOrderVo {
	private int ordersNo;
	private String productName;
	private int detailPrice;
	private int orderState;
	private Date orderManageDate;
	private String name;
	private String imageName;
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getDetailPrice() {
		return detailPrice;
	}
	public void setDetailPrice(int detailPrice) {
		this.detailPrice = detailPrice;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public Date getOrderManageDate() {
		return orderManageDate;
	}
	public void setOrderManageDate(Date orderManageDate) {
		this.orderManageDate = orderManageDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public ProductOrderVo(int ordersNo, String productName, int detailPrice, int orderState, Date orderManageDate,
			String name, String imageName) {
		super();
		this.ordersNo = ordersNo;
		this.productName = productName;
		this.detailPrice = detailPrice;
		this.orderState = orderState;
		this.orderManageDate = orderManageDate;
		this.name = name;
		this.imageName = imageName;
	}
	public ProductOrderVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
