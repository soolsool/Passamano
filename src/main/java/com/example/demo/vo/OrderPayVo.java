package com.example.demo.vo;

import java.sql.Date;

public class OrderPayVo {
	private int payNo;
	private int payPrice;
	private int payPoint;
	private int payCoupon;
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
	public int getPayPoint() {
		return payPoint;
	}
	public void setPayPoint(int payPoint) {
		this.payPoint = payPoint;
	}
	public int getPayCoupon() {
		return payCoupon;
	}
	public void setPayCoupon(int payCoupon) {
		this.payCoupon = payCoupon;
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
	public OrderPayVo(int payNo, int payPrice, int payPoint, int payCoupon, int orderNo, String payMethod,
			Date payDate) {
		super();
		this.payNo = payNo;
		this.payPrice = payPrice;
		this.payPoint = payPoint;
		this.payCoupon = payCoupon;
		this.orderNo = orderNo;
		this.payMethod = payMethod;
		this.payDate = payDate;
	}
	public OrderPayVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}