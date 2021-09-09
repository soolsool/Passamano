package com.example.demo.vo;

import java.sql.Date;

public class OrdersVo {
	private int ordersNo;
	private int userNo;
	private Date orderDate;
	private int orderTot;
	private int deliveryFee;
	private int payState;
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderTot() {
		return orderTot;
	}
	public void setOrderTot(int orderTot) {
		this.orderTot = orderTot;
	}
	public int getDeliveryFee() {
		return deliveryFee;
	}
	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}
	public int getPayState() {
		return payState;
	}
	public void setPayState(int payState) {
		this.payState = payState;
	}
	public OrdersVo(int ordersNo, int userNo, Date orderDate, int orderTot, int deliveryFee, int payState) {
		super();
		this.ordersNo = ordersNo;
		this.userNo = userNo;
		this.orderDate = orderDate;
		this.orderTot = orderTot;
		this.deliveryFee = deliveryFee;
		this.payState = payState;
	}
	public OrdersVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}