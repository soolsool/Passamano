package com.example.demo.vo;

public class OrderDeliveryVo {
	private int deliveryNo;
	private String receiverName;
	private String receiverPhone;
	private String deliveryAddress1;
	private String deliveryAddress2;
	private String deliveryMsg;
	private String deliveryAddress3;
	private int ordersNo;
	public int getDeliveryNo() {
		return deliveryNo;
	}
	public void setDeliveryNo(int deliveryNo) {
		this.deliveryNo = deliveryNo;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getDeliveryAddress1() {
		return deliveryAddress1;
	}
	public void setDeliveryAddress1(String deliveryAddress1) {
		this.deliveryAddress1 = deliveryAddress1;
	}
	public String getDeliveryAddress2() {
		return deliveryAddress2;
	}
	public void setDeliveryAddress2(String deliveryAddress2) {
		this.deliveryAddress2 = deliveryAddress2;
	}
	public String getDeliveryMsg() {
		return deliveryMsg;
	}
	public void setDeliveryMsg(String deliveryMsg) {
		this.deliveryMsg = deliveryMsg;
	}
	public String getDeliveryAddress3() {
		return deliveryAddress3;
	}
	public void setDeliveryAddress3(String deliveryAddress3) {
		this.deliveryAddress3 = deliveryAddress3;
	}
	public int getOrdersNo() {
		return ordersNo;
	}
	public void setOrdersNo(int ordersNo) {
		this.ordersNo = ordersNo;
	}
	public OrderDeliveryVo(int deliveryNo, String receiverName, String receiverPhone, String deliveryAddress1,
			String deliveryAddress2, String deliveryMsg, String deliveryAddress3, int ordersNo) {
		super();
		this.deliveryNo = deliveryNo;
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
		this.deliveryAddress1 = deliveryAddress1;
		this.deliveryAddress2 = deliveryAddress2;
		this.deliveryMsg = deliveryMsg;
		this.deliveryAddress3 = deliveryAddress3;
		this.ordersNo = ordersNo;
	}
	public OrderDeliveryVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}