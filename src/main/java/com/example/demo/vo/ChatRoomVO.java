package com.example.demo.vo;

import java.util.Date;


public class ChatRoomVO {
	private int chat_room_no;
	private int product_no;
	private int from_no;
	private int to_no;
	private Date last_chat_date;
	public int getChat_room_no() {
		return chat_room_no;
	}
	public void setChat_room_no(int chat_room_no) {
		this.chat_room_no = chat_room_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getFrom_no() {
		return from_no;
	}
	public void setFrom_no(int from_no) {
		this.from_no = from_no;
	}
	public int getTo_no() {
		return to_no;
	}
	public void setTo_no(int to_no) {
		this.to_no = to_no;
	}
	public Date getLast_chat_date() {
		return last_chat_date;
	}
	public void setLast_chat_date(Date last_chat_date) {
		this.last_chat_date = last_chat_date;
	}
	public ChatRoomVO(int chat_room_no, int product_no, int from_no, int to_no, Date last_chat_date) {
		super();
		this.chat_room_no = chat_room_no;
		this.product_no = product_no;
		this.from_no = from_no;
		this.to_no = to_no;
		this.last_chat_date = last_chat_date;
	}
	public ChatRoomVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
