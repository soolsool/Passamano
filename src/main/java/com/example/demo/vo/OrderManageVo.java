package com.example.demo.vo;

import java.sql.Date;

public class OrderManageVo {
	private int orderManageNo;
	private int deliveryState;
	private int orderState;
	private Date orderManageDate;
	private int ordersNo;
	private String orderManageReason;
	public int getOrderManageNo() {
		return orderManageNo;
	}
	public void setOrderManageNo(int orderManageNo) {
		this.orderManageNo = orderManageNo;
	}
	public int getDeliveryState() {
		return deliveryState;
	}
	public void setDeliveryState(int deliveryState) {
		this.deliveryState = deliveryState;
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
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public String getOrderManageReason() {
		return orderManageReason;
	}
	public void setOrderManageReason(String orderManageReason) {
		this.orderManageReason = orderManageReason;
	}
	public OrderManageVo(int orderManageNo, int deliveryState, int orderState, Date orderManageDate, int ordersNo,
			String orderManageReason) {
		super();
		this.orderManageNo = orderManageNo;
		this.deliveryState = deliveryState;
		this.orderState = orderState;
		this.orderManageDate = orderManageDate;
		this.ordersNo = ordersNo;
		this.orderManageReason = orderManageReason;
	}
	public OrderManageVo() {
		super();
		// TODO Auto-generated constructor stub
	}
}