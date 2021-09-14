package com.example.demo.vo;

import java.sql.Date;

public class OrderPayVo {
	private int payNo;
	private int payPrice;
	private int orderNo;
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
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
	public OrderPayVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}