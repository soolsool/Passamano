package com.example.demo.vo;

import java.util.List;

public class OrderCommand {
	private List<OrderDetailVo> orderDetailList;
	private OrderDeliveryVo orderDelivery;
	private OrdersVo orders;
	private OrderPayVo orderPay;
	public List<OrderDetailVo> getOrderDetailList() {
		return orderDetailList;
	}
	public void setOrderDetailList(List<OrderDetailVo> orderDetailList) {
		this.orderDetailList = orderDetailList;
	}
	public OrderDeliveryVo getOrderDelivery() {
		return orderDelivery;
	}
	public void setOrderDelivery(OrderDeliveryVo orderDelivery) {
		this.orderDelivery = orderDelivery;
	}
	public OrdersVo getOrders() {
		return orders;
	}
	public void setOrders(OrdersVo orders) {
		this.orders = orders;
	}
	public OrderPayVo getOrderPay() {
		return orderPay;
	}
	public void setOrderPay(OrderPayVo orderPay) {
		this.orderPay = orderPay;
	}
	@Override
	public String toString() {
		return "OrderCommand [orderDetailList=" + orderDetailList + ", orderDelivery=" + orderDelivery + ", orders="
				+ orders + ", orderPay=" + orderPay + "]";
	}
	
	

	
	
}
