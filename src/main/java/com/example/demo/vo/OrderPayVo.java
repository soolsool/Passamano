package com.example.demo.vo;

import java.sql.Date;

public class OrderPayVo {
	private int payNo;
	private int payPrice;
	private int ordersNo;
	private String payMethod;
	private Date payDate;
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public int getPayPrice() {
		return payPrice;
	}
	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public OrderPayVo(int payNo, int payPrice, int ordersNo, String payMethod, Date payDate) {
		super();
		this.payNo = payNo;
		this.payPrice = payPrice;
		this.ordersNo = ordersNo;
		this.payMethod = payMethod;
		this.payDate = payDate;
	}
	public OrderPayVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}